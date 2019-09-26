-- run directly from springboot
mvn package && java -jar target/spring-boot-1.0-SNAPSHOT.jar
mvn package && java -jar target/spring-boot-1.0-SNAPSHOT-spring-boot.jar

--build docker image with spotify
mvn install dockerfile:build
mvn dockerfile:push

--run
docker run -p 8080:8080 -it wave/spring-boot:1.0-SNAPSHOT


-- list images
docker image ls

-- build with docker command
docker build . -t wave/spring-boot
docker run -p 8080:8080 -it wave/spring-boot


-- build with fabric8
mvn install docker:build -Pfabric8
docker run -p 8080:8080 -it wave/spring-boot-fabric8



-- browser test url
http://localhost:8080/wave/health-check


