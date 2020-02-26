
## create key and cert

```shell
openssl req -x509 -newkey rsa:4096 -keyout proftpd.key -out  proftpd.crt -nodes -days 365 -nodes -subj '/CN=cacert/C=FI/ST=Helsinki/L=Helsinki/O=ProFTPD' -text
chmod 0600 proftpd.key && chmod 0640 proftpd.crt
```

## create ./ftpuser directory (map to /home/ftpuser)

```shell
mkdir ftpuser
sudo chown 1000:nogroup ftpuser # you may want to use your debian user name instead of 1000, nogroup should be 65534
```

or let `docker-compose up` create it and then change the owner `sudo chown 1000:nogroup -R ./ftpuser`

## bring up
docker-compose up -d

## runtime reload config

```shell
kill -HUP 1
docker exec -ti debian_proftpd bash -c 'kill -HUP 1`
```

## lftp connection

```lftp
connect ftpuser:password@localhost
set ssl:verify-certificate no
```
