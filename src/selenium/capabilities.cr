class Selenium::Capabilities
  include JSON::Serializable

  def initialize
  end

  @[JSON::Field(key: "browserName")]
  property browser_name : String?

  @[JSON::Field(key: "browserVersion")]
  property browser_version : String?

  @[JSON::Field(key: "platformName")]
  property platform_name : String?

  @[JSON::Field(key: "acceptInsecureCerts")]
  property accept_insecure_certs : Bool?

  @[JSON::Field(key: "pageLoadStrategy")]
  property page_load_strategy : String?

  property proxy : ProxyConfiguration?

  @[JSON::Field(key: "setWindowRect")]
  property set_window_rect : Bool?

  property timeouts : TimeoutConfiguration?

  @[JSON::Field(key: "strictFileInteractability")]
  property strict_file_interactability : Bool?

  @[JSON::Field(key: "unhandledPromptBehavior")]
  property unhandled_prompt_behavior : String?

  class ProxyConfiguration
    include JSON::Serializable

    @[JSON::Field(key: "proxyType")]
    property proxy_type : String?

    @[JSON::Field(key: "proxyAutoconfigUrl")]
    property proxy_autoconfig_url : String?

    @[JSON::Field(key: "ftpProxy")]
    property ftp_proxy : String?

    @[JSON::Field(key: "httpProxy")]
    property http_proxy : String?

    @[JSON::Field(key: "noProxy")]
    property no_proxy : Array(String)?

    @[JSON::Field(key: "sslProxy")]
    property ssl_proxy : String?

    @[JSON::Field(key: "socksProxy")]
    property socks_proxy : String?

    @[JSON::Field(key: "socksVersion")]
    property socks_version : Int32?
  end
end
