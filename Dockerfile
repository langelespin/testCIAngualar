#Primera Etapa
#FROM node:14-alpine as build-step

#RUN mkdir -p /app

#WORKDIR /app

#COPY package.json /app

#RUN npm install

#COPY . /app

#RUN npm run build --prod

#Segunda Etapa
#FROM nginx:1.17.1-alpine
	#darle el nombre y directorio de la aplicacion
#COPY --from=build-step /app/dist/appSIIR /usr/share/nginx/html

#Primera Etapa
FROM  --platform=linux/amd64 docker.io/library/node:16 as build-step

RUN mkdir -p /app

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

RUN npm run build --prod

#Segunda Etapa
#FROM docker.io/library/nginx:latest
	#Si estas utilizando otra aplicacion cambia PokeApp por el nombre de tu app
#COPY --from=build-step /app/dist/appSIIR /usr/share/nginx/html