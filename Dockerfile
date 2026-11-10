FROM gcc:latest AS builder
WORKDIR /app
# Copy source files explicitly into build container
COPY main.c mongoose.c mongoose.h ./
# Compile with GNU extensions and HTTP support enabled
RUN gcc -O2 -std=gnu99 -DMG_ENABLE_HTTP=1 main.c mongoose.c -o server -lpthread -ldl
FROM debian:bookworm-slim
WORKDIR /app
COPY --from=builder /app/server .
EXPOSE 3000
CMD ["./server"]