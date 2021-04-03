require "./spec_helper"

describe Selenium do
  it "has version in sync with shard.yml" do
    content = File.open("shard.yml") do |file|
      file.gets_to_end
    end

    version = /version\:(.*?)\n/.match(content).not_nil![1].strip
    version.should eq Selenium::VERSION
  end
end
