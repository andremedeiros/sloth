$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sloth'

def humanize_spec(file)
  base_name = File.basename(file, '_spec.rb')
  "Code test: #{ base_name.tr('_', ' ') }"
end
