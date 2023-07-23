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

        stage('Setup AWS Credentials') {

            steps {

                script {

                    // Load AWS credentials from Jenkins credentials store

                   // def awsAccessKeyId = credentials('AKIAWKSJQBPBCEVBD2UZ')

                   // def awsSecretAccessKey = credentials('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')

 

                    // Configure AWS CLI

                    sh "aws configure set aws_access_key_id AKIAWKSJQBPBCEVBD2UZ"

                    sh "aws configure set aws_secret_access_key oW/yVkcXBQ8B3G/qtLEKLR0VS744+bpCNZm1LvAJ"

                    sh "aws configure set default.region ap-south-1" // Set your desired AWS region

                    sh "aws configure set default.output json" // Set output format to JSON

                }

            }

        }


 

        // stage('Push to ECR') {

        //      steps {

        //         withCredentials([[

        //             $class: 'AmazonWebServicesCredentialsBinding',

        //             accessKeyVariable: 'AKIAWKSJQBPBAKYYOJG5',

        //             secretKeyVariable: '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',

        //             credentialsId: '77873b56-d0b2-4017-a15a-8037ea7dd41b'

        //         ]]) {

        //            // docker.withRegistry('435019582402.dkr.ecr.ap-south-1.amazonaws.com/docker-container2', 'aws-ecr-credentials') 

        //                 // Push the Docker image to ECR

        //                  sh 'sudo docker push my-docker-image:latest '

        //             }

        //         }

        //     }


        //         stage('Login to AWS ECR') {

        //     steps {

        //         // Log in to AWS ECR using the AWS CLI

        //         sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 435019582402.dkr.ecr.ap-south-1.amazonaws.com/docker-container2"

        //     }

        // }

 

        // stage('Push Docker Image to ECR') {

        //     steps {

        //         // Push the Docker image to ECR

        //         script {

        //                sh "docker push ${docker-container2}/${my-docker-image}:${latest}"


        //         }

        //     }

        // }


        
    
        //   stage('Push Docker Image') {
        //      environment {
        //         ECR_REGISTRY = '435019582402.dkr.ecr.ap-south-1.amazonaws.com'
        //         DOCKER_IMAGE = 'my-docker-image'
        //         DOCKER_TAG = 'latest'
        //     }
        //     steps {
        //         script {
        //             // Authenticate with AWS ECR and get the Docker login command
        //             def dockerLoginCommand = sh(
        //                 script: "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin ${ECR_REGISTRY}",
        //                 returnStdout: true
        //             ).trim()

        //             // Execute the Docker login command
        //             sh(returnStatus: true, script: dockerLoginCommand)

        //             // Build your Docker image here (if not already built)
        //             // docker build -t ${ECR_REGISTRY}/${DOCKER_IMAGE}:${DOCKER_TAG} .

        //             // Push the Docker image to ECR
        //             sh "docker push ${ECR_REGISTRY}/${DOCKER_IMAGE}:${DOCKER_TAG}"
        //         }
        //     }
        // }


        stage('Push to ECR') {
            steps {
                // Authenticate Docker with ECR using your AWS credentials
                sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 435019582402.dkr.ecr.ap-south-1.amazonaws.com'
                
                // Tag your Docker image with the ECR registry URL
                sh 'docker tag my-docker-image 435019582402.dkr.ecr.ap-south-1.amazonaws.com/my-docker-image'
                
                // Push the Docker image to ECR
                sh 'docker push 435019582402.dkr.ecr.ap-south-1.amazonaws.com/my-docker-image'
            }
        }

  stage('Deploy to Kubernetes') {

     environment {

       KUBECONFIG = 'C:/Users/venkatesh/.kube'  // Path to the Kubernetes cluster configuration file

     }

     steps {

       container('kubectl') {

         // Install kubectl in a Jenkins container

         sh 'curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x kubectl && sudo mv kubectl /usr/local/bin/'

       }

 

       script {

         // Deploy Kubernetes resources using kubectl

         sh 'kubectl apply -f your-deployment.yaml'

       }

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


