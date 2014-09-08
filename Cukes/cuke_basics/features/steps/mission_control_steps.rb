Given(/^I open the browser$/) do                                   
  @browser = Watir::Browser.new :firefox
end    

Given(/^the Mars Mission site$/) do                                   
  @browser.goto 'localhost:11411' 
end                                                                   
                                                                      
Given(/^I am logged in$/) do                                          
  @browser.text_field(:id => 'UserName').set('Red')
  @browser.text_field(:id => 'Password').set('Rover123')
  @browser.button(:value => 'Log In').click   
end                                                                   
 	  
When(/^I get the image at the center of the map$/) do                 
  sleep(6) #This is a necessary evil because the page, due to the 2500 images, takes several seconds to load
  #We will see later how this is solved and the need for sleep statements is removed
  centerOfMap = '25_25'
  @image = @browser.img :id => centerOfMap
end                                                                   
   	  
When(/^I get the source of the image$/) do           
  @source = @image.src 
end   

Then(/^the source image will be the rovers image$/) do
  fail 'Rover was not found at the given location' unless expect(@source).to include('Rover')
end           
   
Then(/^the source image will be "(.*?)"$/) do |name|               
  expect(@source).to include(name)  
end 

Then(/^I close the browser$/) do               
  @browser.close   
end                                                                   