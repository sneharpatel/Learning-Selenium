require "selenium-webdriver"

firefox_driver = Selenium::WebDriver.for :firefox
firefox_driver.navigate.to "https://google.com"

queryElement = firefox_driver.find_element(:xpath => '//*[@name="q"]')
queryElement.send_keys "Hello WebDriver!"
queryElement.submit
sleep(5)

puts firefox_driver.title

firefox_driver.quit