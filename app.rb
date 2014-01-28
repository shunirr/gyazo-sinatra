require 'rubygems'
require 'sinatra'
require 'rack'

module Gyazo
  class Controller < Sinatra::Base
    configure do
      set :image_dir, 'public/images'
      set :image_url, 'http://static.s5r.jp/images'
    end

    post '/' do
      id = request[:id]
      data = request[:imagedata][:tempfile].read
      hash = (rand * 10 ** 8).to_i.to_s(16)
      File.open("#{options.image_dir}/#{hash}.png", 'w'){|f| f.write(data)}
      "#{options.image_url}/#{hash}.png"
    end
  end
end
