require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Vectra::Api, 'Configure' do
  include_context "shared environment"

  it 'configures correctly' do
    Vectra.configure do |config|
      config.endpoint = @endpoint_url
      config.username = @username
      config.password = @password
    end
  end

  it 'gets all hosts' do
    puts Vectra::Hosts.all
  end

  it 'gets all detections' do
    puts Vectra::Detections.all
  end

  it 'gets detection by id' do
    puts Vectra::Detections.get(95)
  end

end