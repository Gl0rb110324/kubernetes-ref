docker run -d --name=telegraf \
	-v $(pwd)/telegraf.conf:/etc/telegraf/telegraf.conf \
	-v /var/run/docker.sock:/var/run/docker.sock \
	--net=influxdb-net \
	--user telegraf:$(stat -c '%g' /var/run/docker.sock) \
	--env INFLUX_TOKEN=<your_api_key> \
	telegraf
