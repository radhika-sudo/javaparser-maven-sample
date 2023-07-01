pipeline {

    agent any

 

    stages {

        stage('Build') {

            steps {

                // Checkout source code from version control (e.g., Git)

                git branch: 'master', url: 'https://github.com/radhika-sudo/javaparser-maven-sample.git'

 

                // Build Maven project

                sh 'mvn clean install'

            }

        }


        stage('Build Docker Image') {

            steps {

                // Build Docker image using Dockerfile

                sh 'sudo docker build -t my-docker-image:latest .'

            }

        }

 

        stage('Push Docker Image') {

            steps {

                // Push Docker image to Docker registry (e.g., Docker Hub)

                withDockerRegistry(credentialsId: 'docker-registry-credentials-id', url: 'public.ecr.aws/m8n3a3f5/docker-container') {

                    sh 'sudo docker push my-docker-image:latest'

                }

            }

        }

 

        // stage('Deploy to Kubernetes') {

        //     steps {

        //         // Deploy to Kubernetes cluster

        //         script {

        //             def kubeConfig = readFile("path/to/kube/config")

        //             def kubeNamespace = 'my-namespace'

 

        //             withKubeConfig(credentialsId: 'kubernetes-credentials-id', kubeconfigContent: kubeConfig) {

        //                 sh "kubectl apply -f path/to/kube/manifests -n $kubeNamespace"

        //             }

        //         }

        //     }

        // }

    }

}
