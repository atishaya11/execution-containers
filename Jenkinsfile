node {
    checkout scm
}
pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                sh('/home/atishaya/.jenkins/workspace/execution-containers/test.sh')
            }
        }

    }
}