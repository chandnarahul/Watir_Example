require 'rubygems'
require 'watir-webdriver'

class Login
	$browser
	def initialize(browser)
		$browser=browser
	end
	
	def performLoginTest
	  $browser.button(:name => "Submit").when_present.click	 
	end

end