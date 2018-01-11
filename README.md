# docker-tomcat-manager
Sample Docker file for Tomcat with manager

To build:
```docker build --file ./Dockerfile --tag tomcat-manager .```

To run:

```
docker run                                \ 
          --tty                           \ 
          --rm                            \
          --publish 9292:8080             \
          --name tomcat-manager-container \
          tomcat-manager:latest
```

This will allow to access the Tomcat from host on `http://localhost:9292`
