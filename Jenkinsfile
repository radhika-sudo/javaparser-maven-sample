pipeline {
    agent any

 

    stages {
        stage('Checkout') {
            steps {
                // Checkout source code from version control
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Set up Maven
                // tool 'Maven'

 

                // Build the Maven project
                bat 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                // Run tests using Maven
                bat 'mvn test'
            }
        }

        stage('Package') {
            steps {
                // Package the application (e.g., create JAR, WAR, etc.)
                bat 'mvn package'
            }
        }

        stage('Deploy') {
            steps {
                // Perform deployment steps here (e.g., deploying to a server)

 

                // Example: Deploy to Tomcat using Cargo plugin
                bat 'mvn cargo:deploy'
            }
        }
    }
}
