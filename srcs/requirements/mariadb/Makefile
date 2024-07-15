all: build

build:
	docker build -t mariadb:1.0 .

run: build
	docker run --rm --name mariadb --env-file ../../.env --network inception_network -p 3306:3306 -dt mariadb:1.0
	
clean:
	docker stop mariadb
	sleep 5
	docker rmi mariadb:1.0

re: clean all

.PHONY: all clean re
