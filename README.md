# rchaves.app blog

This is my blog, it runs on docker using [simple-platform](https://github.com/rogeriochaves/simple-platform)

It uses [Hexo](https://hexo.io/) to render the blog from markdown content

To start it locally:

```
npm install
npm start
```

To deploy it:

```
eval $(docker-machine env your-machine)
docker-compose up -d --build
```

