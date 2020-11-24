# Deploy a Multi-node Production Ready Kubernetes Cluster

This folders contains code related to the article "[Deploy Your Own Kubernetes Lab](https://www.marcolancini.it/2019/blog-deploy-kubernetes-lab/)" of the "[Kubernetes Primer for Security Professionals](https://www.marcolancini.it/kubernetes-primer/)" series.



## Environment Setup

| #   | Action                                                                                                                  | Command                                                                                                                          |
| --- | ----------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| 1   | Create 2+ hosts with at least 1.5 GB of memory each, statically assigned IP addresses, and key-based SSH authentication |                                                                                                                                  |
| 2   | Clone the repository                                                                                                    | `host:~/ ❯ git clone https://github.com/marco-lancini/offensive-infrastructure.git`                                              |
| 3   | Get to the `kubespray` folder                                                                                           | `host:~/ ❯ cd offensive-infrastructure/kubernetes/kubespray/`                                                                    |
| 4   | Pull the latest version of `kubespray`                                                                                  | `host:~/kubespray ❯ git submodule update`                                                                                        |
| 5   | Pull pull the `ansible_worker` from the Docker Hub, mounting both the `kubespray` and the `~/.ssh/` folders as volumes  | `host:~/kubespray ❯ docker run -ti --rm -v $(pwd):/kubespray -v ~/.ssh/:/root/.ssh/ ghcr.io/marco-lancini/ansible-worker:latest` |
| 6   | From within the `ansible_worker` container, add the identity configured for the key-based SSH authentication            | `/kubespray $ eval "$(ssh-agent)" && ssh-add ~/.ssh/<k8s_key>`                                                                   |



## Stack Deployment

| #   | Action                                                                      | Command                                                                                                                                                   |
| --- | --------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1   | Install the kubespray dependencies                                          | `/kubespray $ pip3 install -r requirements.txt`                                                                                                           |
| 2   | Create a new inventory starting from the sample                             | `/kubespray $ cp -r inventory/sample inventory/mycluster`                                                                                                 |
| 3   | Update the Ansible inventory file to reflect your setup                     | `/kubespray $ cat inventory/mycluster/inventory.ini`                                                                                                      |
| 4   | Review and change parameters in the `inventory/mycluster/group_vars` folder | `/kubespray $ cat inventory/mycluster/group_vars/all/all.yml` <br> `/kubespray $ cat inventory/mycluster/group_vars/k8s-cluster/k8s-cluster.yml`          |
| 5   | Set the following variables to facilitate interaction with the cluster      | `/kubespray $ cat inventory/mycluster/group_vars/k8s-cluster/k8s-cluster.yml` <br> `...` <br> `kubeconfig_localhost: true` <br> `kubectl_localhost: true` |
| 6   | Run the `cluster.yml` playbook to deploy the cluster                        | `/kubespray $ ansible-playbook -b -v --become-user=root -i inventory/mycluster/inventory.ini -u <USER> --private-key=~/.ssh/<k8s_key> cluster.yml`        |
| 7   | Interact with the cluster                                                   | `host:~/kubespray ❯ kubectl --kubeconfig=./inventory/mycluster/artifacts/admin.conf cluster-info`                                                         |


Additional documentation on the usage of Kubespray can be found on its [Github page](https://github.com/kubernetes-sigs/kubespray).