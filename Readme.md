* -- run directly from springboot<BR>
```mvn package && java -jar target/spring-boot-1.0-SNAPSHOT.jar```
```mvn package && java -jar target/spring-boot-1.0-SNAPSHOT-spring-boot.jar```

* --build docker image with spotify<BR>
```mvn install dockerfile:build -Pspotify``` <BR>
```mvn dockerfile:push```

* --run after using spotify profile <BR>
```docker run -p 8080:8080 -it wave/spring-boot:1.0-SNAPSHOT```


* -- list images <BR>
```docker image ls```

* -- build with docker command <BR>
```docker build . -t wave/spring-boot``` <BR>
```docker run -p 8080:8080 -it wave/spring-boot```


*  -- build and run with fabric8 <BR>
```mvn install docker:build -Pfabric8``` <BR>
```docker run -p 8080:8080 -it wave/spring-boot-fabric8```



*  -- browser test url<BR>
```http://localhost:8080/wave/health-check```



* docker login docker.io <BR>

* docker tag  cb428c95f2dd $DOCKER_HUB_USER/rest-example <BR>

* eval $(minikube docker-env)
* docker tag  0232504d32e5 $DOCKER_HUB_USER/wave/spring-boot-fabric8 <BR>

* -- Setup kubernetes - following steps will help doing that <BR>
* -- create services.yml <BR>
    ```kubectl create -f kubernetes/services.yml```
* -- see all services <BR>
    ```kubectl get services --all-namespaces```


* -- create deployment: <BR>
```kubectl create -f kubernetes/deployment.yml```

* -- get the port number - the value of NodePort <BR>
```kubectl describe service rest-example```


* Get the url of the service <BR>
```minikube service rest-example --url```

