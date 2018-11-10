#!/bin/sh
docker build -t dev-with-docker .
docker run -it dev-with-docker
