FROM centos:7

LABEL creator="Adarsh"

# Install necessary packages
RUN yum install -y httpd unzip && \
    yum clean all && \
    rm -rf /var/cache/yum

# Download and extract web content
WORKDIR /var/www/html/
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/mediplus-lite.zip .
RUN unzip mediplus-lite.zip && \
    rm mediplus-lite.zip

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["httpd", "-DFOREGROUND"]
