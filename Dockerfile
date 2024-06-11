# Brug et basisbillede med Apache
FROM httpd:latest

# Kopier dit webindhold til Apache dokumentroden
COPY ./web-app/ /usr/local/apache2/htdocs/
COPY ./api/ /usr/local/apache2/htdocs/api/
COPY ./cgi-bin/ /usr/local/apache2/cgi-bin/
RUN chmod +x /usr/local/apache2/cgi-bin/status_check

# Eksponér port 80
EXPOSE 80

