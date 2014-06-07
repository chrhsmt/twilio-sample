require 'rubygems' unless defined? ::Gem
require 'sinatra'
require "sinatra/reloader" if development?
require "sinatra/json"

require_relative "twilio_action"
require_relative 'models/init'

class App < Sinatra::Base
    register Sinatra::Reloader
 
    get "/stylesheet/main.css" do
        scss :"scss/main"
    end

    get "/javascript/main.js" do
        coffee :"coffee/main"
    end

    get '/' do
        @message = "hi, how are you ?"
        @users = User.all
        erb :index, locals: { test: "yes" }
    end

    post "/call" do 
        begin
            TwilioAction.new.call params["tel"]
            json result: true
        rescue => e 
            p e
            status 500
            json result: false
        end
    end

    get "/twilio.xml" do 
        content_type "application/xml"
        erb :twilio_response, layout: false
    end
end
