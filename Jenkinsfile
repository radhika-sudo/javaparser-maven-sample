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

               // def dockerImage = docker.build('my-docker-image:latest', '.')

                sh 'sudo -S docker build -t my-docker-image:latest .'
                

            }

        }

 

stage('Push to ECR') {

            steps {

                withCredentials([[

                    $class: 'AmazonWebServicesCredentialsBinding',

                    accessKeyVariable: 'AKIAWKSJQBPBAKYYOJG5',

                    secretKeyVariable: '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',

                    credentialsId: '77873b56-d0b2-4017-a15a-8037ea7dd41b'

                ]]) {

                   // docker.withRegistry('435019582402.dkr.ecr.ap-south-1.amazonaws.com/docker-container2', 'aws-ecr-credentials') {

                        // Push the Docker image to ECR

                        sh 'docker push 435019582402.dkr.ecr.ap-south-1.amazonaws.com/docker-container2/docker-container2:<TAG>'

                    }

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
