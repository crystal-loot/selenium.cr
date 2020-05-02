require "../spec_helper"

describe "window", tags: "feature" do
  it "can be interacted with" do
    driver = Selenium::HttpDriver.new

    session_id = Selenium::Command::NewSession.new(driver).execute
    Selenium::Command::FullscreenWindow.new(driver, session_id).execute
    Selenium::Command::MaximizeWindow.new(driver, session_id).execute
    Selenium::Command::CloseWindow.new(driver, session_id).execute
    Selenium::Command::DeleteSession.new(driver, session_id).execute
  end
end
