FROM node:latest
WORKDIR /app
ADD . .
COPY . /app
RUN npm install
COPY . ./app
EXPOSE 3000
CMD ["node", "index.js"]
