if ENV['CODECLIMATE_REPO_TOKEN']
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sloth'

def humanize_code_spec(file)
  humanize_spec(:code, file)
end

def humanize_checker_spec(file)
  humanize_spec(:checker, file)
end

def humanize_spec(type, file)
  base_name = File.basename(file, '_spec.rb').tr('_', ' ')
  "#{ type.to_s.capitalize } test: #{ base_name }"
end

# Simplify namespaces
include Sloth
