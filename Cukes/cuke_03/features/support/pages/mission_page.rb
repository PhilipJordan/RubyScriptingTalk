
class MissionPage
  include PageObject
  include RSpec::Matchers
  
  page_url "#{$environment}/Mission/Staging" 
  span(:title, :id => "MissionControl")
  button(:addObstacles, :value => 'Add')
  button(:sendCommands, :id => 'sendCommands')
  button(:moveForward, :id => 'forward')
  button(:moveBackward, :id => 'backward')
  button(:turnRight, :id => 'right')
  button(:turnLeft, :id => 'left')
  button(:fireMissile, :id => 'fireMissile')
  button(:fireMortar, :id => 'fireMortar')

  #This required that we pass the resulting message between step defs (bad form)  
  def get_alert_message_on_button_click 
    message = self.alert do
		self.addObstacles
	end
	message
  end
  
  #This was our first attempt at a refactor where we passed the block in (less readable in step def but it worked)
  def get_alert_message_on &block 
    message = self.alert do 
		yield
	end
	message
  end
  
  #Nick pushed back here on the original implementations (above) and we hit on this solution #PairProgrammingFTW
  def get_alert_message
	message = @browser.alert.text
	@browser.alert.close
	message
  end
  
#  def verifyAlertMessageIsCreatedWith message
#	messageReturned = self.alert do
#		self.addObstacles
#	end
#	
#	messageReturned.should include message
# end
    
  def click_control_at image_id
	@browser.img(:id => image_id).click
  end
  
  def get_image_at image_id
     @browser.img(:id => image_id).src	 
  end
  
  #Aaron pushed back when shown this and we came up with this method (much faster) #PairProgrammingFTW
  def map_contains? image_name 
	@browser.img(:src => "/Images/#{image_name}.png").exists?
  end

  #my original implementation
  def map_does_not_include_slow image_name
	@browser.imgs().each {|element| "#{element.src.should_not include image_name}"} 
  end
  
  def alert_message
	@message
  end
  
end