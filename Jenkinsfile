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



        stage('Post Test') {
            steps {
                // Publicerar testresultatet
                junit '**/TEST*.xml'
            }
        }
    }
}
