# dnsmasq

This container runs [dnsmasq](http://dnsmasq.org/) and uses incron to monitor `/etc/dnsmasq/hosts` to trigger reload if the file changes.

## Start command

When using this container, you should mount a volume on `/etc/dnsmasq`

    docker run --rm -i -t --name dnsmasq -p 53/udp -v /somewhere/dnsmasq:/etc/dnsmasq pmenglund/dnsmasq

If the file `/etc/dnsmasq/config` is present, `dnsmasq` will use that instead of the default file.

If you want to verify that you can lookup though the container, use:

	dig -p `docker port $CID 53/udp` foo.bar.com @localhost
