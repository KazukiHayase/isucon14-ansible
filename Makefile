ANSIBLE_INVENTORY_FILENAME:=inventory.yml
ANSIBLE_SETUP_FILENAME:=setup.yml
ANSIBLE_DEPLOY_FILENAME:=rakko.yml

.PHONY: init
init:
	brew install ansible
	ansible-galaxy install newrelic.newrelic_install
	ansible-galaxy collection install ansible.windows ansible.utils

.PHONY: ping
ping:
	ansible -i inventory.yml all -m ping

.PHONY: setup
setup:
	ansible-playbook -i $(ANSIBLE_INVENTORY_FILENAME) $(ANSIBLE_SETUP_FILENAME)

# e.g. make deploy branch=main
# default branch
branch:=main
.PHONY: deploy
deploy:
	ansible-playbook -i $(ANSIBLE_INVENTORY_FILENAME) $(ANSIBLE_DEPLOY_FILENAME) -e "branch=$(branch)"
