FROM nginx:1.21.1

RUN apt-get update -qq && apt-get -y install curl
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

COPY nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npm run build

CMD [ "nginx", "-g", "daemon off;" ]
