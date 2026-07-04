# Docker Notes

## Services

| Service | Profile | Host Port |
|---------|---------|----------:|
| MongoDB | mongo | 37017 |
| Redis | redis | 36379 |

## Enable Mongo

```env
COMPOSE_PROFILES=mongo
```

## Enable Mongo + Redis

```env
COMPOSE_PROFILES=mongo,redis
```

## Data

MongoDB

```
~/docker/data/mongodb
```

Redis

```
~/docker/data/redis
```