#!/usr/bin/env ruby

require "sinatra"
require "base64"

class Gem::StubSpecification; def data; raise "no-data-for-you"; end; end

class Greeter
  def initialize
    @time = Time
  end

  def run
    "Greetings! The time is #{@time.now}?"
  end
end

class TheFlag
  def run
    "no flag for you"
  end

  def method_missing(m, *args, &block)
    File.read("flag.txt")
  end
end

def serialize(obj)
  Base64.urlsafe_encode64(Marshal.dump(obj))
end

def unserialize(serialized)
  Marshal.load(Base64.urlsafe_decode64(serialized))
end

configure do
  enable :inline_templates
end

helpers do
  include ERB::Util
end

get "/" do
  @title = "Maxine"
  @serialized_greeter = serialize(Greeter.new)

  erb :index
end

get "/source" do
  File.read(__FILE__)
end

get "/runner" do
  greeter = unserialize(params[:serialized_data].to_s)
  @output = greeter.run
  erb :runner
end

__END__

@@ layout
<!doctype html>
<html>
 <style>
   body {
     background: yellow;
   }
 </style>
 <head>
  <title><%= h @title %></title>
 </head>
 <body>
  <h1><%= h @title %></h1>
  <%= yield %>
 </body>
</html>

@@ index
<a href="/source">Source Code</a>
<a href="/runner?serialized_data=<%= h @serialized_greeter %>">Greeter</a>

@@ runner
<%= h @output %>
