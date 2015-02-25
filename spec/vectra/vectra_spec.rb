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

end