FROM nginx
LABEL nginx="latest"
RUN echo "hii Adarsh this is nginx page" > /usr/share/nginx/html/index.html
EXPOSE 75
CMD ["nginx","-g", "daemon off;"]
