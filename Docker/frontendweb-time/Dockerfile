FROM debian:stable
LABEL "Author"="Sara Haghgoy"
LABEL "Project"="Fanap"
RUN apt update -y && apt install nginx -y
RUN mkdir /var/www/time
COPY nginx.conf /etc/nginx/
COPY time.sh /root/
RUN chmod 755 /root/time.sh
CMD ["/root/time.sh"]
WORKDIR /var/www/html
