all:
	cd tools && ./ssl.sh

build:
	docker build -t nginx .

run: all build
	docker run --rm --name nginx -p 443:443 -dt nginx
	
clean:
	$(RM) conf/*.crt conf/*.key
	docker stop nginx
	docker rmi nginx

re: clean all

.PHONY: all clean re
