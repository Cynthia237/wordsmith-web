pipeline {
    agent any
    tools {
        go 'Go' // Adjust based on your Go version
       
    }

    stages {
        stage('Build Go Web App') {
            steps {
               // sh 'go mod init wordweb'
                sh 'go build -o my-app ./' // Adjust command and output file
            }
        } 

        stage('Build Docker Image for Go Web App') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                 
                  sh 'docker login -u $USERNAME -p $PASSWORD'
                  sh 'docker build -t wordsmithweb:latest -f Dockerfile  --build-arg WEB_APP_PORT=8080 --build-arg JAVA_API_URL=http://java-api:8081 .'
                  sh 'docker tag wordweb:latest mncy580/wordweb:${BUILD_NUMBER}'
                  sh 'docker push mncy580/wordweb:${BUILD_NUMBER}'
                                  
                }
            }
        }
    }
}