# docker-image-mongo
基于mongo4.x版本，构建可自定义配置的mongo分片集群，主从集群，仲裁集群的镜像

```
docker build -t lhy/mongo:v1 .

docker run -it --name=l1 -p 27017:27017 -d lhy/mongo:v1
```

# for example：
# 主从集群
集群初始化：
```
cfg={ _id:"test_db", members:[ {_id:0,host:'192.168.0.235:27017',priority:2}, {_id:1,host:'192.168.0.235:27018',priority:1}, {_id:2,host:'192.168.0.235:27019',arbiterOnly:true}] };

rs.initiate(cfg)
```
