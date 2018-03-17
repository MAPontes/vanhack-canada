.DEFAULT_GOAL := build

MY_DIR=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

include $(MY_DIR)/project_variables.mk

TERRAFORM=$(shell which terraform)
ifeq ("$(TERRAFORM)","")
	TERRAFORM=$(MY_DIR)/bin/terraform
endif

init: setup
	cd ./src && $(TERRAFORM) init

setup:
	mkdir -p ./bin
	mkdir -p ./.work
	cd ./.work && curl -LfOs https://releases.hashicorp.com/terraform/$(TERRAFORM_VERSION)/terraform_$(TERRAFORM_VERSION)_linux_amd64.zip
	unzip .work/terraform_$(TERRAFORM_VERSION)_linux_amd64.zip -d ./bin/

test: init
	cd ./src && $(TERRAFORM) validate

build: init apply


apply:
	cd ./src && $(TERRAFORM) apply

clean:
	rm -rf .work/ ./bin
	cd ./src && rm -rf .terraform

help:
	@echo "Working on it..."
