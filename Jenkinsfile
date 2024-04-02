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
                sh "mvn compile"
            }
        }

        stage('Test') {
            steps {
                // Kör alla testfall för Trailrunner-projektet
                sh "mvn test"
            }
        }
stage('Robot Framework Test') {
    steps {
        // Kör Robot Framework-test med sh
        sh '"C:/path/to/robotframework/robot" "C:/Users/eddev/.jenkins/workspace/edinvelagiclabb/path/to/robot_tests"'
    }
}

        stage('Post Test') {
            steps {
                // Publicerar testresultatet
                junit '**/TEST*.xml'
            }
        }
    }
}
