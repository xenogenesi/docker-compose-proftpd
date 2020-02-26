FROM debian:buster-slim

RUN export DEBIAN_FRONTEND=noninteractive ; \
    apt-get update

RUN export DEBIAN_FRONTEND=noninteractive ; \
    apt-get install -y --no-install-recommends \
        proftpd ca-certificates

# password is "password"
RUN useradd -m -s /bin/false -u 1000 -g nogroup \
        -p '$6$MpreEbzJAfDdXzU1$UjOIaKcRyFENVg1zYzFqxCqs7Vhm4sAi.ykWwIY57EWxLNqskAZ3Wtxg69jXhBfa0iyDj4nMwc3wXxSJxgf.Q.' \
        ftpuser && \
    chown ftpuser:nogroup /home/ftpuser

EXPOSE 20 21

#CMD ["sleep", "99999999999999999" ]
CMD [ "/usr/sbin/proftpd", "-n" ]
