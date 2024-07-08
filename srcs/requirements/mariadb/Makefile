all: build

build:
	docker build -t mariadb .

run: build
	docker run --rm --name mariadb -p 3306:3306 -dt mariadb
	
clean:
	docker stop mariadb
	sleep 5
	docker rmi mariadb

re: clean all

.PHONY: all clean re
