#Dockertasks

build: ##Build the container
	@docker build -t dev_env .

run: ##Run the container
	@docker run -it --net=host \
	  --user=$(id -u) \
	  -e DISPLAY='$(DISPLAY)' \
	  -e QT_GRAPHICSSYSTEM=native \
	  -e CONTAINER_NAME=ros-kinetic-dev \
	  -e USER='$(USER)' \
	  --workdir=/home/'$(USER)' \
	  -v "$(HOME)/release:/home/$(USER)/release" \
	  -v "/tmp/.X11-unix:/tmp/.X11-unix" \
	  --device=/dev/dri:/dev/dri \
	  --name=dev_env_container \
	  --rm dev_env
