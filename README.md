#  Speedy NGINX

## Requirements
- Debian 9.x "stretch"
- Minimum 1 CPU, 3 GB Ram

## Install
Clone the repository and enter the directory:
```
cd
git clone https://github.com/cthach/nginx-reverse-proxy.git
cd nginx-reverse-proxy
```

**HTTPS only**, install an openssl dependency (optional):
```
sudo apt install libssl-dev
```

Build latest NGINX from source and compile with modules:
```
bash <(curl -f -L -sS https://ngxpagespeed.com/install) \
     --nginx-version latest
```

For HTTPS and HTTP/2.0, when prompted for extra configure options (optional):
```
--with-http_ssl_module --with-http_v2_module
```

Backup default config and copy over optimized config:
```
sudo mv /usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx.conf.bak
```

**HTTP only**
```
sudo cp ./conf/nginx_http.conf /usr/local/nginx/conf/nginx.conf
```

**HTTPS only**
```
sudo cp ./conf/nginx_https.conf /usr/local/nginx/conf/nginx.conf
```

Copy init.d script to control NGINX:
```
sudo cp ./init.d/nginx /etc/init.d/nginx
```

**HTTPS only**: Generate Diffie-Hellman parameters
```
sudo mkdir /usr/local/nginx/ssl
sudo chmod 755 /usr/local/nginx/ssl
openssl dhparam 2048 -out /usr/local/nginx/ssl/dh2048.pem
sudo chmod -R 755 /usr/local/nginx/ssl
```

**HTTPS only**: Get an SSL certificate
- Let's Encrypt offers [free SSL certificates](https://letsencrypt.org/)

Configure your NGINX config
```
sudo nano /usr/local/nginx/conf/nginx.conf
```

Test your config for syntax errors
```
sudo /usr/local/nginx/sbin/nginx -t
```

Make executable and start NGINX :
```
sudo chmod 755 /etc/init.d/nginx
sudo /etc/init.d/nginx start
```
