# define base docker image
 FROM openjdk:11
 LABEL maintainer="Dockerdemo"
 ADD target/DemoCICD-0.0.1-SNAPSHOT.jar dockerdemo.jar
 ENTRYPOINT ["java", "-jar", "dockerdemo.jar"]