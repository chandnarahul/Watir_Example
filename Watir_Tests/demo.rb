require 'test/unit'
require 'rubygems'
require 'watir-webdriver'
require './za/co/webapp/login/Login'
require './za/co/webapp/inbox/Inbox'
require './za/co/webapp/search/ViewClient'
require './za/co/webapp/search/EditClient'
require 'csv'
class Demo < Test::Unit::TestCase
  $browser
  def test_IE  
	  readCSV  
	  $browser = Watir::Browser.new :ie
	  performOperations
  end
  
  def readCSV
	CSV.foreach(File.join(File.dirname(__FILE__), "data.csv")) do |line|
		puts line[0] +" "+ line[1] +" "+ line[2] +" "+ line[3]   
	end  
  end
  
  def performOperations
  	  $browser.goto "http://localhost:8080"
	  login=Login.new($browser)
	  login.performLoginTest
	  inbox=Inbox.new($browser)
	  inbox.testOne
	  inbox.testTwo
	  viewClient=ViewClient.new($browser)
	  viewClient.submit
	  editClient=EditClient.new($browser)
	  editClient.editOne
	  editClient.editTwo
	  viewClient.nav
	  $browser.close
	  $browser.quit
  end

end  