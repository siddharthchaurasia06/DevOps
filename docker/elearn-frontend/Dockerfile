FROM node AS dhondu
WORKDIR /sid
COPY . .
RUN npm install
RUN npm run build
# RUN apt update -y
# RUN apt install nginx -y
#RUN cp -r /sid/build/* /usr/share/nginx/html
#CMD ["nginx", "-g", "daemon off;"]
#ENTRYPOINT [ "bash" ]

FROM nginx:alpine
COPY --from=dhondu /sid/build/  /usr/share/nginx/html

