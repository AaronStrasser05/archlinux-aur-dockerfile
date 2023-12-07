# archlinux-aur-docker
Official Arch Linux Docker image with AUR (paru), git, and vim

This Dockerfile creates an Arch Linux Docker container with access to the AUR. In addition, it includes git and vim.

## Instructions
1. Navigate to the folder where the Dockerfile is located and build the Docker image with the command `docker buildx build -t IMAGE-NAME .`
2. Then start the container with the command `docker run -it IMAGE-NAME`