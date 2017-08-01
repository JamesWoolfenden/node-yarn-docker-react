# node-yarn-docker-react
Like the repo says... I wanted an example that had real code in it and that had the tools I normally use but dockerised. A boilerplate/prototype docker yarn REACT pipeline.

Requirements
Docker...

If your running on Linux/Ubuntu you probably have this all already, if not, i'm sure you can Google that.

For anyone else on other platform:
Make sure you have the docker toolbox installed, available from here:
Mac https://download.docker.com/mac/stable/DockerToolbox.pkg

Win 10
https://download.docker.com/win/stable/DockerToolbox.exe

Once you've installed it verify is running. You should this when you call docker-machine ls.

```
docker-machine ls

NAME      ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER        ERRORS
default   *        virtualbox   Running   tcp://192.168.xx.xxx:2376           v17.06.0-ce
```
If have you this:
```
NAME      ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER        ERRORS
```
You need to create a docker-machine host like this:
```
docker-machine create --driver virtualbox default
```

Righto, now its on. I'm assuming you've cloned this repo and are working in at shell where you cloned it.

Building the container:
```
docker build -t node-yarn-react-docker .
```
And running it:
```
docker run -p 5000:5000 node-yarn-react-docker
```

Then browse to http://localhost:5000 and you should see a game of noughts and crosses,
that doesn't work for you try your at $dockerhost:5000 -e.g. 192.168.xx.xxx:5000 (of $env:DOCKER_HOST)

Conclusions
The pipeline was pretty easy to adapt, I had some problem with using the works VPN.
Comments improvements welcome. Do try out the Facebook tutorial is it very good.

Adapted from :
1. https://medium.com/ai2-blog/dockerizing-a-react-application-3563688a2378
2. https://facebook.github.io/react/tutorial/tutorial.html
