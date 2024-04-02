pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Hämtar senaste kodversionen för den valda grenen
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Kompilerar Trailrunner-projektet
                bat "mvn compile"
            }
        }

        stage('Test') {
            steps {
                // Kör alla testfall för Trailrunner-projektet
                bat "mvn test"
                // Publicera testresultaten från Maven
                junit 'target/surefire-reports/*.xml'
            }
        }

        stage('Robot Framework Test') {
            steps {
                // Kör Robot Framework-test
                bat 'python -m robot C:/Users/eddev.jenkins/workspace/edinvelagiclabb'
            }
            post {
                always {
                    // Publicera resultatet av Robot Framework-testerna
                    robot outputPath: 'C:/Users/eddev.jenkins/workspace/edinvelagiclabb',
                          passThreshold: 80.0,
                          unstableThreshold: 70.0,
                          onlyCritical: false
                }
            }
        }
    }
}
