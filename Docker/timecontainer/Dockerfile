FROM debian:stable
LABEL "Author"="Sara Haghgoy"
LABEL "Project"="Fanap"
RUN apt update -y && apt install nginx -y
COPY time.sh /root/
RUN chmod 755 /root/time.sh
CMD ["/root/time.sh"]
WORKDIR /var/www/html
