.DEFAULT_GOAL := build

MY_DIR=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

include $(MY_DIR)/project_variables.mk

PACKER=$(shell which packer)
ifeq ("$(PACKER)","")
	PACKER=$(MY_DIR)/bin/packer
endif

aws:
	sudo apt-get install -y awscli

setup:
	mkdir -p ./bin
	mkdir -p ./.work
	cd ./.work && curl -LfOs https://releases.hashicorp.com/packer/$(PACKER_VERSION)/packer_$(PACKER_VERSION)_linux_amd64.zip
	unzip .work/packer_$(PACKER_VERSION)_linux_amd64.zip -d ./bin/

test:
	cd ./src && aws s3 cp s3://vanhack-test-deploy/string_calculator.tgz .
	cd ./src && $(PACKER) validate ubuntu.json

build: setup aws test
	cd ./src && $(PACKER) build ubuntu.json

clean:
	rm -rf .work/ ./bin \
	./src/string_calculator.tgz

help:
	@echo "Working on it..."
