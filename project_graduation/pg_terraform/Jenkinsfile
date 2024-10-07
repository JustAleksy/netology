pipeline {
    agent any

    environment {
        // Здесь указываем переменные окружения (например, для AWS/Yandex)
        TF_VAR_access_key     = credentials('3a9131b4-b041-479c-9ad0-72977796806b')
        TF_VAR_secret_key     = credentials('9ecd015f-59af-4fa3-b36a-4f47f3bc65a1')
        AWS_ACCESS_KEY_ID     = credentials('3a9131b4-b041-479c-9ad0-72977796806b')
        AWS_SECRET_ACCESS_KEY = credentials('9ecd015f-59af-4fa3-b36a-4f47f3bc65a1')
        YC_TOKEN	          = credentials('65954801-473c-4b32-9baf-d36109a4884f')
    }

    stages {
        stage('Checkout') {
            steps {
                // Клонирование вашего Git-репозитория
                git branch: 'master', url: 'https://github.com/JustAleksy/pg_terraform'
            }
        }

        stage('Terraform Init') {
            steps {
                // Инициализация Terraform
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                // Валидация конфигурации Terraform
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Планирование изменений Terraform
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                // Применение изменений Terraform
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        always {
            // Запись лога и сохранение артефактов
            archiveArtifacts artifacts: '**/terraform.tfstate', allowEmptyArchive: true
        }
        success {
            echo 'Terraform applied successfully!'
        }
        failure {
            echo 'Terraform apply failed!'
        }
    }
}
