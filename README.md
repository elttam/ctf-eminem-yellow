# Overview

**Title:** Eminem Yellow (Maxine)   
**Category:** Web  
**Flag:** libctf{b29fcb68-eed4-4ed5-93fd-694f15f988ad}
**Difficulty:** Easy

# Usage

The following will pull the latest 'elttam/ctf-eminem-yellow' image from DockerHub, run a new container named 'libctfso-eminem-yellow', and publish the vulnerable service on port 80:

```sh
docker run --rm \
  --publish 80:80 \
  --name libctfso-eminem-yellow \
  elttam/ctf-eminem-yellow:latest
```

# Build (Optional)

If you prefer to build the 'elttam/ctf-eminem-yellow' image yourself you can do so first with:

```sh
docker build ${PWD} \
  --tag elttam/ctf-eminem-yellow:latest
```
