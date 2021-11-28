include .env
export $(shell sed 's/=.*//' .env)

terraform-init-infrastructure:
	cd infrastructure && terraform init && cd ..

terraform-plan-infrastructure:
	cd infrastructure && \
	terraform plan && \
	cd ..

terraform-apply-infrastructure:
	cd infrastructure && \
	terraform apply && \
	terraform output --json > output.json && \
	cd ..

terraform-destroy-infrastructure:
	cd infrastructure && \
	terraform destroy && \
	cd ..