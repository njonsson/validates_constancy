Dir.glob("#{File.dirname __FILE__}/validates_constancy/**/*.rb") do |filename|
  require filename
end

ActiveRecord::Base.class_eval { include ConstancyValidation }
