require 'watir-webdriver'
browser = Watir::Browser.new :firefox
browser.goto 'www.apple.com'

sleep 15

browser.close