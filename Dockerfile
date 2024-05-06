# Use a base image, for example, Ubuntu
FROM ubuntu:latest

# Set a working directory inside the container
WORKDIR /app

# Install curl and other utilities
RUN apt-get update && \
    apt-get install -y curl gnupg

# Install PufferPanel
RUN curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | sudo bash && \
    apt-get install -y pufferpanel

# Enable PufferPanel service
RUN systemctl enable pufferpanel

# Add a user to PufferPanel
RUN pufferpanel user add --email foxytoux@gmail.com --name foxytoux --password Fox21200 --admin

# Expose port 8080 (if your application needs it)
EXPOSE 8080

# Specify the command to run your application or PufferPanel
CMD ["pufferpanel", "start"]
