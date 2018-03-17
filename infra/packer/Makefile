.DEFAULT_GOAL := build

MY_DIR=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

include $(MY_DIR)/project_variables.mk

PACKER=$(shell which packer)
ifeq ("$(PACKER)","")
	PACKER=$(MY_DIR)/bin/packer
endif

setup:
	mkdir -p ./bin
	mkdir -p ./.work
	cd ./.work && curl -LfOs https://releases.hashicorp.com/packer/$(PACKER_VERSION)/packer_$(PACKER_VERSION)_linux_amd64.zip
	unzip .work/packer_$(PACKER_VERSION)_linux_amd64.zip -d ./bin/

test: setup
	cd ./src && $(PACKER) validate ubuntu.json

build: setup
	cd ./src && $(PACKER) build ubuntu.json

clean:
	rm -rf .work/ ./bin

help:
	@echo "Working on it..."