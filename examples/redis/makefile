.PHONY: help build clean environment

help :
	@echo "Usage:"
	@echo "   make environment      - create a cluster and deploy the apps "
	@echo "   make refresh          - updates infrastructure"
	@echo "   make build            - builds and runs app "
	@echo "   make clean           	- delete the AKS cluster and cleans up"

clean :
	cd ../../infrastructure; export RG=`terraform output AKS_RESOURCE_GROUP | tr -d \"` ;\
	rm -rf .terraform.lock.hcl .terraform terraform.tfstate terraform.tfstate.backup .terraform.tfstate.lock.info ;\
	az group delete -n $${RG} --yes || true

build : 
	mvn package && java -jar target/AircraftRedisDemo-0.0.1-SNAPSHOT.jar 

environment : 
	cd ../../infrastructure; terraform init; terraform apply -auto-approve