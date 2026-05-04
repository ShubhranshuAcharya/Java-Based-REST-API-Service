# Java-Based REST API Service

A simple, yet robust Spring Boot REST API for managing a product catalog. This project demonstrates core web development concepts with Spring Boot, including RESTful routing, data persistence using Spring Data JPA, and data validation.

## Tech Stack

*   **Java 17**
*   **Spring Boot 3.2.5**
    *   Spring Web (REST endpoints)
    *   Spring Data JPA (Data access)
    *   Spring Boot Validation (Input validation)
*   **H2 Database** (In-memory database for testing/development)
*   **Maven** (Dependency management and build tool)

## Features

*   **CRUD Operations:** Create, Read, Update, and Delete products.
*   **Data Validation:** Ensures data integrity (e.g., required fields, minimum length, non-negative price).
*   **Exception Handling:** Custom exception handler for validation errors, returning structured bad request responses.
*   **H2 Console:** Embedded database console accessible from a browser.

## Project Structure

*   `model/Product.java`: Defines the Product entity and its validation rules.
*   `controller/ProductController.java`: Handles incoming HTTP requests and routes them to the service layer.
*   `service/ProductService.java` & `repository/ProductRepository.java`: Manages business logic and data access.

## Prerequisites

*   Java Development Kit (JDK) 17 or higher
*   Maven

## Running the Application

1.  Clone the repository or download the source code.
2.  Navigate to the project directory in your terminal.
3.  Run the application using the Maven wrapper or your local Maven installation:

    ```bash
    mvn spring-boot:run
    ```

    *Alternatively, you can build the JAR file and run it:*

    ```bash
    mvn clean install
    java -jar target/demo-0.0.1-SNAPSHOT.jar
    ```

The application will start on `http://localhost:8080`.

## API Endpoints

The API is accessible at `http://localhost:8080/api/products`.

### Get All Products
*   **URL:** `/api/products`
*   **Method:** `GET`
*   **Response:** JSON array of products.

### Get Product by ID
*   **URL:** `/api/products/{id}`
*   **Method:** `GET`
*   **Response:** JSON object of the product, or `404 Not Found`.

### Create Product
*   **URL:** `/api/products`
*   **Method:** `POST`
*   **Headers:** `Content-Type: application/json`
*   **Body:**
    ```json
    {
        "name": "Laptop",
        "price": 999.99,
        "description": "High-performance laptop"
    }
    ```
*   **Response:** `201 Created` with the saved product object.
*   **Validation Errors Response:** `400 Bad Request` with field-level error messages.

### Update Product
*   **URL:** `/api/products/{id}`
*   **Method:** `PUT`
*   **Headers:** `Content-Type: application/json`
*   **Body:**
    ```json
    {
        "name": "Gaming Laptop",
        "price": 1299.99,
        "description": "High-performance gaming laptop"
    }
    ```
*   **Response:** `200 OK` with the updated product object, or `404 Not Found`.

### Delete Product
*   **URL:** `/api/products/{id}`
*   **Method:** `DELETE`
*   **Response:** `204 No Content`.

## Database Access

The application uses an in-memory H2 database. Data will be lost when the application restarts.
You can view the database via the H2 console:

1.  Navigate to `http://localhost:8080/h2-console` in your browser.
2.  Use the following configuration to connect:
    *   **JDBC URL:** `jdbc:h2:mem:testdb`
    *   **Username:** `sa`
    *   **Password:** *(leave blank)*

## Validation Rules

When creating or updating a product, the following rules apply:
*   `name`: Cannot be blank, must be between 2 and 100 characters.
*   `price`: Required, must be greater than or equal to 0.
*   `description`: Maximum 500 characters.

If validation fails, the API will return a `400 Bad Request` with a JSON object mapping the field names to error messages.
