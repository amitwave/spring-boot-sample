FROM openjdk:8-jdk-alpine
copy target/wave.jar wave.jar
CMD java -jar wave.jar
expose 8080