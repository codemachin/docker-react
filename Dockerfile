FROM node:11.10-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
# may remove copy if using reference
RUN npm run build

CMD [ "npm","run", "start" ]

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html