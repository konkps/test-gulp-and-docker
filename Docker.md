# Docker Setup troubleshoot

**Steps:**
1. from bios activate virtual machines (virtualization, vsm?)
2. windows features :
<br> - check Virtual Machine Platform
<br> - Windows Subsystem for Linux
<br> - Hyper-V (Optional?)

3. (Optional if docker doesn't run with error about wsl2) 
<br>
run on powershell as administartor 
<br>
`wsl --update`
<br>
`wsl --shutdown`
<br>
`wsl --set-default-version 2`
<br>
`Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform`
<br>
`wsl --set-default-version 2`

# Docker Examples

### **Dockerfile**
```
FROM node:latest
COPY package.json ./
COPY package-lock.json ./
RUN npm install
COPY . .

CMD ["node","src/index.js"]
or 
CMD node src/index.js
or
RUN npm start
```
**React Example**

```
FROM node:12 AS build
WORKDIR /app
COPY package* yarn.lock ./
RUN yarn install
COPY public ./public
COPY src ./src
RUN yarn run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
```

**Html Page**
```
FROM nginx:alpine
COPY . /usr/share/nginx/html
```

### Docker Commands

`docker build -t <image-name>:<tag-name-version-optional> .`

You can confirm that this has worked by running the command:
docker images

Run the following command to run the HTML container server:
<br>
`docker run -d -p <port sto host(localhost)>:<port site runs - 80 default(html)> <image-name>:<tag-name-version-optional>`
