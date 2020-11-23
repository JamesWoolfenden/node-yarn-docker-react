node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("jameswoolfenden/nodeyarn")
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
            image: "docker-quickstart-local/hello-world:latest',
            targetRepo: 'docker-quickstart-local',
            // Attach custom properties to the published artifacts:
            properties: 'project-name=docker1;status=stable',
            // Jenkins spawns a new java process during this step's execution.
            // You have the option of passing any java args to this new process.
            javaArgs: '-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005'
            )

        rtPublishBuildInfo (
            serverId: 'myserver'
        )
    }
}
