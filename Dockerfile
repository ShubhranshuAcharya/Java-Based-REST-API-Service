# Stage 1: Build the application using Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copy pom.xml and download dependencies first to leverage Docker cache
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code and build the application
COPY src ./src
# We skip tests during the build to speed up deployment, but you can remove -DskipTests if you want them to run
RUN mvn clean package -DskipTests

# Stage 2: Create a lightweight image to run the application
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080

# For Render's free tier (512MB RAM), it is highly recommended to set a memory limit.
# Using the shell form of ENTRYPOINT to properly evaluate the $PORT environment variable.
ENTRYPOINT java -Xmx256m -Dserver.port=${PORT:-8080} -jar app.jar
