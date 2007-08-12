Dir.glob(File.join(File.dirname(__FILE__), 'lib', '**', '*.rb')) do |filename|
  require File.expand_path(filename)
end

ActiveRecord::Base.class_eval { include ConstancyValidation }
