After do |scenario|
    screenshot = Capybara.page.save_screenshot("reports/screenshots/sc.png")
    attach(screenshot, 'image/png')
end