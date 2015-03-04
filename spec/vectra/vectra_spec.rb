require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Vectra::API, 'Configure' do
  include_context "shared environment"

  it 'configures correctly' do
    Vectra.configure do |config|
      config.endpoint = @endpoint_url
      config.username = @username
      config.password = @password
    end
  end

  # This WILL be costly
  #it 'gets all hosts' do
  #  hosts = Vectra::Hosts.all
  #  puts hosts.count
  #end

  it 'gets host by id' do
    puts Vectra::Hosts.get(1).inspect
  end  

  it 'gets host by link' do
    puts Vectra::Hosts.get("http://blah/api/hosts/1").inspect
  end

  it 'gets all detections' do
    puts Vectra::Detections.all
  end

  it 'gets detection by id' do
    puts Vectra::Detections.get(95)
  end

  it 'gets detection by id' do
    puts Vectra::Detections.get("http://blah/api/detections/2").inspect
  end

end