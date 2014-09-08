Feature: Beginning the Mission

	As a Rover Commander
	I want the initial set-up
	So I can give commands
	
  Scenario: The initial set-up
    #I will have to do this every time
	Given I open the browser
    
	And the Mars Mission site
	And I am logged in
	When I get the image at the center of the map
	And I get the source of the image
	
	Then the source image will be the rovers image
	Then the source image will be "Rover"
	
	#And I will have to do this every time
	And I close the browser
	

	