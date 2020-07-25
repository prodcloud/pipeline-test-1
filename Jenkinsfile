pipeline {
    agent {
        docker {
            image 'alpine:latest'
            label '!windows'
            args '-u 0'
        }
    }

    environment {
        DISABLE_AUTH  = 'true'
        DB_ENGINE     = 'sqlite'
    }

    stages {
        stage('build') {
            steps {
               echo "Database engine: ${DB_ENGINE}"
               echo "DISABLE_AUTH is ${DISABLE_AUTH}"
               sh 'printen'
            }
        }
    }

    post {
        always {
            echo 'One way or another, I have finished'
            deleteDir() /* clean up our workspace */
        }
        success {
            echo 'I succeeeded!'
        }
        unstable {
            echo 'I am unstable :/'
        }
        failure {
            mail to: 'haplos@hazmac.net',
                subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
                body: "Something is wrong with ${env.BUILD_URL}"
        }
        changed {
            echo 'Things were different before...'
        }
    }
}
