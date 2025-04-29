# syntax=docker/dockerfile:1.4
FROM --platform=linux/amd64 node:20.13.1-bullseye-slim
WORKDIR /usr/src/app
COPY package*.json ./
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
RUN npm install --no-audit
COPY . .
RUN npm run build
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:3000/health || exit 1
CMD ["node", "dist/main.js"] 