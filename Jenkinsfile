pipeline{
    agent any

    environment{
        DOCKERHUB_CREDENTIALS = credentials('DockerCredentials')
        IMAGE_NAME = 'gsd2503/my_webapp'
    }

    stages{
        stage('Checkout'){
            steps{
                git(
                    url:"https://github.com/gsd2503-rit/webapp.git",
                    branch:'main',
                    credentialsId:'DockerCredentials'
                )
            }
        }

        stage('Build Docker Image:'){
            steps{
                script{
                    dockeerImage = docker.build("${IMAGE_NAME}:latest")
                }
            }
        }

        stage('Push to Docker Hub:'){
            steps{
                script{
                    docker.withRegistery("https://index.docker.io/v1/",'DockerCredentials'){ dockerImage.push()}
                }
            }
        }
    }

    post{
        always{
            echo 'Cleaning up workspace'
            deleteDir()
        }

        success{
            echo 'pipeline succeeded'
        }

        failure{
            echo 'pipeline failed'
        }
    }

}
