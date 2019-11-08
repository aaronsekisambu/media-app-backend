# stage 1 building the code
FROM node as builder
WORKDIR /usr/media-backend
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build


# stage 2
FROM node:12

LABEL version="1.0"
LABEL project.name="Media app Backend"

# set the current directory to build the app
WORKDIR /usr/media-backend

# Copy the packages from the package.json
COPY package*.json ./

# Install the packages
RUN npm install --production

COPY --from=builder /usr/media-backend/dist ./dist

# Copy the rest of files 
COPY . .

# Exposing the port to run the app.
EXPOSE 3000

# Run the commands to start the app
CMD ["npm", "start"]