# Includes ConstancyValidation in ActiveRecord::Base.

Dir.glob(File.join(File.dirname(__FILE__),
         'validates_constancy',
         '*.rb')) do |filename|
  require filename
end

ActiveRecord::Base.class_eval { include ConstancyValidation }

if Object.const_defined?(:I18n)
  Dir[File.join(File.dirname(__FILE__), '..', 'config', 'locales', '*.yml')].each do |f|
    I18n.load_path << f
  end
else
  ActiveRecord::Errors.default_error_messages[:constancy] = "can't be changed"
end