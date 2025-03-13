pipeline {
    agent any
    
    stages{
        stage('Code'){
            steps{
                git url: 'https://github.com/VishalJTalaviya/node-todo.git' , branch: 'main'
            }
        }
        stage('Build and Test'){
            steps{
                sh 'docker build . -t vishaltalaviya/node-todo-jenkins:latest'
            }
        }
        stage('Push'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerHub' , passwordVariable: 'dockerHubPassword' , usernameVariable: 'dockerHubUser')]) {
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                    sh 'docker push vishaltalaviya/node-todo-jenkins:latest'
                }
            }
        }
        stage('Deploy'){
            steps{
                sh "docker compose down && docker compose up -d"
            }
        }

    }
}