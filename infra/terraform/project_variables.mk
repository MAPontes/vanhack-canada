TERRAFORM_VERSION=0.11.4
AMI_ID=$(shell aws ec2 describe-images --filters Name=tag-key,Values=app Name=tag-value,Values=myapp --query 'Images[*].{ID:ImageId}' | grep ID| cut -d " " -f10)
