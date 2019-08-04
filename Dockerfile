### Layer 1
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .
# Build website masuk ke dalam folder /app/build
RUN npm run build

### Layer 2 - Membuat image baru dari image yang dibuat di atas
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
