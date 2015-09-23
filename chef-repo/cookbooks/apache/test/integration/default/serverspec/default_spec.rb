require 'spec_helper'

describe 'apache::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  it 'is awesome' do
    expect(true).to eq true
  end

  it 'is running' do
    expect(service 'apache2').to be_running
  end

  it 'is listening on the expected port' do
    expect(port 80).to be_listening
  end

  it 'home page says hello' do
    expect(command('curl http://localhost').stdout).to contain /hello/i
  end




end
