# Step 1: Use an official Node.js image to build the React app
FROM node:18 AS build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to install dependencies
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app for production
RUN npm run build

# Step 2: Use an official Nginx image to serve the React app
FROM nginx:alpine

# Copy the build directory from the previous stage to the Nginx public folder
COPY --from=build /app/build /usr/share/nginx/html

# Expose the port that the app will run on
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
