pipeline {
    agent any
    tools {
        maven 'mvn'
        jdk 'JDK_8'
    }
    environment {
        registry = "192.168.0.56:5000/wave"
        //registryCredential = 'dockerhub'
        dockerImage = ''
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }

        stage ('Build') {
            steps {
                sh 'mvn -Dmaven.test.failure.ignore=true install'
            }
            post {
                success {
                echo 'Build success'
                   // junit 'target/surefire-reports/**/*.xml'
                }
            }
        }
        stage('Building image') {
            steps{
              script {
                dockerImage = docker.Build registry + ":$BUILD_NUMBER"
                echo 'Docker image created $dockerImage'
              }
            }
          }

          stage('Push image') {
                      steps{
                        script {
                          docker.Push dockerImage
                        }
                      }
          }

          stage('Remove Unused docker image') {
                steps{
                  sh "docker rmi $dockerImage"
                   sh "docker rmi $dockerImage:latest"

                }
          }
    }
}