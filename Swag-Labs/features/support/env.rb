require 'cucumber'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'selenium-webdriver'
require 'rspec'
require 'pry'

ENVIRONMENT = ENV['ENVIRONMENT']
ENVIRONMENT_CONFIG = YAML.load_file(File.dirname(__FILE__) + "/environment/#{ENVIRONMENT}.yml")
puts ENVIRONMENT_CONFIG
URL = ENVIRONMENT_CONFIG['url']


Capybara.register_driver :my_chrome do |app|
    caps = Selenium::WebDriver::Remote::Capabilities.chrome("goog:chromeOptions" => {"args" => [ "--ignore-ssl-errors",
                                                                                                 "--ignore-certificate-errors", 
                                                                                                 "--disable-popup-blocking", 
                                                                                                 "--incognito", 
                                                                                                 "--start-maximized", 
                                                                                                 "--window-size=1420,835", 
                                                                                                 "--disable-gpu", 
                                                                                                 "--disable-translate", 
                                                                                                 "--no-sandbox", 
                                                                                                 "--acceptInsecureCerts=true", 
                                                                                                 "--disable-impl-side-painting", 
                                                                                                 "--debug-level=3"]})
    
    if ENV['HEADLESS']
        caps['goog:chromeOptions']['args'] << '--headless'
        caps['goog:chromeOptions']['args'] << '--disabled-site-isolation-trials'
    end

    client = Selenium::WebDriver::Remote::Http::Default.new
    client.read_timeout = 90
    options = { browser: :chrome, desired_capabilities: caps, http_client: client}
    puts 'Raising driver'
    Capybara::Selenium::Driver.new(app, options)
end

Capybara.register_driver :my_firefox do |app|
    caps = Selenium::WebDriver::Remote::Capabilities.firefox("moz:firefoxOptions" => {"args" => ["--ignore-ssl-errors",
                                                                                                 "--ignore-certificate-errors",
                                                                                                 "--disable-popup-blocking",
                                                                                                 "--private",
                                                                                                 "--window-size=1420,835",
                                                                                                 "--acceptInsecureCerts=true",
                                                                                                 "--disable-impl-side-painting",
                                                                                                 "--debuggerAddress=127.0.0.1:9222"]})
  
    if ENV['HEADLESS']
      caps['moz:firefoxOptions']['args'] << '--headless'
    end
  
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.read_timeout = 90
    options = { browser: :firefox, desired_capabilities: caps, http_client: client }
    Capybara::Selenium::Driver.new(app, options)
end

if ENV['BROWSER'] == 'firefox'
    Capybara.default_driver = :my_firefox
else
    Capybara.default_driver = :my_chrome
end
Capybara.app_host              = URL
Capybara.default_max_wait_time = 10