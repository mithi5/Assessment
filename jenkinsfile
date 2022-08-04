pipeline {
    agent {
        label {
        label "built-in"
        customWorkspace "/mithi"
        }
    }
    stages{
        stage("clone the Repo") {
            steps {
		sh "rm -rf *"
                sh "git clone https://github.com/mithi5/Assessment.git"
		}
		}
        stage ("build the docker image") {
            steps {
                dir ("/mithi/Assessment") {
                sh 'docker build -t mithi5/my-app .'       
                    }
                }
            }	
        stage ("Upload the Image file in Docker Registry") {
            steps {
		script{
			withCredentials([string(credentialsId: 'mithi5', variable: 'dockerhub')]) {
                sh 'docker login -u mithi5 -p${dockerhub}'     
			}
		sh "docker push mithi5/my-app"
				}    
			}
		}
	}
}
