echo url: $1
echo secret: $2
echo workDir: $3
java -version
java -jar /agent.jar -jnlpUrl $1 -secret $2 -workDir $3