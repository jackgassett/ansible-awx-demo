#!/bin/bash

ssh-keygen -t rsa -b 2048 -N "" -f /root/.ssh/id_rsa
echo "Enter "root" for the root password prompt below"
ansible-playbook deploy_authorized_keys.yml --ask-pass --extra-vars='pubkey="<pubkey>"'
awx-manage inventory_import --source=/etc/ansible/hosts --inventory-name="Demo Inventory"
cd /root
git clone https://github.com/jackgassett/ansible-playbooks.git