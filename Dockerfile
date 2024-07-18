FROM node:16

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the application files to the container
COPY /static .

# Install a simple web server to serve the AngularJS application
RUN npm install -g http-server

# Expose port 8080 to be used by the web server
EXPOSE 80

# Command to run the application using http-server
CMD ["http-server", ".", "-p", "80"]