# Use Node.js base image
FROM node:16

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy project files
COPY . .

# Expose port 5000 for Express server
EXPOSE 5000

# Start server
CMD ["npm", "start"]