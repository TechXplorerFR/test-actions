# Use node as the base image
FROM node:23-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY Code/Frontend/package.json Code/Frontend/package-lock.json ./

# Install dependencies
RUN npm i

# Copy app source
COPY Code/Frontend ./

# Build the app
RUN npm run build

# Expose the port
EXPOSE 4173

# Run preview server
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"]
