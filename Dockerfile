FROM php:8.1

#RUN mkdir /var/www/html/flybook
COPY ./web-app/ /var/www/html/
COPY ./api/ /var/www/html/api/
#COPY ./cgi-bin/status_check.cgi /usr/lib/cgi-bin/status_check.cgi
COPY ./cgi-bin/ /usr/lib/cgi-bin/
RUN chmod +x /usr/lib/cgi-bin/status_check

RUN docker-php-ext-install pdo_mysql
RUN a2enmod rewrite
RUN a2enmod cgi
RUN service apache2 restart
RUN chown -R www-data:www-data /var/www
#RUN ln -s /etc/apache2/mods-available/cgi.load /etc/apache2/mods-enabled/

RUN echo "ServerTokens Prod" >> /etc/apache2/apache2.conf && \
    echo "ServerSignature Off" >> /etc/apache2/apache2.conf

EXPOSE 80

