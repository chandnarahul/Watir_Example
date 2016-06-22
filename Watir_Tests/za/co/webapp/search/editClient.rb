require 'rubygems'
require 'watir-webdriver'

class EditClient
	$browser
	def initialize(browser)
		$browser=browser
	end
	
	def editOne
	  $browser.frame(:name => "clientFrame").wait_until_present
	  clientFrameFrame = $browser.frame(:name => "clientFrame")  
	  clientFrameFrame.button(:name => "update").when_present.click
	end
	
	def editTwo
	  $browser.frame(:name => "clientFrame").wait_until_present
	  clientFrameFrame = $browser.frame(:name => "clientFrame") 
	  clientFrameFrame.img(:name => "Address").when_present.click
	  clientFrameFrame.button(:name => "code").when_present.click
	  puts $browser.windows
	  puts $browser.windows.length
	  
	  $browser.windows.each do |windows|
		puts windows.title
	  end	  
	  
	  $browser.window(:title => "Area").when_present.use do
		$browser.radio(:xpath => "//INPUT[@value='123:123:123:1:']").when_present.click
		$browser.button(:name => "Ok").when_present.click
	  end
	  
	  $browser.window(:title => "test").when_present.use
	  clientFrameFrame.button(:name => "Submit").when_present.click
	end

end