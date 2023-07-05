# Use a base image with Java and Maven pre-installed

FROM maven:3.8.1-openjdk-11-slim AS build

 

# Set the working directory inside the container

WORKDIR /app

 

# Copy the Maven project files to the container

COPY pom.xml .

COPY src ./src

 

# Build the Maven project

RUN mvn clean package

 

# Use a lightweight base image for the final image

FROM openjdk:11-jre-slim

 

# Set the working directory inside the container

WORKDIR /app

 

# Copy the built JAR file from the previous stage to the container

COPY --from=build /app/myapp.jar .

 

# Expose any necessary ports

EXPOSE 8080

 

# Define the command to run the application

CMD ["java", "-jar", "myapp.jar"]
