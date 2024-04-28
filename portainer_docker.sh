#!/bin/bash

#
#           ====================================================   YouTube:  https://www.youtube.com/@linuxnetworkinghelp 
#
#           ===================================================  Please Subscribe   === 

# Function to update packages
update_packages() {
    sudo apt-get update
}

# Function to install prerequisites for Docker
install_prerequisites() {
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
}

# Function to add Docker's official GPG key
add_docker_gpg_key() {
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
}

# Function to add Docker repository to apt sources
add_docker_repository() {
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
}

# Function to install Docker
install_docker() {
    sudo apt update
    sudo apt install -y docker-ce
}

# Function to start Docker service
start_docker_service() {
    sudo systemctl start docker
}

# Function to enable Docker service
enable_docker_service() {
    sudo systemctl enable docker
}

# Function to create Portainer volume
create_portainer_volume() {
    sudo docker volume create portainer_data
}

# Function to run Portainer container
run_portainer_container() {
    sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
}

# Function to start Portainer container
start_portainer_container() {
    sudo docker start portainer
}

# Main function to execute all steps
main() {
    update_packages
    install_prerequisites
    add_docker_gpg_key
    add_docker_repository
    install_docker
    start_docker_service
    enable_docker_service
    create_portainer_volume
    run_portainer_container
    start_portainer_container
}

# Execute main function
main
