require "selenium-webdriver"
require 'test/unit'

include Test::Unit::Assertions

firefox_driver= Selenium::WebDriver.for :firefox
firefox_driver.navigate.to "https://facebook.com"

element1 = firefox_driver.find_element(:name => "email")
element1.send_keys "[[email_user]]"
element2= firefox_driver.find_element(:name => "pass")
element2.send_keys "[[password]]"
element1.submit

my_user_cookie = firefox_driver.manage.cookie_named("c_user")
puts my_user_cookie
assert(my_user_cookie[:value] == "[[your_id]]", "Test Failed")
firefox_driver.quit
