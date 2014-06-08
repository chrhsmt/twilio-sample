require 'rubygems' unless defined? ::Gem
require 'sinatra'
require "sinatra/reloader" if development?
require "sinatra/json"
require 'pry' if development?

require_relative "twilio_action"
require_relative 'models/init'

class App < Sinatra::Base
    register Sinatra::Reloader

    enable :sessions
 
    get "/stylesheet/main.css" do
        scss :"scss/main"
    end

    get "/javascript/main.js" do
        coffee :"coffee/main"
    end

    get '/' do
        session[:referer] = request.referer
        erb :index, locals: { test: "yes" }
    end

    post "/call" do 
        begin
            TwilioAction.new.call params["tel"]
            User.new({tel: params["tel"], ip: request.ip, referer: session[:referer], user_agent: request.user_agent}).save
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

    get "/callbak" do 
        p request
        p params
    end
end
