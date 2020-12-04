FROM openjdk:8-jdk-alpine
copy target/wave.war wave.war
CMD java -jar wave.war
expose 8080