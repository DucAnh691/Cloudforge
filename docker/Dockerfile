FROM node:18-alpine AS builder

WORKDIR /app

COPY app/package*.json ./
RUN npm install --omit=dev

COPY app/src ./src

FROM node:18-alpine

WORKDIR /app

COPY --from=builder /app /app

EXPOSE 3000

ENV NODE_ENV=production

CMD [ "node", "src/index.js" ]