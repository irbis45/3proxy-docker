# 3proxy-docker
Download and install Docker via official installation script:
```
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
```
Clone the project code from GitHub repo, build and run new container:
```
git clone https://github.com/revoldver/3proxy-docker.git
cd 3proxy-docker
```
Don't forget to change default username and password in ```.proxyauth``` auth file.

Use native ```docker build``` and ```docker run``` commands to start a container: 
```
docker build -t 3proxy-docker . 
docker run -d -p 8080:8080 -p 3128:3128 --restart=always --privileged=true --name 3proxy 3proxy-docker
```
or install Docker Compose (if needed but recommended, the latest Docker Compose release can be found here: https://github.com/docker/compose/releases):
```
curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```
To start 3proxy service with Docker Compose just run ```docker-compose up -d --build``` in project root:
```
git clone https://github.com/revoldver/3proxy-docker.git
cd 3proxy-docker
nano .proxyauth
docker-compose up -d --build
```

You can always use ```docker ps``` command to check the status of 3proxy container.
