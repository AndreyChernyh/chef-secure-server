# secure-server cookbook
[![Build Status](https://travis-ci.org/AndreyChernyh/chef-secure-server.png)](https://travis-ci.org/AndreyChernyh/chef-secure-server)

This cookbooks makes Linux server more secure. It's inspired by popular Bryan Kennedy post [My First 5 Minutes On A Server; Or, Essential Security for Linux Servers](http://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers).

## Platforms
Cookbook has been tested on:

* Ubuntu 13.04
* Ubuntu 13.10

```test-kitchen``` integration tests are passing on:

* Ubuntu 12.04
* Ubuntu 13.04
* CentOS 6.4

## Usage
Include ```recipe[secure-server]``` into your runlist to run all recipes. It's also possible to include any particular recipe separately.

## ssh recipe
Uses [openssh cookbook](github.com/opscode-cookbooks/openssh) and basically does 2 things:

1. Disables root login
2. Disables password authentication

Prior to including this recipe, make sure that you can ```sudo``` as non-root user because you won't be able to login as ```root``` via ```SSH``` after converging. Also be sure that you've added your public key to the list of authorized keys, otherwise you won't be able to login.

### Attributes:
* ```node['secure-server']['ssh']['password_authentication']``` - boolean (```true``` or ```false```, default: ```true```)
* ```node['secure-server']['ssh']['permit_root_login']``` - boolean (```true``` or ```false```, default: ```true```)

## firewall recipe
```ufw``` is installed and configured with the help of [firewall cookbook](https://github.com/opscode-cookbooks/firewall).
This recipes configures ```ufw``` to whitelist given ports. This recipe is only supported on Debian and Ubuntu platforms.

### Attributes
* ```node['secure-server']['firewall']['rules']``` - array of hashes, set of ```ufw``` rules

It enables SSH, HTTP and HTTPS by default.
```ruby
default['secure-server']['firewall']['rules'] = [
  { 'port' => 22,  'action' => 'allow' },
  { 'port' => 80,  'action' => 'allow' },
  { 'port' => 443, 'action' => 'allow' }
]
```

## fail2ban recipe
Installs and configures [fail2ban](http://www.fail2ban.org) using [fail2ban cookbook](https://github.com/opscode-cookbooks/fail2ban). By default it monitors ```/var/log/auth.log``` for failed ```SSH``` login attempts. 

### Attributes
See [cookbook page](https://github.com/opscode-cookbooks/fail2ban) for configuration options.

## Testing
[test-kitchen](https://github.com/opscode/test-kitchen) is used for integration testing. Run integration suite with ```kitchen test``` command. Run ```rake``` for basic syntax check and linting.

# License & Author
Andrey Chernih [andrey.chernih@gmail.com](mailto:andrey.chernih@gmail.com)

[Apache 2.0](https://github.com/AndreyChernyh/chef-secure-server/blob/master/LICENSE)
