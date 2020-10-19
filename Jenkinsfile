pipeline {
  agent any
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
      environment {
        DOCKER_IMAGE_NAME = 'jduarte104/darkweather'
      }
      steps {
        input 'Deploy to Production?'
        withKubeConfig(credentialsId: 'kubeconfig') {
          sh 'kubectl apply -f /var/lib/jenkins/workspace/dark_weather_master/kube-dark.yml'
        }

      }
    }

  }
  environment {
    DOCKER_IMAGE_NAME = 'jduarte104/darkweather'
    ENVIRONMENT = "Production"
  }
}
