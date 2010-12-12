GitBot is a Ruby IRC bot that provides a builtin GitHub webhook server. 

Installation
============

GitBot will be provided as a Ruby gem when it's ready. Stay tuned.

Usage
=====

* First you must make a `config.yml` file so that GitBot knows where it should connect to. You can make a copy of the `config.yml.example` file and use that as a basis.

* After that just run `gitbot.rb`. This will start the bot and its built-in webhook server.

* You can now add a webhook to a GitHub project. Use the following url: `http://server.com:5651/github`. 

* Now do some commits and see the commit messages appearing on the IRC channel.

License
=======

Copyright (c) 2010 Emil Loer <http://koffietijd.net>

Permission  is  hereby granted, free of charge, to any person obtaining a copy of  this  software  and  associated  documentation files  (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is  furnished to do so, subject to the following conditions:

The  above  copyright  notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF  ANY  KIND, EXPRESS  OR  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE  AND  NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER  IN  AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN  THE SOFTWARE.
