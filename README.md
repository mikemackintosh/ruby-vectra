# Ruby Vectra
A Ruby extension for interfacing with Vectra API.

[![TravisCI](https://travis-ci.org/mikemackintosh/ruby-vectra.svg)](https://travis-ci.org/mikemackintosh/ruby-vectra)

# Installation

Like any other gem:

```shell
gem install vectra
```
# Usage

Basic Block Configuration:

```ruby
Vectra.configure do |config|
  config.endpoint = @endpoint_url
  config.username = @username
  config.password = @password
end
```

**endpoint** should be your Vectra box URL, no need to add the `/api` suffix. If you include it, it won't break things either.

## Detections

To get all detections, use `#all`:

```ruby
Vectra::Detections.all
```

You can also get a detection by ID or by referencing the detection URL:

```ruby
Vectra::Detections.get(1)
Vectra::Detections.get('https://vectra/detection/1')
```

### Detection Details

Within the response of a detection, you may find Detection Details. You can get more details on these like so:

```ruby
Vectra::Detections.get(1)["detection_detail_set"].each do |d|
  details = Vectra::DetectionDetails.get(d)
  puts "--> #{details["destination"]}:#{details["dst_port"]}"
end
```
### Relayed Comms

Another type of detection detail you may see is the following:

```ruby
Vectra::Detections.get(1)["relayed_comm_set"].each do |r|
  details = Vectra::RelayComms.get(r)
  puts "--> #{details['inbound_proto']} #{details["inbound_ip"]}:#{details["inbound_port"]} @ #{details['total_bytes_rcvd']} bytes"
end
```  

### DNS

There is also a DNS set:

```ruby
Vectra::Detections.get(1)["dns_set"].each do |d|
  details = Vectra::DNS.get(r)
  puts "--> DNS Server: #{details['dns_ip']} resolved #{details['dns_request']} to #{details['resp']}"
end
```   
### SQL Injection

And lastly, an SQL Injection Set

```ruby
Vectra::Detections.get(1)["sqli_set"].each do |s|
  details = Vectra::SQLi.get(s)
  puts "Injection Attempted: #{details['ngram']} to #{details['destination']}"
end
```    
## Hosts

Do not use `::Hosts.all` if you are in production. This will be very costly if you have more than 5,000 discovered hosts.

Instead, pass a Host ID or URL:

```ruby
Vectra::Hosts.get(1)
```

## Notes

Vectra uses a `next` parameter in their responses for pagination. Default pagination is `50`. This API client will follow the `next` pages.

Currently, all responses which contain arrays (hosts and detections) will be sorted in ASC order by ID.

## Credit

[Mike Mackintosh](http://www.mikemackintosh.com)