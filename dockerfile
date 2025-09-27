# Dockerfile
FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production

# Copy application source
COPY . .

# Expose the app port
EXPOSE 3000

# Run the app
CMD ["npm", "start"]
