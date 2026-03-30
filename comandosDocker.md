## Monitorar CPU
htop or top

## Monitorar Memória
free -h

## Pasta de config nginx
 /etc/nginx/conf.d/default.conf




server {
    listen 80;
    server_name _;

    root /var/www/html;
    index index.php index.html index.htm;

    client_max_body_size 100M;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        fastcgi_pass moodle-php:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    location ~ /\.ht {
        deny all;
    }
}

## Listar containers
docker ps

## Verificar uso de espaço 
docker system df

## Local Volumes space usage:
docker system df -v

## Apagar imagens não utilizadas
docker image prune -a


## Entrar em um container 
docker exec -it <container_name> /bin/bash

