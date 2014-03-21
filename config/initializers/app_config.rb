require 'ostruct'
require 'yaml'

config_file = File.join(Rails.root, 'config', 'app_config.yml')

config = File.exist?(config_file) && YAML.load_file(config_file) || {}
AppConfig = OpenStruct.new(config[Rails.env] || {})