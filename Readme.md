-- run directly from springboot
mvn package && java -jar target/spring-boot-1.0-SNAPSHOT.jar
mvn package && java -jar target/spring-boot-1.0-SNAPSHOT-spring-boot.jar

--build docker image with spotify
mvn install dockerfile:build -Pspotify
mvn dockerfile:push

--run after using spotify profile
docker run -p 8080:8080 -it wave/spring-boot:1.0-SNAPSHOT


-- list images
docker image ls

-- build with docker command
docker build . -t wave/spring-boot
docker run -p 8080:8080 -it wave/spring-boot


-- build and run with fabric8
mvn install docker:build -Pfabric8
docker run -p 8080:8080 -it wave/spring-boot-fabric8



-- browser test url
http://localhost:8080/wave/health-check



docker login docker.io

docker tag  cb428c95f2dd $DOCKER_HUB_USER/rest-example

eval $(minikube docker-env)
docker tag  0232504d32e5 $DOCKER_HUB_USER/wave/spring-boot-fabric8

-- setup kubernetes
-- create services.yml
    kubectl create -f kubernetes/services.yml
-- see all services
    kubectl get services --all-namespaces


-- create deployment:
kubectl create -f kubernetes/deployment.yml



minikube service rest-example --url

