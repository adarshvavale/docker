FROM centos:7
LABEL creater="Adarsh"
#install httpd on system
USER root
RUN yum install httpd -y
RUN systemctl start httpd
#install unzip pkg
RUN yum install unzip -y
RUN rm -rf /var/www/html/* .
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/mediplus-lite.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip mediplus-lite.zip
EXPOSE 80:80
#start the httpd service
CMD httpd -DFOREGROUND
