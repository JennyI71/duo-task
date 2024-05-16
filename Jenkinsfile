pipeline {

    agent any

    stages {

        stage('Build') {

            steps {

                sh '''

                docker build -t jennyi71/trio-flask:latest -t jennyi71/trio-flask:v$BUILD_NUMBER .

                '''

                }

            }

        }

        stage('Push') {

            steps {

                sh '''

                docker push jennyi71/trio-flask:latest

                docker push jennyi71/trio-flask:v$BUILD_NUMBER

                '''

            }

        }

        stage('Cleanup') {

            steps {

                sh '''

                docker rmi jennyi71/trio-flask:latest

                docker rmi jennyi71/trio-flask:v$BUILD_NUMBER

                '''               

            }

        }

        stage('Deploy') {

            steps {

                sh '''

                kubectl apply -f ./k8s-deployments

                kubectl rollout restart deployment flask-deployment

                '''

                }

            }

        }

    }

}
