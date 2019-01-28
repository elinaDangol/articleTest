class WeatherController < ApplicationController

	def index

	end

	def api
        #api key from openweather : 32853277f3fa28addad2b2f8e42903f6
		# url1 = 'https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22'
		# url1 ='http://api.openweathermap.org/data/2.5/weather?q=kathmandu,NP&appid=f261d4b9a214e0ea3c3ae99e6c357fb0'
        url1 ='http://api.openweathermap.org/data/2.5/weather?q=kathmandu,np&APPID=32853277f3fa28addad2b2f8e42903f6'
    	response = HTTParty.get(url1, headers: {
      		'Accept' => 'application/json'
    	})
    	@result1 = response.to_h
    	@r=@result1['main']['temp']
    	@temp=response.code
    	@tempInCelcius = (@r - 273.15).round(2)

    #secret key from darksky : 6a6b8657a17db4fc8fc7f18731d39b12
    url2 = 'https://api.darksky.net/forecast/6a6b8657a17db4fc8fc7f18731d39b12/27.7172,85.3240' 
    response = HTTParty.get(url2, headers: {
    	'Accept' => 'application/json'
    })
    @result2 = response.to_h
    @tempFromUrl2 = @result2['currently']['temperature']
    @temp2 = ((@tempFromUrl2 - 32) *(0.56)).round(2)

    @average_temp = ((@tempInCelcius + @temp2)/2).round(2)
	end	
end
