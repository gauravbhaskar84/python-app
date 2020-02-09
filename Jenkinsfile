node {
    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build("gauravbhaskar84/flask-api")
    }

    stage('Push image') {
            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
    stage('Running the container') {
        docker.image(gauravbhaskar84/flask-api:latest).withrun{-p5000:5000}
    }
}
