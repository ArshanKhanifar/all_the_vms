ifneq ("$(wildcard .env)","")
    include .env
endif

show-secret:
	echo $(arshan)

IMAGE_TYPE:=ubuntu-20-04-x64
SIZE:=s-1vcpu-2gb
REGION:=nyc1
DROPLET_NAME:=arshans-vm

create-droplet:
	doctl compute droplet create \
		--image $(IMAGE_TYPE) \
		--size $(SIZE) \
		--region $(REGION) \
		$(DROPLET_NAME)

encrypt:
	@read -s -p "Enter encryption password: " password; \
	openssl enc -aes-256-cbc -salt -iter 10000 -in .env -out encrypted.env -pass pass:"$$password"; \
	echo "File encrypted successfully."

decrypt:
	@read -s -p "Enter decryption password: " password; \
	openssl enc -aes-256-cbc -d -salt -iter 10000 -in encrypted.env -out .env -pass pass:"$$password"; \
	echo "File decrypted successfully."
