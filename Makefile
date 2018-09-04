.PHONY: all clean

build: main.go
	docker build -t tfplan-json .

all: build
	docker run --rm -ti -v $${PWD}/test.tfplan:/data/test.tfplan tfplan-json /data/test.tfplan

clean:
	docker rmi -f tfplan-json
