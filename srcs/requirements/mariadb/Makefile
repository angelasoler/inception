all: build

build:
	docker build -t mariadb .

run:
	docker run --rm --name mariadb -p 3306:3306 -dt mariadb
	
clean:
	docker stop mariadb
	docker rmi mariadb

re: clean all

.PHONY: all clean re
