pipeline {
    agent any
    environment {
        //be sure to replace "willbla" with your own Docker Hub username
        DOCKER_IMAGE_NAME = "jduarte104/darkweather"
    }
    stages {
        stage('Build Docker Image') {
            when {
                branch 'master'
            }
            steps {
                script {
                    app = docker.build(DOCKER_IMAGE_NAME)
                    app.inside {
                        sh 'echo Hello, World!'
                    }
                }
            }
        }
        stage('Push Docker Image') {
            when {
                branch 'master'
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker_hub_login') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
        stage('DeployToProduction') {
            when {
                branch 'master'
            }
                withKubeConfig([credentialsId: 'kubeconfig',
                                caCertificate: '<ca-certificate>',
                                serverUrl: 'https://192.168.7.17:6443',
                                ]) {
                  sh 'kubectl apply -f /var/lib/jenkins/workspace/dark_weather_master/kube-dark.yml'
                }
            }    
        }
    }
}
