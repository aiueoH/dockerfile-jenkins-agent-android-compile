# dockerfile-jenkins-agent-android-compile

## Build image
```
sudo docker build -t jenkins-agent-android-compile .
```

## Run container
```
$ sudo docker run -d --rm --network="host" jenkins-agent-android-compile  \ 
  <jnlp url> \  
  <secret> \ 
  "<work dir>"
```
