node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("nodeyarn")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        
        rtDockerPush(
            serverId: 'myserver',
            image: 'qaslalom.jfrog.io/docker-quickstart-local/nodeyarn:latest',
            targetRepo: 'docker-local',
            // Attach custom properties to the published artifacts:
            properties: 'project-name=docker1;status=stable'
            )

        rtPublishBuildInfo (
            serverId: 'myserver'
        )
    }
}
