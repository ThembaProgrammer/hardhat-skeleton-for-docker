# hardhat-skeleton-for-docker
I created this project so that I can run hardhat node on docker

# Build the image
docker build -t thembaprogrammer/hardhat-node:latest .

# Test the image locally
docker run -p 8545:8545 thembaprogrammer/hardhat-node:latest

# Push to Docker Hub (after docker login)
docker login
docker push thembaprogrammer/hardhat-node:latest

# Optional: Tag with version
docker tag thembaprogrammer/hardhat-node:latest thembaprogrammer/hardhat-node:v1.0.0
docker push thembaprogrammer/hardhat-node:v1.0.0