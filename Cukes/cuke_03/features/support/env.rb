require 'rspec/expectations'
require 'page-object'

World(PageObject::PageFactory)

$context = "localhost"
$port = "11411" 
$environment = "http://#{$context}:#{$port}"