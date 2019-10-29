# build stage
FROM node:13.0.1-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# production stage
FROM node:13.0.1-alpine as production-stage
COPY --from=build-stage /app/dist .
RUN npm install -g
EXPOSE 5000
CMD ["serve", "-s", "dist"]