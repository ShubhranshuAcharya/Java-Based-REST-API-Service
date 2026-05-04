# Cloud-Deployed Product Management REST API 🚀

[![Java](https://img.shields.io/badge/Java-17-orange.svg)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2.5-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![Docker](https://img.shields.io/badge/Docker-Containerized-blue.svg)](https://www.docker.com/)
[![Render](https://img.shields.io/badge/Render-Deployed-purple.svg)](https://render.com/)

A production-ready, enterprise-grade RESTful Web Service built with Java and Spring Boot. This project serves as the backend engine for a product catalog, demonstrating clean n-tier architecture, robust data validation, containerization, and cloud deployment.

---

## 🌍 Live Demonstration
The API is currently containerized via Docker and deployed live on Render. 
You can interact with the live API here: 
👉 **[https://java-based-rest-api-service-1.onrender.com/api/products](https://java-based-rest-api-service-1.onrender.com/api/products)**

*(Note: The database is in-memory. If the server sleeps on the free tier, data resets).*

---

## 🏗️ Architecture & Tech Stack

This project follows a strict **Controller-Service-Repository** architectural pattern to ensure separation of concerns and maintainability.

*   **Core:** Java 17, Spring Boot 3.2.5
*   **Web Layer:** Spring Web (REST Controllers, Global Exception Handling)
*   **Data Layer:** Spring Data JPA, Hibernate, H2 In-Memory Database
*   **Validation:** Spring Boot Starter Validation (JSR-380)
*   **DevOps:** Docker (Multi-stage builds, Layer Caching), Maven

---

## 🚀 Getting Started (Local Development)

### Prerequisites
*   [Java 17](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html) or higher
*   [Maven](https://maven.apache.org/) (Optional, wrapper included)
*   [Docker](https://www.docker.com/) (If running via container)

### Option 1: Running with Maven (Standard)
1. Clone the repository and navigate to the project root.
2. Run the application using the Maven wrapper:
   ```bash
   mvnw spring-boot:run
   ```
3. The API will be available at `http://localhost:8080/api/products`

### Option 2: Running with Docker (Containerized)
1. Build the Docker image:
   ```bash
   docker build -t java-rest-api .
   ```
2. Run the Docker container:
   ```bash
   docker run -p 8080:8080 java-rest-api
   ```

---

## 🧪 How to Test the API

Since this is a Backend API, it doesn't have a frontend interface. You can interact with it using tools like **Postman**, **Hoppscotch**, or standard terminal commands.

### Create a Product (POST)
To add a product to the database, send a POST request with JSON data.

**Using cURL / PowerShell:**
```bash
curl -X POST https://java-based-rest-api-service-1.onrender.com/api/products \
-H "Content-Type: application/json" \
-d "{\"name\":\"Gaming Laptop\", \"price\":1299.99, \"description\":\"High-end gaming laptop\"}"
```

### View All Products (GET)
**Using your Browser:**
Simply navigate to: `https://java-based-rest-api-service-1.onrender.com/api/products`

**Using cURL:**
```bash
curl https://java-based-rest-api-service-1.onrender.com/api/products
```

---

## 📖 Complete API Reference

Base URL: `/api/products`

| HTTP Method | Endpoint | Description | Request Body | Success Response |
| :--- | :--- | :--- | :--- | :--- |
| `GET` | `/` | Retrieve all products | None | `200 OK` (JSON Array) |
| `GET` | `/{id}` | Retrieve product by ID | None | `200 OK` (JSON Object) |
| `POST` | `/` | Create a new product | JSON Object | `201 Created` |
| `PUT` | `/{id}` | Update an existing product | JSON Object | `200 OK` |
| `DELETE` | `/{id}` | Delete a product | None | `204 No Content` |

---

## 🛡️ Validation & Error Handling
The application features global exception handling. If you attempt to send invalid data (e.g., a negative price or a blank name), the API intercepts the bad request and returns a structured `400 Bad Request` JSON response detailing exactly which fields failed validation.
