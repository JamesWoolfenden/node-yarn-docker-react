node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("qaslalom.jfrog.io/docker-quickstart-local/nodeyarn")
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
            targetRepo: 'docker-quickstart-local',
            // Attach custom properties to the published artifacts:
            properties: 'project-name=docker1;status=stable'
            )

        rtPublishBuildInfo (
            serverId: 'myserver'
        )
    }

    stage('Promote') {
        serverId: 'my-server',
        // Name of target repository in Artifactory
        targetRepo: 'stage-docker-quickstart-local',
        
        // Optional parameters
        // Comment and Status to be displayed in the Build History tab in Artifactory
        comment: 'this is the promotion comment',
        status: 'Released',
        // Specifies the source repository for build artifacts.
        sourceRepo: 'docker-quickstart-local',
        // Indicates whether to promote the build dependencies, in addition to the artifacts. False by default.
        includeDependencies: true,
        // Indicates whether to fail the promotion process in case of failing to move or copy one of the files. False by default
        failFast: true,
        // Indicates whether to copy the files. Move is the default.
        copy: true
    }
}
