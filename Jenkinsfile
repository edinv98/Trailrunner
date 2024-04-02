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
                bat 'kommandot för att bygga projektet'
            }
        }

        stage('Test') {
            steps {
                // Kör alla testfall för Trailrunner-projektet
                bat 'kommandot för att köra testerna'
            }
        }

        stage('Post Test') {
            steps {
                // Publicerar testresultatet
                junit 'path/to/test/reports/*.xml'
            }
        }
    }
}
