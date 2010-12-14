#!/usr/bin/env ruby

require "rubygems"
require "bundler"
begin
  Bundler.setup
rescue Bundler::BundlerError => e
  STDERR.puts e.message
  STDERR.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require "cinch"
require "sinatra"
require "yaml"
require "json"

config_file = ARGV.shift || "config.yml"
if not File.exists? config_file
  puts "can't find config file #{config_file}"
  puts "either create it or specify another config file with #{$0} [filename]"
  exit
end

$config = YAML.load_file config_file
puts $config["host"]

$bot = Cinch::Bot.new do
  configure do |c|
    c.nick = $config["irc"]["nick"]
    c.user = "gitbot"
    c.realname = "GitBot (c) piet"
    c.server = $config["irc"]["server"]
    c.port = $config["irc"]["port"]
    c.channels = $config["irc"]["channels"]
  end
end

Thread.new do
  $bot.start
end

def say(msg)
  $bot.Channel("#git").send msg
end

configure do
  set :bind, $config["http"]["host"]
  set :port, $config["http"]["port"]
  set :logging, false
  set :lock, true
end

get "/" do
  "GITBOT FOO"
end

post "/github" do
  p params[:payload]
  push = JSON.parse(params[:payload])

  repo = push["repository"]["name"]
  branch = push["ref"].gsub(/^refs\/heads\//,"")

  # TODO: sort commits by timestamp
  push["commits"].each do |c|
    say "\0030#{repo}:\0037 #{branch}\0033 #{c["author"]["name"]}\003 #{c["message"]}"
  end

  push.inspect
end
