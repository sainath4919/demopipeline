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
                   sh 'sudo -s docker build -t tomacatapp .'
                }
            }
        
    }
}
}
