
# Using same node version as with the previous version without nuxt, i tested it and
# older or latest versions does not support PostCSS 8. (throws os dependencies errors)
FROM node:14.5.0-alpine

# If we want to serve our app in a production like environment, the first thing we need to do
# is install a static file server in our container to serve vue generated static files.
RUN npm install -g http-server

# Create workdir
RUN mkdir -p /app
# Set out workdir to frontend.
WORKDIR /app

# Copy the package info file into the root directory.
COPY package.json ./
# Copy the yarn.lock file (or package-lock.json if using npm), this helps to make repeatable envs.
# i prefer using yarn as its way faster than npm.
COPY yarn.lock ./
# Install dependencies
RUN yarn install
# Copy project files into the working directory.
COPY . .
# Generate nuxt static files.
RUN yarn generate
# Expose the port we will be using to serve our app on, no need to define Nuxt port, as we are going to use static target.
EXPOSE 8080
# Serving the app in the same way as the vue app.
CMD [ "http-server", "dist" ]