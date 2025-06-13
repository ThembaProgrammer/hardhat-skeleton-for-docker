# hardhat-skeleton-for-docker
I created this project so that I can run hardhat node on docker

# Build the image
docker build -t thembalakhengcongo/hardhat-node:latest .

# If you have docker network issues
docker build --network host -t thembalakhengcongo/hardhat-node:latest .

# Test the image locally
docker run -p 8545:8545 thembalakhengcongo/hardhat-node:latest

# Push to Docker Hub (after docker login)
docker login
docker push thembalakhengcongo/hardhat-node:latest

# Optional: Tag with version
docker tag thembalakhengcongo/hardhat-node:latest thembalakhengcongo/hardhat-node:v1.0.0
docker push thembalakhengcongo/hardhat-node:v1.0.0

# Fork mainnet with environment variable
FORK_URL="https://mainnet.infura.io/v3/your-key" docker-compose up

# Or fork polygon
FORK_URL="https://polygon-mainnet.infura.io/v3/your-key" docker-compose up

# Run directly with docker
docker run -p 8545:8545 -e FORK_URL="https://mainnet.infura.io/v3/your-key" thembalakhengcongo/hardhat-node:latest

# test
curl -X POST -H "Content-Type: application/json" \
        --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' \
        http://localhost:8545
{"jsonrpc":"2.0","id":1,"result":"0x0"}⏎                                                                 
~
❯ curl -X POST -H "Content-Type: application/json" \
        --data '{"jsonrpc":"2.0","method":"eth_accounts","params":[],"id":1}' \
        http://localhost:8545

# Fork mainnet from specific block
FORK_URL="https://mainnet.infura.io/v3/your-key" FORK_BLOCK_NUMBER="18500000" docker-compose up

# Using .env file
# FORK_URL=https://mainnet.infura.io/v3/your-key
# FORK_BLOCK_NUMBER=18500000

# Run directly with docker
docker run -p 8545:8545 \
  -e FORK_URL="https://mainnet.infura.io/v3/your-key" \
  -e FORK_BLOCK_NUMBER="22696962" \
  thembalakhengcongo/hardhat-node:v1.1.1

