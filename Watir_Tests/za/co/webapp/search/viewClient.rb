require 'rubygems'
require 'watir-webdriver'

class ViewClient
	$browser
	def initialize(browser)
		$browser=browser
	end
	
	def submit
	  $browser.frame(:name => "frame1").wait_until_present
	  frame1Frame = $browser.frame(:name => "frame1") 
	  frame1Frame.a(:text => "submit").click
	  $browser.frame(:name => "clientFrame").wait_until_present
	  clientFrame = $browser.frame(:name => "clientFrame")  
	  clientFrame.text_field(:name =>"pin").when_present.send_keys "123123"
	  clientFrame.button(:name => "submit").when_present.click
	  clientFrame.a(:xpath => "//a[@HREF='javascript:clientInfo (123123)']").when_present.click 
	end
	
	def nav
	  $browser.frame(:name => "menuFrame").wait_until_present
	  menuFrame = $browser.frame(:name => "menuFrame") 
	  menuFrame.a(:text => "menu one").when_present.click
	  menuFrame.a(:text => "menu two").when_present.click	  
	  $browser.frame(:name => "frame1").wait_until_present
	  frame1Frame = $browser.frame(:name => "frame1") 
	  frame1Frame.a(:name => "submit").when_present.click 
	end

end