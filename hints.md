# MVN Command Cheatsheet

## Build and Run
```bash
mvn install
mvn package 
java -jar target/helloworld-0.0.1-SNAPSHOT.jar 
```

## Build
```bash
mvn clean package -DskipTests
java -jar target/accessing-data-mongodb-complete-0.0.1-SNAPSHOT.jar
```

## Build Docker Container 
```bash
mvn spring-boot:build-image
```