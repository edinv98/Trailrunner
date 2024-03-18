pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Hämtar senaste kodversionen för den valda grenen
                    checkout scm
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    // Kompilerar Trailrunner-projektet
                    // Exempel: mvn clean install
                    sh 'mvn clean install'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Kör alla testfall för Trailrunner-projektet
                    // Exempel: mvn test
                    sh 'mvn test'
                }
            }
        }

        stage('Post Test') {
            steps {
                script {
                    // Publicerar testresultatet
                    // Exempel: junit 'path/to/test/reports/*.xml'
                    junit 'path/to/test/reports/*.xml'
                }
            }
        }

        stage('Run Robot and Post Test') {
            steps {
                script {
                    // Kör Selenium-labben
                    // Exempel: robot 'path/to/robot/tests/*.robot'
                    sh 'robot path/to/robot/tests/*.robot'

                    // Publicerar resultatet för Robotframework-testerna
                    // Exempel: robot 'path/to/robot/tests/*.xml'
                    robot 'path/to/robot/tests/*.xml'
                }
            }
        }
    }
}

