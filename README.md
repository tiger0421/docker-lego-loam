# docker-lego-loam
For details, see https://github.com/RobustFieldAutonomyLab/LeGO-LOAM

# Support
- kinetic
- melodic

# Usage

```
curl https://raw.githubusercontent.com/tiger0421/docker-lego-loam/master/launch.sh > launch.sh
sudo chmod a+x launch.sh
sh launch.sh 
```

# Build
```
docker build --build-arg BASE_TAG=1.0-glvnd-runtime-ubuntu18.04 -t IMAGE_NAME:TAG_NAME . 
```

# LICENSE
GPL3.0
