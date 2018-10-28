# ANSIBLE

## Installation

```
$ service ssh start
$ sudo apt install sshpass python-pip
$ sudo pip install ansible

# Create user vagrant
$ adduser vagrant
$ usermod -aG sudo vagrant
$ ssh vagrant@127.0.0.1

# At the end, remove user
userdel vagrant
```

## Manage Server

* Specify hosts
```
$ cat /etc/ansible/hosts
  [local]
  127.0.0.1
```

* Run test command
```
$ ansible all -m ping -s -k -u vagrant --ask-sudo-pass
#     -m <module>	= run module
#     -s	        = sudo
#     -k	        = ask for password
#     -u <user>	  = run as user
```

* Run playbook
```
ansible-playbook -s -k -u vagrant --ask-sudo-pass nginx.yml
```

## Roles

```
$ cat /etc/ansible/ansible.cfg
  [defaults]
  roles_path    = /vagrant/ansible/roles

$ cat server.yml
    ---
    - hosts: all
      roles:
        - nginx

$ ansible-playbook -s -k -u vagrant --ask-sudo-pass server.yml
```
