node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("gauravbhaskar84/flask-api")
    }

    stage('Push image') {
            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
    stage('Running the container') {
        docker.image('gauravbhaskar84/flask-api:latest').withRun {-p5000:5000}
    }
}
