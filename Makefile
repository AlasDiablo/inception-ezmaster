build:
	docker build -t alasdiablodocker/inception-ezmaster:1.2.0 .

run-docker:
	docker build -t alasdiablodocker/inception-ezmaster:1.2.0 .
	docker run -p 8080:8080 'alasdiablodocker/inception-ezmaster:1.2.0'
