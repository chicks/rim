= rim

* http://github.com/chicks/rim

== DESCRIPTION:

Ruby Identity Manager (rim) is a library for managing "identities" on remote systems. 

== FEATURES/PROBLEMS:

* Agent-less interface for manipulating user accounts
* Built-in support for POSIX style user management (/etc/passwd, /etc/shadow, etc.)
* Supports common protocols: SSH, Telnet
* Extendable to support identity management on just about anything

== SYNOPSIS:

In a nutshell:
  
  require 'rim'

  # Create a new IdentityAdapter
  adapter = LinuxAdapter.new('127.0.0.1', 'root', 'letmein')

  # Grab a user
  user    = adapter.fetch_user 'pookie'

  name    = user.name
  uid     = user.uid
  gid     = user.gid
  gecos   = user.gecos
  home    = user.home_dir
  shell   = user.shell

  # Result is true or false
  result  = adapter.add_user('yogibear', 'yellowstone')

== REQUIREMENTS:

* net-ssh

== INSTALL:

* gem install rim

== LICENSE:

(The MIT License)

Copyright (c) 2009 Carl Hicks <carl.hicks@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
