FROM ubuntu:24.04
RUN apt update && apt install -y dialog rsync tar
WORKDIR /app
COPY . .
RUN chmod +x main.sh
CMD ["./main.sh"]
