mvn package && java -jar target/spring-boot-1.0-SNAPSHOT.jar
mvn package && java -jar target/spring-boot-1.0-SNAPSHOT-spring-boot.jar

mvn install dockerfile:build
mvn dockerfile:push


docker build . -t rest-example

 docker run -p 8080:8080 -it rest-example

