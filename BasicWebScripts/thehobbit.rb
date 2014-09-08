require 'watir-webdriver'
browser = Watir::Browser.new :firefox
browser.goto 'www.imdb.com'

browser.text_field(:id => 'navbar-query').set "The Hobbit: The Battle of Five Armies"
browser.button(:id => 'navbar-submit-button').click
browser.table(:class => 'findList').tr{0}.cell{1}.a.click
browser.a(:class => 'btn2 btn2_text_on large title-trailer video-colorbox').click

sleep 100 

browser.close
