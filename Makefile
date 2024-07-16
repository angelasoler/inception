all:
	mkdir -p /home/asoler/data/mariadb
	mkdir -p /home/asoler/data/wordpress
	cd srcs/requirements/nginx/tools && ./ssl.sh
	make up

up:
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

clean: down
	docker system prune -a
	docker volume rm mariadb
	docker volume rm wordpress
	rm -rf srcs/requirements/nginx/conf/asoler* home
	rm -rf /home/asoler

re: clean
	make