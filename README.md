# Setup and Installation
https://github.com/StanfordVL/iGibson/issues/57

# Benchmark
On the local computer, I followed these instructions and executed these steps. 
* `https://docs.nvidia.com/cuda/wsl-user-guide/index.html#installing-docker`
  - `distribution=$(. /etc/os-release;echo $ID$VERSION_ID)`
  - `curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -`
  - `curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list`
  - `sudo apt-get update`
  - `sudo apt-get install -y nvidia-docker2`
  
* These steps confirm that the GPU is able to be exercised by the docker image.
* `docker run -it --rm --gpus all ubuntu nvidia-smi`
* `docker run --gpus all nvcr.io/nvidia/k8s/cuda-sample:nbody nbody -gpu -benchmark`

# Misc notes

## Docker
* Make sure to not use the `snap` install method, but *do* use `apt-get` for docker. 
* To avoid having to type `sudo` to run docker commands, on Ubuntu 20.04,
  - `sudo groupadd docker`
  - `sudo usermod -aG docker ${USER}`
  - restart computer to log out/log back in

# Development
For compiling CUDA code, we need access to `nvcc`. c.f. https://github.com/NVIDIA/nvidia-docker/issues/1160

# Docker only:
`docker build -t local/d .` (-t is the image tag, one can use any name)
`docker image ls` - will show the image (named `local/d`).   
`docker run --gpus all local/d `, will run `hello_world.cu` then exit.   
`docker run -it --rm --gpus all local/d /bin/bash` will run a bash shell of the local/d image.   

# Docker-Compose and CUDA
* For reference, see [here](https://docs.docker.com/compose/gpu-support/)
* `docker-compose build`
* `docker-compose up` will run the `hello_world.cu` code.
* `docker-compose run --rm helloworld nvidia-smi --query-gpu=gpu_name --format=csv` will have the GPU configured for use. 

