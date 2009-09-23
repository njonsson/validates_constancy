spec = Gem::Specification.new do |s|
  s.name        = 'validates-constancy-rails-plugin'
  s.version     = '1.0.20090924'
  s.author      = 'Nils Jonsson'
  s.email       = 'nils@alumni.rice.edu'
  s.homepage    = 'http://constancy.rubyforge.org/'
  s.summary     = "[Rails] Adds a 'validates_constancy_of' validation to "    +
                  'Active Record. It allows you to protect model attributes ' +
                  'from being changed after a record is created.'
  s.description = 'This RubyGem allows you to prevent particular database '  +
                  'fields from being changed after an Active Record object ' +
                  'is created. A validation error occurs on updates if an '  +
                  'attribute of a model object is different from its value ' +
                  'in the database.'
  
  s.files = %w( CHANGELOG MIT-LICENSE README.rdoc Rakefile init.rb
                config/locales/en.yml
                config/locales/ru.yml
                lib/validates_constancy.rb
                lib/validates_constancy/constancy_validation.rb
                test/README.rdoc)
  
  s.add_dependency 'activerecord'
  s.autorequire       = 'validates_constancy'
  s.has_rdoc          = true
  s.extra_rdoc_files  = %w(MIT-LICENSE README.rdoc)
  s.rubyforge_project = 'constancy'
  s.rdoc_options << '--title' << 'Validates Constancy for Active Record' <<
                    '--main' << 'README.rdoc'
end
