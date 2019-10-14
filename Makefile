##############
# packer-centos-8
##############
OS=$(shell uname -s)

ifeq ($(OS),Darwin)
	ECHO=echo
endif

ECHO?=echo -e

VERSION=$(shell /bin/date +%Y.%m.%d)

.PHONY: check box gui help clean

usage:
	@$(ECHO)
	@$(ECHO) " USAGE:"
	@$(ECHO) "\tmake <target> where <target> is one of the following:"
	@$(ECHO)
	@$(ECHO) " TARGETS:"
	@$(ECHO)
	@$(ECHO) " check\t\tValidate the CentOS 8 template"
	@$(ECHO)
	@$(ECHO) " box\t\tBuild the CentOS 8 BOX"
	@$(ECHO)
	@$(ECHO) " gui\t\tBuild the CentOS 8 BOX with a desktop"
	@$(ECHO) 
	@$(ECHO) " clean\t\tRemove ALL boxes from the builds directory"
	@$(ECHO)
	@$(ECHO)

check:
	@packer validate -var "version=${VERSION}" -var-file 02-builders/vars.json 02-builders/CentOS-8-local.json
	@packer validate -var "version=${VERSION}" -var-file 02-builders/vars.json 02-builders/CentOS-8-cloud.json
	@packer validate -var "version=${VERSION}" -var-file 02-builders/vars.json 02-builders/CentOS-8-gui-local.json
	@packer validate -var "version=${VERSION}" -var-file 02-builders/vars.json 02-builders/CentOS-8-gui-cloud.json

box:
	@packer build 02-builders/CentOS-8-local.json

box-cloud:
	@packer build -var "version=${VERSION}" -var-file 02-builders/vars.json 02-builders/CentOS-8-cloud.json

gui:
	@packer build 02-builders/CentOS-8-gui-local.json

gui-cloud:
	@packer build -var "version=${VERSION}" -var-file 02-builders/vars.json 02-builders/CentOS-8-gui-cloud.json

help: usage

clean:
	@bin/clean.sh
