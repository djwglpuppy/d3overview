#D3 Tutorial

### getting setup

Setup NVM (node.js) if not on system yet

```
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
```

Install Latest Version of Node

```
nvm install v0.10.26
nvm alias default v0.10.26
```

Install Grunt and Coffee

```
npm install -g coffee-script grunt-cli
```

Go to the root of the repo and make sure all node packages are installed

```
npm install
```

### running the development environment

Go to the root of the directory and open up two tabs in terminal

#### first terminal

```
./server.coffee
```

#### second terminal

```
grunt
```

