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

Available drivers:

- :chrome (using chromedriver)
- :firefox (using geckodriver)
- :remote (general purpose)

### Running with a service

Rather than running chromedriver yourself, you can give the driver a service which will run the process for you.

```crystal
driver = Selenium::Driver.for(:chrome, service: Service.chrome(driver_path: "~/.webdrivers/chromedriver"))
```

You must call `driver.stop` when you are finished or it will leave the service running.
Consider using [webdrivers.cr](https://github.com/matthewmcgarvey/webdrivers.cr) for automatically installing drivers and managing the driver path for you.

### Creating a Session

```crystal
capabilities = Selenium::Chrome::Capabilities.new
capabilities.args(["no-sandbox", "headless", "disable-gpu"])
driver.create_session(capabilities)
```

Use the appropriate `Capabilities` class for whichever browser you choose.

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
