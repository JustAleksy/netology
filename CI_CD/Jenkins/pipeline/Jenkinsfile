pipeline {
    agent {
        label 'agent'
    }
    stages {
        stage('Checkout') {
            steps{
                git branch: 'master', credentialsId: 'a6975d34-7b75-451d-87ac-8ba8e6281fc1', url: 'https://github.com/JustAleksy/clickhouse.git'
            }
        }
        stage('Install molecule') {
            steps{
                sh 'pip install -r requirements.txt'
                sh "echo help"
            }
        }
        stage('Run Molecule'){
            steps{
                sh 'molecule test'
                cleanWs()
            }
        }
    }
}