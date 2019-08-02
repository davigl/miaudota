# Fruit Rails API

 `To be added JSON serializers..`
 
 `Rails Version 5.2.3`

### Clone the repository

```shell
git clone https://github.com/Davigl/fruits-api-jwt.git
cd fruits-api-jwt
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.5.3`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.5.3
```

### Install dependencies


```shell
bundle install
```

### Initialize the database

```shell
rake db:create db:migrate
```

## Server

```shell
rails s
```
