# Use a suitable base image (e.g., Ubuntu)
FROM ubuntu:latest

# Install required packages (adjust as needed)
RUN apt-get update && apt-get install -y \
    wget \
    openjdk-8-jre \
    unzip

# Download and install PufferPanel
RUN wget -O /tmp/pufferpanel.zip https://pufferpanel.com/pufferpanel-latest.zip && \
    unzip /tmp/pufferpanel.zip -d /srv/pufferpanel

# Copy script to add user
COPY add_user.sh /srv/pufferpanel/add_user.sh

# Expose port 8080
EXPOSE 8080

# Define environment variables (e.g., admin user credentials)
ENV ADMIN_EMAIL="manitnv840@gmail.com" \
    ADMIN_USERNAME="Legend" \
    ADMIN_PASSWORD="SUNsun7878@7878"

# Set up and run PufferPanel
WORKDIR /srv/pufferpanel
CMD ["./pufferpanel", "--no-update"]
