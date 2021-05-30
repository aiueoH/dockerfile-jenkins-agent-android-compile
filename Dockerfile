FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive 
ENV ANDROID_SDK_ROOT=/cmdline-tools/
ENV PATH="${PATH}":/cmdline-tools/bin/

RUN apt update && \
	apt upgrade -y

RUN apt install -y openjdk-11-jdk

RUN apt install -y curl \
					git \
					unzip
	
COPY ./agent.jar /
COPY ./entrypoint.sh /
ADD https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip  /

RUN unzip commandlinetools-linux-7302050_latest.zip

RUN yes | sdkmanager --licenses --sdk_root=$ANDROID_SDK_ROOT
RUN sdkmanager --update --sdk_root=$ANDROID_SDK_ROOT

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
CMD ["<empty url>", "<empty secret>", "<empty workDir>"]