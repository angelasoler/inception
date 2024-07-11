all:
	mkdir -p home/asoler/data/mariadb
	mkdir -p home/asoler/data/wordpress
	cd srcs/requirements/nginx/tools && ./ssl.sh
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down
	rm -rf srcs/requirements/nginx/conf/asoler* home


clean:
	docker system prune -a