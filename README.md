#### Dockerfile

Dockerfile used to download and and compile nginx with custom flags
like http support and other good features. env_secrets.txt is a file used to
set up environment variables ex:  where to install nginx.

Now we could change the path to install NGINX on env_variables files

### TO-DO

1. Multistage build : Use this image to compile nginx and then use that binary
on a alpine linux distribution.

2. Add docker volumes to test nginx.conf file
