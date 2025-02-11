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

# Build Tailwind CSS
RUN npm run tailwind:build

# Expose port 5173 for Vite dev server
EXPOSE 5173

# Start React development server with Tailwind watch
CMD ["npm", "run", "dev"]