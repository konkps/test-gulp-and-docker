# FROM node:latest
# COPY . .
# RUN npm install
# CMD ["node","src/index.js"]
# or 
# CMD node src/index.js
# 
# RUN npm start

# docker build -t <image-name>:<tag-name-version-optional> .

# You can confirm that this has worked by running the command:
# docker images

# Run the following command to run the HTML container server:
# docker run -d -p <port sto host(localhost)>:<port site runs - 80 default(html)> <image-name>:<tag-name-version-optional>

FROM nginx:alpine
COPY . /usr/share/nginx/html