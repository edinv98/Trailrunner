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
                junit '*/TEST.xml'
            }
        }

        stage('Robot Framework Test') {
            steps {
                // Kör Robot Framework-test
                sh "robot C:\Users\eddev.jenkins\workspace\edinvelagiclabb"
            }
        }
    }
}
