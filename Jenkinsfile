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
               sh 'printenv'
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
            emailext body: 'A Test EMail', recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']], subject: 'Test'
        }
        changed {
            echo 'Things were different before...'
        }
    }
}
