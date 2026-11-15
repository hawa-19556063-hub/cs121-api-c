bookworm-slim

RUN apt-get update && apt-get install -y build-essential

WORKDIR /app

COPY main.c mongoose.c mongoose.h ./

RUN gcc -O2 -std=gnu99 -DMG_ENABLE_HTTP=1 main.c mongoose.c -o server -lpthread -ldl

EXPOSE 3000
CMD ["./server"]


