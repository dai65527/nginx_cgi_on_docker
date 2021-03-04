# cgi on apache in a docker container
This is for testing cgi programs on apache.

## How to use

### Build and run
Move to root of repo first.

Build a docker image.

```
docker build -t apache_cgi .
```

Run the image.

```
docker run --rm --name apache_cgi_test -d -p 8080:80 apache_cgi
```

You can change name of image/container and port of host OS.

### Access the page
Access http://localhost:8080/cgi-bin/perl.cgi for example.
