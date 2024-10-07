pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = '0fb1329c-e01b-46f0-80b3-640aca04b2a8'
        DOCKER_IMAGE = "justmeat/test-app:${env.BUILD_NUMBER}"
        KUBE_CONFIG = credentials('b22ac297-e610-4102-836e-fc26d67c5485')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_CREDENTIALS) {
                        def app = docker.build("${DOCKER_IMAGE}")
                        app.push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                withKubeConfig([credentialsId: 'b22ac297-e610-4102-836e-fc26d67c5485']) {
                    script {
                        // Автоматически извлекаем имена деплоя и контейнера
                        def deploymentName = sh(returnStdout: true, script: "kubectl get deployments -l app=my-app -n monitoring -o jsonpath='{.items[0].metadata.name}'").trim()
                        def containerName = sh(returnStdout: true, script: "kubectl get deployment ${deploymentName} -n monitoring -o jsonpath='{.spec.template.spec.containers[0].name}'").trim()

                        // Обновляем образ в Kubernetes Deployment
                        sh """
                        kubectl set image deployment/${deploymentName} ${containerName}=${DOCKER_IMAGE} -n monitoring
                        """
                    }
                }
            }
        }
    }

    post {
        always {
            node('agent') {
                cleanWs()
            }
        }
    }
}
