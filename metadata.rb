name             'secure-server'
maintainer       'Andrey Chernih'
maintainer_email 'andrey.chernih@gmail.com'
license          'All rights reserved'
description      'Make Linux server relatively secure'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'ssh', 'Installs and configures OpenSSH'

supports 'ubuntu'

depends 'openssh'
