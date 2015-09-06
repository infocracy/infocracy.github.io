# How to use

The source code for the website is contained inside of the `code` branch.

All development should happen in the code branch and `master` should be used
for pushing the built code to (what is in dist/).

To setup the development environment, after having installed node and bower,
run:


```
npm install
bower install
```

To build the website you will have to run:

```
gulp build
```

The site will now be in `dist`.

To deploy the website run:

```
./deploy.sh
```
