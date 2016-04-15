![hermes 1.9](https://img.shields.io/badge/Hermes-1.9-brightgreen.svg) ![License GPL](https://img.shields.io/aur/license/yaourt.svg)
[![Circle CI](https://circleci.com/gh/arenstar/docker-hermes.svg?&style=shield)](https://circleci.com/gh/arenstar/docker-hermes) [![Build Status](https://travis-ci.org/arenstar/docker-hermes.svg?branch=master)](https://travis-ci.org/arenstar/docker-hermes)

http://www.hermes-project.com/

### Usage

To run it:

    $ docker run -it --rm -p 25:25 \
    -v hermesrc:/etc/hermes/hermesrc:ro \
    -v hermes.key:/etc/hermes/hermes.key:ro \
    -v hermes.cert:/etc/hermes/hermes.cert:ro \
    arenstar/hermes

### Configure hermesrc

Refer to the [documentation](http://www.hermes-project.com/pages/config-options) for all configuration options

````
background = false

user = nobody
group = nogroup

# the host of the real smtp server.
server_host = "mail.example.com"
# the port for the real smtp server.
server_port = 2525

# whether to query the spf record for the incoming domain.
query_spf = true

# whether to enable greylisting.
greylist = true
database_file = /var/hermes/greylisting.db

rbl_domain = zen.spamhaus.org

incoming_ssl = true
private_key_file = /etc/hermes/hermes.key
certificate_file = /etc/hermes/hermes.cert
file_logger_filename = "/dev/stdout"

# Add tagged header "X-Hermes-Status: {white,black}listed"
add_status_header = true
`````

