name             'secure-server'
maintainer       'Andrey Chernih'
maintainer_email 'andrey.chernih@gmail.com'
license          'Apache License, Version 2.0'
description      'Make Linux server relatively secure'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

recipe 'ssh',      'Installs and configures OpenSSH'
recipe 'firewall', 'Enables ufw and sets up white listed ports'
recipe 'fail2ban', 'Installs and configures fail2ban to watch for SSH connections'

%w(ubuntu centos).each{|os| supports os}
%w(openssh firewall fail2ban).each{|cookbook| depends cookbook}
