pipeline {
    agent { docker { image 'alpine:latest' } }
    stages {
        stage('build') {
            steps {
                timeout(time: 5, unit: 'SECONDS') {
                    retry(5) {
                        sh './flakey-deploy.sh'
                    }
                }
            }
        }
    }
}
