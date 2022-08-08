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
		echo "Hello"
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
                stage ("Deploy the Manifest at minikube cluster") {
            steps {
                dir ("/mithi/Assessment") {
                                    sshagent(['37bc9e8e-e305-47a3-ab36-8a620b696a57']) {
                    sh "scp -o StrictHostKeyChecking=no deploymentservice.yml ubuntu@172.31.36.143:/home/ubuntu"
					sh "ssh ubuntu@172.31.36.143 sudo kubectl delete -f ."
                    script{
                        try{
                            sh "ssh ubuntu@172.31.36.143 sudo kubectl apply -f ."
                        }catch(error){
                            sh "ssh ubuntu@172.31.36.143 sudo kubectl create -f ."
                        }
                        }
                    }
                }
            }
        }
        }
}

