require 'spec_helper'


describe package('tzdata') do
  it { should be_installed }
end

describe command('date +"%Z"') do
  its(:stdout) { should match /UTC/ }
end

describe file('/entrypoint.sh') do
  it { should exist }
end

describe command('ps') do
  its(:stdout) { should match /entrypoint.sh/ }
  its(:stdout) { should match /crond/ }
end
