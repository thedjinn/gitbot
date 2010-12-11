#!/usr/bin/env ruby

require "cinch"
require "sinatra"
require "yaml"

$config = YAML.load_file "config.yml"
puts $config["host"]

class GitBot
  include Cinch::Plugin

  match "hello"

  def execute(m)
    m.reply "Hello"
  end
end

bot = Cinch::Bot.new do
  configure do |c|
    c.nick = $config["nick"]
    c.user = "gitbot"
    c.realname = "GitBot (c) piet"
    c.server = $config["server"]
    c.port = $config["port"]
    c.channels = ["#git"]
    c.plugins.plugins = [GitBot]
  end
end

#Thread.new do
#  bot.start
#end

get "/" do
  bot.Channel("#git").send "foo bar test"
  "GITBOT FOO"
end
