node {
    checkout scm
}
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh test
            }
        }

    }
}