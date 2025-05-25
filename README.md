# Java Web Application for User Login and Registration

This project is a simple Java web application that demonstrates user registration, login, logout, and profile management functionalities. It uses Servlets for handling requests, JSPs for the user interface, and a MySQL database for storing user information.

## Features

*   User registration with username, password, email, full name, and date of birth.
*   User login with username and password.
*   Secure password storage (Note: The current implementation stores passwords in plain text or with simple encoding if any; ideally, hashing and salting should be used).
*   User session management.
*   User profile viewing after login.
*   User profile deletion.
*   User logout.

## Technologies Used

*   **Backend:** Java, Servlets
*   **Frontend:** JSP, HTML, CSS (basic)
*   **Database:** MySQL
*   **Servlet Container:** Apache Tomcat (or any other compatible Servlet container)
*   **Build/Environment:** Eclipse IDE (based on project files like .classpath, .project)

## Setup Instructions

To get this project up and running on your local machine, follow these steps:

1.  **Prerequisites:**
    *   Java Development Kit (JDK) 8 or higher installed.
    *   Apache Tomcat 7 or higher (or another Servlet container) installed.
    *   MySQL Server installed and running.
    *   An IDE like Eclipse or IntelliJ IDEA (optional, but helpful).

2.  **Clone the Repository:**
    ```bash
    git clone <repository-url>
    cd <project-directory>
    ```
    (Replace `<repository-url>` and `<project-directory>` with the actual URL and project name)

3.  **Database Setup:**
    *   Open your MySQL client (e.g., MySQL Workbench, phpMyAdmin, or command line).
    *   Create a new database named `login_register`.
        ```sql
        CREATE DATABASE login_register;
        ```
    *   Select the created database:
        ```sql
        USE login_register;
        ```
    *   Import the database schema and initial data by executing the `login_registration_DB.sql` file provided in the root of the project.
    *   **Configure Database Connection:**
        *   Open the `src/main/java/com/example/dao/UserDAO.java` file.
        *   Update the database connection details if they are different from the defaults:
            *   `JDBC_URL`: Default is `jdbc:mysql://localhost:3306/login_register?useSSL=false&allowPublicKeyRetrieval=true`
            *   `JDBC_USER`: Default is `root`
            *   `JDBC_PASSWORD`: Default is `Chamika1999`
        *   **Note:** It is highly recommended to use environment variables or a configuration file for sensitive information like database credentials in a production environment instead of hardcoding them.

4.  **Dependencies:**
    *   This project requires the MySQL JDBC driver. Download the `mysql-connector-j-X.X.XX.jar` (replace X.X.XX with the version number, e.g., 8.0.33) from the official MySQL website.
    *   If you are using an IDE like Eclipse or IntelliJ:
        *   Add the downloaded JAR to your project's build path (e.g., by placing it in the `WEB-INF/lib` folder, which might need to be created, or configuring it through the IDE's project settings).
    *   If deploying directly to Tomcat:
        *   Place the `mysql-connector-j-X.X.XX.jar` file into the `lib` directory of your Apache Tomcat installation, or into the `WEB-INF/lib` directory of your deployed web application.

5.  **Build and Deploy:**
    *   **Using an IDE (e.g., Eclipse):**
        *   Import the project into your IDE.
        *   Configure your server (e.g., Apache Tomcat) in the IDE.
        *   Right-click on the project and choose "Run As" -> "Run on Server".
    *   **Manual Deployment (WAR file):**
        *   You would typically build a WAR (Web Application Archive) file from the project. (This project doesn't include a build script like Maven or Gradle, so you might need to configure your IDE to export a WAR file, or create one manually).
        *   Deploy the generated WAR file to your Apache Tomcat's `webapps` directory. Tomcat will automatically deploy it.

6.  **Access the Application:**
    *   Open your web browser and navigate to:
        *   Registration: `http://localhost:8080/<your-app-context>/register.jsp`
        *   Login: `http://localhost:8080/<your-app-context>/login.jsp`
    *   Replace `<your-app-context>` with the context path of your deployed application (e.g., the name of the WAR file without the .war extension, or the name you configured in your IDE).

## How to Use

1.  **Register:**
    *   Navigate to the registration page (`register.jsp`).
    *   Fill in the required details: username, password, email, full name, and date of birth.
    *   Click the "Register" button. You will be redirected to the login page upon successful registration.

2.  **Login:**
    *   Navigate to the login page (`login.jsp`).
    *   Enter your registered username and password.
    *   Click the "Login" button. You will be redirected to your profile page upon successful login.

3.  **View Profile:**
    *   After logging in, your profile information will be displayed on the `profile.jsp` page.

4.  **Logout:**
    *   On the profile page (or other authenticated pages), there should be a "Logout" link/button. Clicking it will end your session and redirect you to the login page.

5.  **Delete Profile:**
    *   The profile page might offer an option to delete your account. Confirm this action if prompted.

## Project Structure

```
.
├── login_registration_DB.sql  # Database schema and initial data
├── src
│   └── main
│       ├── java                 # Java source files
│       │   └── com
│       │       └── example
│       │           ├── dao      # Data Access Objects (e.g., UserDAO.java)
│       │           ├── model    # Model classes (e.g., User.java)
│       │           └── servlet  # Servlets for handling requests
│       └── webapp               # Web application content
│           ├── META-INF
│           │   └── MANIFEST.MF
│           ├── WEB-INF
│           │   └── web.xml      # Deployment descriptor (if used explicitly)
│           ├── login.jsp        # Login page
│           ├── register.jsp     # Registration page
│           └── profile.jsp      # User profile page
├── .classpath                 # Eclipse specific file
├── .project                   # Eclipse specific file
└── README.md                  # This file
```

*   `src/main/java`: Contains all the Java backend code, organized into packages for DAO, models, and servlets.
*   `src/main/webapp`: Contains JSP files for the user interface, as well as deployment descriptors (`web.xml`) and other web resources.
*   `login_registration_DB.sql`: SQL script to set up the necessary database and table.
*   `.classpath`, `.project`, `.settings/`: Eclipse IDE specific configuration files. These can often be ignored if using a different IDE, though they indicate the project was likely developed with Eclipse.
