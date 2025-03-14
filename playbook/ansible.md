# Disable Host Key checking in Ansible

## Add the following line in /etc/ansible/ansible.cfg
```
[defaults]
host_key_checking = False
```

## Add hosts in /etc/ansible/hosts
```
[rpi]
rpi5
rpi401
rpi402

[rpi:vars]
ansible_user=<username>
ansible_password=<password>
ansible_become_password=<password>
```
