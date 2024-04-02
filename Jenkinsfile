pipeline {
    agent any

    stages {
        stage ('build') {
            steps {
                bat "mvn compile"
            }
        }
        stage ('test') {
            steps {
                // Kör testerna
                bat "mvn test"
                // Publicera testresultaten från Maven
                junit 'target/surefire-reports/*.xml'
            }
        }
        stage('Build and Test Python Project') {
            steps {
                script {
                    bat 'python -m robot C:\Users\eddev\.jenkins\workspace\edinvelagiclabb'
                }
            }
            post {
                always {
                    robot outputPath: 'C:\Users\eddev\.jenkins\workspace\edinvelagiclabb' , passThreshold: 80.0, unstableThreshold: 70.0, onlyCritical: false

                }
            }
        }
    }
}
