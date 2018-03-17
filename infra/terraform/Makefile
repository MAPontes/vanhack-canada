.DEFAULT_GOAL := build

MY_DIR=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
AMI_ID=$(shell aws ec2 describe-images --filters Name=tag-key,Values=app Name=tag-value,Values=myapp --query 'Images[*].{ID:ImageId}' | grep ID| cut -d " " -f10)

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
	cd ./src && $(TERRAFORM) validate -var  "ami_id=$(AMI_ID)"

build: init apply


apply:
	cd ./src && $(TERRAFORM) apply -var "ami_id=$(AMI_ID)" -input=false -auto-approve

clean:
	rm -rf .work/ ./bin
	cd ./src && rm -rf .terraform

help:
	@echo "Working on it..."
