# Use a suitable base image (e.g., Ubuntu)
FROM ubuntu:latest

# Install required packages (adjust as needed)
RUN apt-get update && apt-get install -y \
    wget \
    openjdk-8-jre \
    unzip
    

# Download and install PufferPanel
RUN  mkdir -p /var/lib/pufferpanel
     docker volume create pufferpanel-config
     docker create --name pufferpanel -p 8080:8080 -p 5657:5657 -v pufferpanel-config:/etc/pufferpanel -v /var/lib/pufferpanel:/var/lib/pufferpanel -v /var/run/docker.sock:/var/run/docker.sock --restart=on-failure pufferpanel/pufferpanel:latest
     docker exec -it pufferpanel /pufferpanel/pufferpanel user add
    

# Expose port 8080
EXPOSE 8080

# Define environment variables (e.g., admin user credentials)
ENV ADMIN_EMAIL="manitnv840@gmail.com" \
    ADMIN_USERNAME="Legend" \
    ADMIN_PASSWORD="SUNsun7878@7878"

# Set up and run PufferPanel
WORKDIR  /var/lib/pufferpanel
CMD docker start pufferpanel
