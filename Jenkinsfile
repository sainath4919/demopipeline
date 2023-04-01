pipeline {
    agent any
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "Maven"
    }
    
    stages {
        stage('Checkout') {
            steps {
                script{
                    git branch: 'master', url: 'https://github.com/sainath4919/mvnproj-1.git'
            }
        }
        }
        
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        
        stage('Docker Image Build'){
            
            steps{
                script{
                   sh 'sudo docker build -t tomacatapp .'
                    sh 'sudo docker run -itd -p 8081:8080 --name samplewar2 tomacatapp'
                }
            }
        
    }
         stage('Docker Push') {
    	agent any
      steps {
      	withCredentials([usernamePassword(credentialsId: 'Dockerhub_cred', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        	sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
            sh 'sudo docker tag tomacatapp sainath4919/samplewar'
          sh 'sudo docker push sainath4919/samplewar'
        }
      }
}
}
}
