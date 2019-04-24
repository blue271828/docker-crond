require 'serverspec'
require 'docker'

set :backend, :docker
set :docker_image, 'crond:0.0.1'
