pipeline {
    agent any
    tools {
        maven 'mvn'
        jdk 'JDK_8'
    }
    environment {
        registry = "amitwave/test" // this is the name of the repository e.g. https://hub.docker.com/repository/docker/amitwave/test. in this case amitwave/test
        registryCredential = 'dockerhub'
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
                dockerImage = docker.build("$registry:${env.BUILD_ID}")
              }
            }
            post {
                         success {
                            echo 'Docker image created ' + "$dockerImage"
                            }
                        }
          }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '',  registryCredential) {
            dockerImage.push("$BUILD_NUMBER")
            dockerImage.push('latest')

          }
        }
      }
    }

          stage('Remove Unused docker image') {
                steps{
                  sh "docker rmi $registry:${env.BUILD_ID}"
                  sh "docker rmi $registry:latest"

                }
          }
    }
}