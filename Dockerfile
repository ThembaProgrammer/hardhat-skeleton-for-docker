# Use Node.js Alpine for smaller image size
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install git (if needed for any dependencies)
RUN apk add --no-cache git

# Copy package files first for better caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all project files
COPY . .

# Create a non-root user for security
RUN addgroup -g 1001 -S hardhat && \
    adduser -S hardhat -u 1001 -G hardhat && \
    chown -R hardhat:hardhat /app

# Switch to non-root user
USER hardhat

# Expose Hardhat default port
EXPOSE 8545

# Health check to ensure the service is running
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8545 || exit 1

# Default command to start Hardhat node
CMD ["sh", "-c", "if [ -n \"$FORK_URL\" ]; then FORK_CMD=\"npx hardhat node --hostname 0.0.0.0 --fork $FORK_URL\"; if [ -n \"$FORK_BLOCK_NUMBER\" ]; then FORK_CMD=\"$FORK_CMD --fork-block-number $FORK_BLOCK_NUMBER\"; fi; eval $FORK_CMD; else npx hardhat node --hostname 0.0.0.0; fi"]