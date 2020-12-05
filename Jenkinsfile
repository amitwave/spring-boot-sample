pipeline {
    agent any
    tools {
        maven 'mvn'
        jdk 'JDK_8'
    }
    environment {
        //registry = "http://192.168.0.56:5000"
        registry = "amitwave/test/"
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
//         stage('Building image') {
//             steps{
//               script {
//                 dockerImage = docker.build registry + ":$BUILD_NUMBER"
//
//               }
//             }
//             post {
//                          success {
//                             echo 'Docker image created ' + "$dockerImage"
//                                // junit 'target/surefire-reports/**/*.xml'
//                             }
//                         }
//           }

        stage('Building image') {
            steps{
              script {
                dockerImage = docker.build( $registry + "wave-app:${env.BUILD_ID}")

              }
            }
            post {
                         success {
                            echo 'Docker image created ' + "$dockerImage"
                               // junit 'target/surefire-reports/**/*.xml'
                            }
                        }
          }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( "https://hub.docker.com/repository/docker/" ) {
            dockerImage.push("$BUILD_NUMBER")
            dockerImage.push('latest')

          }
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