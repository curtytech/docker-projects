echo '
server {
    listen 80;
    server_name _;

    root /var/www/html;
    index index.php index.html index.htm;

    client_max_body_size 100M;

    # 🌐 SITE PRINCIPAL
    location / {
        try_files $uri $uri/ /index.html;
    }

    # 🎓 MOODLE
    # location /moodle/ {
    #     try_files $uri $uri/ /moodle/index.php?$query_string;
    # }

    location ~ ^/moodle/.*\.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass moodle-php:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }

    location ~ /\.ht {
        deny all;
    }
}' > /etc/nginx/conf.d/default.conf


echo ' 
server {
    listen 80;
    server_name _;

    root /var/www/html;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }
}

'  > /etc/nginx/conf.d/default.conf