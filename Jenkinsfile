pipeline {
    agent any
    tools {
        maven 'mvn'
        jdk 'JDK_8'
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
    }
}