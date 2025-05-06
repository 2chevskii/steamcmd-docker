# SteamCMD Docker ![Docker Image Version](https://img.shields.io/docker/v/2chevskii/steamcmd) ![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/2chevskii/steamcmd-docker/main.yml)

Docker image with **SteamCMD** utility, which allows you to automate builds of dedicated servers, games and other stuff

## Using as base image

```dockerfile
FROM 2chevskii/steamcmd:latest

# Invoke SteamCMD to install CS2 dedicated server
# into /cs2_ds directory
RUN ./steamcmd.sh +force_install_dir /cs2_ds +login anonymous +app_update 730 validate +quit

# Run your server
EXPOSE 27015/tcp
EXPOSE 27015/udp

WORKDIR /cs2_ds

ENTRYPOINT ["./cs2", "-dedicated", "+map", "de_dust2"]
```

## Automating using SteamCMD scripts

On start, this image passes any file found under `/docker-entrypoint.d` to the SteamCMD using `+runscript` directive

Below you see an example of installing CS2 dedicated server using mounted script file

> Notice the 'quit' instructions both at the and of the script
> and passed as a docker run argument
>
> This is important because by default this image starts in an interactive mode

### 00-install-cs2-ds.txt

```txt
@ShutdownOnFailedCommand 1
@NoPromptForPassword 1
force_install_dir /cs2_ds
login anonymous
app_update 730 validate
quit
```

### Shell

```sh
docker run -it -v ./00-install-cs2-ds.txt:/docker-entrypoint.d/00-install-cs2-ds.txt 2chevskii/steamcmd:latest +quit
```
