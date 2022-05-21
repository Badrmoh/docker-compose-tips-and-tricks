# docker-compose-tips-and-tricks
## Steps
1. Clone the repo and `cd docker-compose-tip-and-tricks`
2. Build images `docker-compose -f anchors/docker-compose.yaml build`
3. Run examples: 
#### Anchors
```
docker-compose -f anchors/docker-compose.yaml up -d
```

#### Profiles
```
docker-compose --profile client -f profiles/docker-compose.yaml up -d
```
OR
```
COMPOSE_PROFILES=client,db docker-compose -f profiles/docker-compose.yaml up -d
```

#### Variables
```
docker-compose -f variables/docker-compose.yaml up -d
```

#### Depends
docker-compose -f depends/docker-compose.yaml up -d
```
Then, in a different terminal windows:
```
watch docker-compose -f depends/docker-compose.yaml ps
```
