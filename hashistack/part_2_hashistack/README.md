# Offensive Infrastructure: the HashiStack

This folders contains code related to [Part 2](https://www.marcolancini.it/2019/blog-offensive-infrastructure-hashistack/) of the [Offensive Infrastructure with Modern Technologies](https://www.marcolancini.it/offensive-infrastructure/) Series.


## Environment Setup

| # | Action               | Command     |
| --| ----                 | ----------- |
| 1 | Clone the repository | `host:~/ ❯ git clone https://github.com/marco-lancini/offensive-infrastructure.git` |
| 2 | Get to the hashistack folder | `host:~/ ❯ cd offensive-infrastructure/hashistack/part_2_hashistack/` |
| 3 | Edit `Vagrantfile` and change the IP addresses accordingly with your own local network | |
| 4 | Spin up Vagrant machines | `host:~/hashistack ❯ vagrant up` |
| 5 | Build the container for the Ansible worker | `host:~/hashistack ❯ docker build -t ansibleworker:1.0 ansible/` |
| 6 | Run the container while sharing the relevant folders | `host:~/hashistack ❯ docker run -ti --rm -v $(pwd)/ansible:/etc/ansible -v $(pwd)/playbooks:/playbooks ansibleworker:1.0` |
| 7 | Pull the ansible roles | `/playbooks $ ansible-galaxy install --roles-path /etc/ansible/roles -r /etc/ansible/requirements.yml` |


## Stack Deployment

| # | Action               | Command     |
| --| ----                 | ----------- |
| 1 | Change the IP addresses of the `hosts` file accordingly with what you set in the `Vagrantfile` | `/playbooks $ cat /playbooks/inventory/hosts` |
| 2 | Edit the HashiStack playbook and ensure the variables match your setup | `/playbooks $ cat /playbooks/hashistack.yml` |
| 3 | Run the playbook a first time (use any password as Vault password) to deploy Consul+Dnsmasq, Vault, Nomad+Docker, Traefik | `/playbooks $ ansible-playbook hashistack.yml` |
| 4 | Unseal Vault: head to http://192.168.0.111:8200/ and follow the process (remember to store the master key and the root token) | http://192.168.0.111:8200/ |
| 5 | Provide a Vault token to Nomad (remember to store the new password) | `/playbooks $ ansible-vault create /playbooks/inventory/group_vars/docker_instances` <br> `New Vault password:` <br> `Confirm New Vault password:` <br><br> `---` <br> `nomad_vault_token: <Vault Root Token>` |
| 6 | Run the playbook a second time to configure Nomad with the Vault token | `/playbooks $ ansible-playbook hashistack.yml` |
| 7 | Restart the services in order (and then unseal Vault) | `/playbooks $ ansible-playbook restart.yml` |


## Main IP Addresses

| Service  | IP                        | Hostname     |
| -------- | ---------------           | ------------ |
| Consul   | http://192.168.0.111:8500 | http://consul.service.lab.consul:8500 |
| Vault    | http://192.168.0.111:8200 | http://active.vault.service.lab.consul:8200 |
| Nomad    | http://192.168.0.111:4646 | http://nomad-servers.service.lab.consul:4646 |
| Traefik  | http://192.168.0.111:8081 | |


## New Applications Deployment

| # | Action               | Command     |
| --| ----                 | ----------- |
| 1 | Create a Nomad job description | `playbooks/apps/APPNAME.nomad` |
| 2 | Add a new task in the `playbooks/apps.yml` playbook following the example | `playbooks/apps.yml` |
| 3 | Run the apps playbook | `/playbooks $ ansible-playbook apps.yml` |


## Environment teardown

| # | Action               | Command     |
| --| ----                 | ----------- |
| 1 | Destroy the Vagrant machines | `host:~/hashistack ❯ vagrant destroy` |