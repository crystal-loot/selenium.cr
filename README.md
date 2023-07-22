# selenium.cr

Selenium client for interacting with web pages for browser automation.

[API Documentation](https://matthewmcgarvey.github.io/selenium.cr/)

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     selenium:
       github: matthewmcgarvey/selenium.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "selenium"
```

### Creating a Driver

```crystal
driver = Selenium::Driver.for(:chrome, base_url: "http://localhost:9515")
```

Creating a driver this way assumes that you have the driver running already.

Available drivers:

- :chrome (using chromedriver)
- :firefox (using geckodriver)
- :remote (general purpose)

### Running with a service

Rather than running chromedriver yourself, you can give the driver a service which will run the process for you.

```crystal
service = Selenium::Service.chrome(driver_path: File.expand_path("~/.webdrivers/chromedriver", home: true))
driver = Selenium::Driver.for(:chrome, service: service)
```

You must call `driver.stop` when you are finished or it will leave the service running.
Consider using [webdrivers.cr](https://github.com/matthewmcgarvey/webdrivers.cr) for automatically installing drivers and managing the driver path for you.

### Creating a Session

```crystal
capabilities = Selenium::Chrome::Capabilities.new
capabilities.chrome_options.args = ["no-sandbox", "headless", "disable-gpu"]
driver.create_session(capabilities)
```

Use the appropriate `Capabilities` class for whichever browser you choose.

### Navigating and Interacting with Web pages

```crystal
# Navigate to Google's homepage
session.navigate_to("https://www.google.com/")

# Find the search input element by its name, which is "q"
element = session.find_element(:name, "q")

# Enter the text "Selenium library for Crystal" into the search input
element.send_keys("Selenium library for Crystal")

# Submit the form where the search input belongs to
element.submit

# Define a Selenium Wait object, which will help us to wait until a certain condition is met.
# Here, we are setting a timeout of 5 seconds (the maximum time to wait) and a polling interval of 1 second (the time to wait between each check)
wait = Selenium::Helpers::Wait.new(timeout: 5.seconds, interval: 1.second)

# Use the wait object to wait until the search results are displayed.
# We do this by checking if the element with the CSS selector "#search" is found on the page.
wait.until { session.find_element(:css, "#search") }

# Print the title of the current page
puts session.title

# Take a screenshot of the current state of the browser window and save it to a file named "result.png"
session.screenshot("result.png")

# Close the browser session
session.delete

# Stop the driver
driver.stop
```

## Development

Run `crystal spec` to run the tests. It will run the tests in headless mode.

To run the tests with chrome headlessly:

```crystal
SELENIUM_BROWSER=chrome crystal spec --tag "~chrome"
```

To run the tests with firefox headlessly:

```crystal
SELENIUM_BROWSER=firefox crystal spec --tag "~firefox"

```

The tag skips any specs that are know to break with those browsers.
Running just `crystal spec` will use chrome.

## Contributing

1. Fork it (<https://github.com/matthewmcgarvey/selenium.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Matthew McGarvey](https://github.com/matthewmcgarvey) - creator and maintainer
