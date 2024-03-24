# Use CentOS 7 as base image
FROM centos:7

# Metadata about the image creator
LABEL creator="Adarsh"

# Install necessary packages (Apache HTTP server and unzip)
RUN yum install -y httpd unzip && \
    yum clean all && \
    rm -rf /var/cache/yum

# Set working directory for subsequent commands
WORKDIR /var/www/html/

# Download and extract web content from a zip file
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/mediplus-lite.zip .

# Unzip the downloaded file and move its contents to the web server directory
RUN unzip mediplus-lite.zip && \
    rm mediplus-lite.zip && \
    mv mediplus-lite/html/* .

# Expose port 1011 (Assuming this is the port Apache will listen on)
EXPOSE 1011

# Start Apache HTTP server in the foreground
CMD ["httpd", "-DFOREGROUND"]
