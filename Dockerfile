# build stage
FROM node:13.0.1-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# production stage
FROM node:13.0.1-alpine as production-stage
COPY --from=build-stage /app/dist ./dist
COPY docker_entrypoint.sh generate_env-config.sh ./
RUN npm install -g serve 
RUN chmod +x docker_entrypoint.sh generate_env-config.sh
EXPOSE 5000
CMD ["/bin/sh", "docker_entrypoint.sh"]