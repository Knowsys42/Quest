#Selected latest node image based on requirements
FROM node:latest
#Set working directory of container
WORKDIR /usr/src/app
#Copying package.json to the working directory of the container
COPY package*.json ./
# NPM Install to build the APP
RUN npm install
# Copying the contents of the repo into the working directory
COPY . .
# Exposing port 3000 to allow port forwarding to localhost
EXPOSE 3000
# Running Node command to use the file 000.js
CMD ["node","src/000.js"]