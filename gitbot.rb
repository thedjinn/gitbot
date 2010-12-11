#!/usr/bin/env ruby

require "cinch"
require "sinatra"
require "yaml"
require "json"

$config = YAML.load_file "config.yml"
puts $config["host"]

$bot = Cinch::Bot.new do
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

Thread.new do
  $bot.start
end


def say(msg)
  $bot.Channel("#git").send msg
end

get "/" do
  "GITBOT FOO"
end

post "/github" do
  col1 = "\0033"
  col2 = "\0037"
  col3 = "\0030"
  nocol = "\0030"

  push = JSON.parse(params[:payload])

  repo = push["repository"]["name"]
  branch = push["ref"].gsub(/^refs\/heads\//,"")
  
  push["commits"].each do |c|
    say "#{col3}#{repo}: #{col2}#{branch} #{col1}#{c["author"]["name"]} #{nocol}#{c["message"]}"
  end

  push.inspect
end
