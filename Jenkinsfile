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
                tool 'Maven'

 

                // Build the Maven project
                sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                // Run tests using Maven
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                // Package the application (e.g., create JAR, WAR, etc.)
                sh 'mvn package'
            }
        }

        stage('Deploy') {
            steps {
                // Perform deployment steps here (e.g., deploying to a server)

 

                // Example: Deploy to Tomcat using Cargo plugin
                sh 'mvn cargo:deploy'
            }
        }
    }
}
