FROM wernight/alpine-nginx-pagespeed

COPY conf/nginx_http.conf /etc/nginx/nginx.conf

EXPOSE 80
