all:

build:
	docker build -t wordpress .

run: all build
	docker run --rm --name wordpress -p 9001:9001 -dt wordpress
	
clean:
	docker stop wordpress
	docker rmi wordpress

re: clean all

.PHONY: all clean re
