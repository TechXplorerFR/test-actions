# Use node as the base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

RUN pwd
RUN ls

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Copy app source
COPY . .

# Build the app
RUN npm run build

# Expose the port
EXPOSE 3000

# Run preview server
CMD ["npm", "run", "preview"]
