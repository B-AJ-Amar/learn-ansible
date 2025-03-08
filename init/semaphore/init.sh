docker network create semaphore_network

docker run --name semaphore_db \
--network semaphore_network \
-e MYSQL_PASSWORD=c44mkdcsds \
-e MYSQL_USER=semaphore \
-e MYSQL_DATABASE=semaphore \
-e MYSQL_RANDOM_ROOT_PASSWORD=yes \
-v semaphore_mysql:/var/lib/mysql \
-d mysql:latest

docker run --name semaphore \
-p 3000:3000 \
-e SEMAPHORE_DB_DIALECT=mysql \
-e SEMAPHORE_DB_HOST=semaphore_db \
-e SEMAPHORE_DB_NAME=semaphore \
-e SEMAPHORE_DB_USER=semaphore \
-e SEMAPHORE_DB_PASS=c44mkdcsds \
-e SEMAPHORE_ADMIN=admin \
-e SEMAPHORE_ADMIN_PASSWORD=changeme \
-e SEMAPHORE_ADMIN_NAME="Admin" \
-e SEMAPHORE_ADMIN_EMAIL=admin@localhost \
-v semaphore_data:/var/lib/semaphore \
-v semaphore_config:/etc/semaphore \
-v semaphore_tmp:/tmp/semaphore \
--network semaphore_network \
-d public.ecr.aws/semaphore/pro/server:v2.12.4
