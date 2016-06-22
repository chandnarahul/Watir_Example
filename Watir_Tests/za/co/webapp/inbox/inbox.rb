require 'rubygems'
require 'watir-webdriver'

class Inbox
	$browser
	def initialize(browser)
		$browser=browser
	end
	
	def testOne
	  $browser.frame(:name => "clientFrame").wait_until_present
	  clientFrame = $browser.frame(:name => "clientFrame") 
	  clientFrame.img(:name=>"test").when_present.click
	  clientFrame.button(:name => "Apply").when_present.click
	  $browser.alert.ok
	  clientFrame.select_list(:name => "dropdown").when_present.send_keys 'First'
	  clientFrame.select_list(:name => "SubjectSelectBox").when_present.send_keys 'test Value'
	  clientFrame.button(:name => "Display").when_present.click	  
	end
	
	def testTwo
	  $browser.frame(:name => "clientFrame").wait_until_present
	  clientFrame = $browser.frame(:name => "clientFrame") 
	  clientFrame.img(:name => "test").when_present.click
	end

end