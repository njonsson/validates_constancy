require File.dirname(__FILE__) + '/../test_helper'


module VeryImportantPersonTest
  
  class Midori < ActiveSupport::TestCase
    
    fixtures :people
    
    def setup
      super
      @person = people(:midori)
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class MidoriWithChangedName < ActiveSupport::TestCase
    
    fixtures :people
    
    def setup
      super
      @person = people(:midori)
      @person.name = 'Midori the Great'
    end
    
    def test_should_have_error_on_name
      @person.valid?
      assert_equal ['Name is engraved on the Walk of Fame'],
                   @person.errors.full_messages
    end
    
  end
  
  
  class MidoriWithChangedBecameImportantOn < ActiveSupport::TestCase
    
    fixtures :people
    
    def setup
      super
      @person = people(:midori)
      @person.became_important_on = Time.now
    end
    
    def test_should_have_error_on_became_important_on
      @person.valid?
      assert_equal ['Became important on is set in stone'],
                   @person.errors.full_messages
    end
    
  end
  
  
  class MidoriWithStringifiedBecameImportantOn < ActiveSupport::TestCase
    
    fixtures :people
    
    def setup
      super
      @person = people(:midori)
      @person.became_important_on = '1982-12-31'
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class MidoriWithChangedNameAndBecameImportantOn < ActiveSupport::TestCase
    
    fixtures :people
    
    def setup
      super
      @person = people(:midori)
      @person.name                = 'Midori the Great'
      @person.became_important_on = Time.now
    end
    
    def test_should_have_errors_on_name_and_became_important_on
      @person.valid?
      assert_equal ['Name is engraved on the Walk of Fame',
                    'Became important on is set in stone'],
                   @person.errors.full_messages
    end
    
  end
  
  
  class New < ActiveSupport::TestCase
    
    fixtures :people
    
    def setup
      super
      @person = VeryImportantPerson.new
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
    def test_should_have_user_defined_after_find_method
      assert_equal false,
                   @person.instance_variable_defined?(:@after_find_counter)
      @person.save!
      @person = Person.find(@person.id)
      assert_equal 1, @person.instance_variable_get(:@after_find_counter)
    end
    
  end
  
  
  class NewWithChangedName < ActiveSupport::TestCase
    
    fixtures :people
    
    def setup
      super
      @person = VeryImportantPerson.new(:name => 'Midori (Goto)')
      @person.name = 'Midori the Great'
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class NewWithChangedBirthdate < ActiveSupport::TestCase
    
    fixtures :people
    
    def setup
      super
      @person = VeryImportantPerson.new(:birthdate => '1971-10-25')
      @person.birthdate = '1971-07-12'
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class NewSavedWithBirthdate < ActiveSupport::TestCase
    
    fixtures :people
    
    def setup
      super
      @person = VeryImportantPerson.new(:birthdate => '1971-10-25')
      @person.save!
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
    def test_should_be_valid_when_birthdate_is_changed
      @person.birthdate = '1971-07-12'
      assert_valid @person
    end
    
  end
  
  
  class NewWithChangedBecameImportantOn < ActiveSupport::TestCase
    
    fixtures :people
    
    def setup
      super
      @person = VeryImportantPerson.new(:became_important_on => '1982-12-31')
      @person.became_important_on = Time.now
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class NewSavedWithBecameImportantOn < ActiveSupport::TestCase
    
    fixtures :people
    
    def setup
      super
      @person = VeryImportantPerson.new(:became_important_on => '1982-12-31')
      @person.save!
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
    def test_should_have_error_on_became_important_on_when_changed
      @person.became_important_on = Time.now
      @person.valid?
      assert_equal ['Became important on is set in stone'],
                   @person.errors.full_messages
    end
    
  end
  
  
  class NewWithChangedNameAndBecameImportantOn < ActiveSupport::TestCase
    
    fixtures :people
    
    def setup
      super
      @person = VeryImportantPerson.new(:name => 'Midori (Goto)',
                                        :became_important_on => '1982-12-31')
      @person.name                = 'Midori the Great'
      @person.became_important_on = Time.now
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
end
