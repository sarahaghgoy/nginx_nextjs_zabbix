FROM nginx
LABEL "Author"="Sara Haghgoy"
LABEL "Project"="Fanap"
COPY default /etc/nginx/sites-available/
COPY nginx.conf /etc/nginx/
RUN mkdir /etc/nginx/sites-enabled/
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/ 
CMD ["nginx", "-g", "daemon off;"]
