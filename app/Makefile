.DEFAULT_GOAL := build

MY_DIR=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

setup:
	sudo apt-get install awscli -y

build: setup
	cd ./src && tar cvzf string_calculator.tgz string_calculator.rb
	cd ./src && aws s3 cp string_calculator.tgz s3://vanhack-test-deploy/string_calculator.tgz

clean:
	rm -f ./src/string_calculator.tgz
