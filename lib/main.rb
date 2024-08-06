require 'faraday'
require 'faraday_middleware'
require 'json'
require 'dotenv/load'
require 'optparse'

require_relative 'customer'
require_relative 'visits'
require_relative 'sales_orders'
require_relative 'create_route'
require_relative 'poster'

api_url = ENV['API_URL']
token = ENV['API_TOKEN']

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: ruby main.rb [options]"

  opts.on("-c", "--customer", "Post customer") do |c|
    options[:action] = :post_customer
  end
  
  opts.on("-v", "--visit", "Post visit") do |v|
    options[:action] = :post_visits
  end
  
  opts.on("-s", "--salesOrder", "Post sales order") do |s|
    options[:action] = :post_sales_orders
  end
  
  opts.on("-r", "--createRoute", "Create sales route") do |r|
    options[:action] = :post_create_route
  end
end.parse!

conn = Faraday.new(url: api_url) do |faraday|
    faraday.request  :url_encoded
    faraday.response :logger, nil
    faraday.adapter  Faraday.default_adapter
    faraday.authorization :Bearer, token 
end

case options[:action]
    when :post_customer
        post_customer(conn, api_url)
    when :post_visits
        post_visits_data(conn, api_url)
    when :post_sales_orders
        post_sales_orders(conn, api_url)
    when :post_create_route
      post_create_route_data(conn, api_url)
    else
        puts "Please specify an action (-c for customer, -v for visit, -s for sales order, -r for create route)"
    end