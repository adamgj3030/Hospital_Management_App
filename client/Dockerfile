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

# Expose port 3000 for React dev server
EXPOSE 3000

# Start React development server
CMD ["npm", "start"]