FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get clean

# Kleines Testprogramm kompilieren
RUN echo '#include <stdio.h>\nint main(){printf("Speed test\\n");return 0;}' > speedtest.c
RUN gcc speedtest.c -o speedtest

CMD ["./speedtest"]
