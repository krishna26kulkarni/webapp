FROM httpd:2.4
WORKDIR /home/ec2-user/web-app/webapp/
COPY  index.html /usr/local/apache2/htdocs/index.html