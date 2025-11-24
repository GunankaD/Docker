# imports base image
# node has Node and npm installed
# can do FROM scratch and install everything (Node, npm, Linux) but not followed
FROM node:18

# changes the workdir inside container only
# all the following commands happens in this directory
WORKDIR /app

# first argument is wrt local directory and second is wrt container
# first copy package.json and package-lock.json into /app/ directory
COPY package*.json ./

# Shell style to run
# RUN command only runs during the docker image build
# after copying the package files, we install all the dependencies
# SHELL FORM
RUN npm install 

# after we have dependencies installed, we can copy all other files into our container
# the reason we first copy only the package files, install dependencies and then the rest is
# that we want docker to cache the previous run command
# if we make changes to our project, docker goes to the copy command that actually brought the files that were changed
# and then runs all the commands after it
# so when we copy the package files separately, and make changes to our source code
# this will skip the package files since it was already there before
# and come to this copy command and then reruns every command after this

# COPY . . means copy everything from . (current directory) in our local directory to . (current directory inside app) in container
# its not 
# COPY * . because * only matches files and not folders, . on the other hand copies everything (except stuffs in .dockerignore file) 
COPY . .

# You can override it at runtime using docker run -e PORT=5000 my-app
ENV PORT=8080

# EXPOSE is just a hint for humans (and some tools like Docker Compose) — it's not required to make ports work.
# DockerFile works fine without this command
EXPOSE 8080

# Only one CMD is allowed in a Dockerfile — it's the default command that runs when the container starts.
# This runs at container runtime, not build time.
# In Node apps, npm start looks for the start script in package.json
# CMD = "What do I do when someone runs this container?"
# EXEC FORM
CMD [ "npm", "start" ]