### Installation

We need to run three servers: 
one for Redis

```sh
redis-server
```

one for Action Cable

```sh
bundle exec puma -p 28080 cable/config.ru 
```

and one for our Rails application.

```sh
rails s
```
