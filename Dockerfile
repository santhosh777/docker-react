FROM node:16-alpine as builder

#USER node

#RUN mkdir -p /home/node/app
#WORKDIR /home/node/app
WORKDIR /app

#COPY --chown=node:node ./package.json ./
COPY ./package.json ./
RUN npm install

#COPY --chown=node:node ./ ./
COPY ./ ./

RUN npm run build 

FROM nginx
EXPOSE 80
#COPY --from=builder /home/node/app/build /usr/share/nginx/html
COPY --from=builder /app/build /usr/share/nginx/html

