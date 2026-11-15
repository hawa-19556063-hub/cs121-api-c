FROM debian:bookworm-slim

# Install build tools (gcc, make, etc.)
RUN apt-get update && apt-get install -y build-essential

WORKDIR /app

# Copy source files
COPY main.c mongoose.c mongoose.h ./

# Compile the C server (using capital letter O in -O2)
RUN gcc -O2 -std=gnu99 -DMG_ENABLE_HTTP=1 main.c mongoose.c -o server -lpthread -ldl

# Expose port and run server
EXPOSE 3000
CMD ["./server"]