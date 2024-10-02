# Ansible Cheat Sheet with Docker

## Installation

### Installing Ansible
sudo apt update
sudo apt install ansible -y

### Installing Docker
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

### Installing Docker Python Module
pip install docker

## Configuration

### Ansible Hosts File
Edit the `/etc/ansible/hosts` file to add your Docker hosts.
[local]
localhost ansible_connection=local

[webservers]
web1 ansible_host=192.168.1.100 ansible_user=root
web2 ansible_host=192.168.1.101 ansible_user=root

## Basic Commands

### Check Ansible Version
ansible --version

### Ping All Hosts
ansible all -m ping

### List Hosts
ansible all --list-hosts

### Running Ad-Hoc Commands
ansible all -m shell -a 'uptime'

## Playbooks

### Basic Playbook Structure
---
- name: Example Playbook
  hosts: webservers
  tasks:
    - name: Ensure Docker is running
      service:
        name: docker
        state: started

    - name: Run a Docker container
      docker_container:
        name: my_container
        image: nginx
        state: started
        ports:
          - "80:80"

### Running a Playbook
ansible-playbook playbook.yml

## Roles

### Creating a Role
ansible-galaxy init my_role

### Using a Role in a Playbook
---
- name: Example Playbook with Role
  hosts: webservers
  roles:
    - my_role

## Docker Module Examples

### Pull a Docker Image
- name: Pull an image
  docker_image:
    name: nginx
    source: pull

### Run a Docker Container
- name: Run a container
  docker_container:
    name: my_container
    image: nginx
    state: started
    ports:
      - "80:80"

### Stop and Remove a Docker Container
- name: Stop and remove a container
  docker_container:
    name: my_container
    state: absent

### List Docker Containers
- name: List containers
  docker_host_info:

## Useful Tips

### Check Syntax of Playbook
ansible-playbook playbook.yml --syntax-check

### Dry Run (Check Mode)
ansible-playbook playbook.yml --check

### View Detailed Output
ansible-playbook playbook.yml -v

### Use Vault for Secrets
ansible-vault create secret.yml
ansible-vault edit secret.yml
ansible-playbook playbook.yml --ask-vault-pass
