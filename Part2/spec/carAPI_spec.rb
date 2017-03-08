require 'spec_helper'
require 'faraday'
require 'certified'
require 'faraday_middleware'
require 'JSON'
require 'rspec-api/expectations'

# API keys -
# g7z2vxtxp5uqe6d3red4yq8m
# 6hus7ymn4y3r25m495nt8m6v
# 3r474rw9pqbp3n89tyxxr4yf
# 7jewp5zzfy8jhry42m8zdkma  

describe 'Testing the car api from edmunds' do
	
	# You can change values here to test behavior. Didn't have time to implement a controller to 
	# call them, due to time constraints. Api Keys are provided above. Just copy paste into the 
	#  variable
	make = 'honda' #(ex:- toyota, audi, bmw...etc)
	model = 'civic' #(depends on the make, ex:- prius, a8, x3...etc)
	year = '2008' 
	api_key = 'api_key=7jewp5zzfy8jhry42m8zdkma'
	
	searchByMake = make + '?' + api_key
	searchByMakeModel = make + '/' + model + '?' + api_key
	searchByMakeModelYear = make + '/' + model + '?year=' + year + '&' + api_key

	conn = Faraday.new(:url => 'https://api.edmunds.com/api/vehicle/v2/')
	
	response1 = conn.get searchByMake
	
	it 'should hit the site searching for a make of car' do
		expect(response1.status).to be 200
	end
	
	it 'should show all the models for the particular make' do
		JsonObject = JSON.parse(response1.body)
		expect(JsonObject['niceName']).to eq(make)
	end
	
	response2 = conn.get searchByMakeModel
	
	it 'should hit the site and should show the years for the make and model' do
		expect(response2.status).to be 200
		JsonObject2 = JSON.parse(response2.body)
		expect(JsonObject2['niceName']).to eq(model)
		expect(JsonObject2).to include('years')
	end
	
	response3 = conn.get searchByMakeModelYear
	
	it 'should show all the different styles of the model of the car for a particular year' do
		expect(response3.status).to be 200
		JsonObject3 = JSON.parse(response3.body)
		expect(JsonObject3['niceName']).to eq(model)
		expect(JsonObject3['years'].first['year']).to eq(year.to_i)
		expect(JsonObject3['years'].first['styles']).to be_an_instance_of(Array)
	end
	
end