FROM openjdk:8-jdk-alpine
copy target/spring-boot-1.0-SNAPSHOT-spring-boot.jar spring-boot-1.0-SNAPSHOT-spring-boot.jar
CMD java -jar spring-boot-1.0-SNAPSHOT-spring-boot.jar
expose 8080