docker build -t dev-with-docker .
docker run -it --name dev-with-docker dev-with-docker
docker rm dev-with-docker