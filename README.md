# Ansible Tutorial

## Introduction
Ansible is an open-source IT automation tool that simplifies configuration management, application deployment, and task automation. It allows system administrators to automate repetitive tasks across multiple servers using simple YAML scripts.

## Why Use Ansible?
- Agentless: No need to install software on managed nodes.
- Simple YAML syntax for configuration.
- Idempotent: Ensures consistent state without unwanted changes.
- Scalable: Easily manage hundreds of servers.
- Open-source and widely supported.

## Ansible Components
- **Inventory**: A list of managed nodes (hosts) specified in `/etc/ansible/hosts`, or you can create one and use `-i` to use it.
- **Playbooks**: YAML files containing automation tasks.
- **Modules**: Reusable scripts for performing tasks.
- **Tasks**: Individual actions executed on nodes.
- **Roles**: Collections of playbooks, variables, templates, and handlers.


## Setting Up Inventory
Edit the inventory file `/etc/ansible/hosts` , or create `inventory.ini` file:
```ini
[webservers]
192.168.1.10
192.168.1.11

[dbservers]
192.168.1.20
```

## Running Ad-Hoc Commands
To test Ansible connectivity:
```bash
ansible all -m ping -u username --ask-pass 
# add -i [inventory_name] if you dont want to use the default one
ansible -i inventory.ini myhosts -m ping 
```
To check disk space:
```bash
ansible all -m shell -a 'df -h'
```




