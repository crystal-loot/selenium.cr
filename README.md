# selenium.cr

![GitHub release (latest by date)](https://img.shields.io/github/v/release/matthewmcgarvey/selenium.cr)

Selenium client for interacting with web pages for browser automation.

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
driver = Selenium::Driver.for(:chrome)
```

Available drivers:

- :chrome (using chromedriver)
- :firefox (using geckodriver)
- :remote (general purpose)

### Creating a Session

```crystal
capabilities = Selenium::Chrome::Capabilities.new
capabilities.args(["no-sandbox", "headless", "disable-gpu"])
driver.create_session(capabilities)
```

Use the appropriate `Capabilities` class for whichever browser you choose.

## Development

To run the tests you must have the appropriate driver running.
The tests use chrome by default. The command to start chromedriver as the tests expect is:

```bash
chromedriver --port=4444 --url-base=/wd/hub
```

Run `crystal spec` to run the tests. It will run the tests in headless mode.

To run the tests with firefox you will need to have the geckodriver running and run `SELENIUM_BROWSER=firefox crystal spec`

## Contributing

1. Fork it (<https://github.com/matthewmcgarvey/selenium.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Matthew McGarvey](https://github.com/matthewmcgarvey) - creator and maintainer
