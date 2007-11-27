require File.dirname(__FILE__) + '/../test_helper'


module SchmoeTest
  
  class JoeSchmoe < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = people(:joe_schmoe)
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class JoeSchmoeWithChangedName < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = people(:joe_schmoe)
      @person.name = 'John Doe'
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class JoeSchmoeWithChangedSocialSecurityNumber < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = people(:joe_schmoe)
      @person.social_security_number = '555-55-5555'
    end
    
    def test_should_have_error_on_social_security_number
      @person.valid?
      assert_equal ["Social security number can't be changed"],
                   @person.errors.full_messages
    end
    
  end
  
  
  class JoeSchmoeWithChangedFirstSpeedTicketAt < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = people(:joe_schmoe)
      @person.first_speeding_ticket_at = 2.months.ago
    end
    
    def test_should_have_error_on_first_speeding_ticket_at
      @person.valid?
      assert_equal ["First speeding ticket at can't be changed"],
                   @person.errors.full_messages
    end
    
  end
  
  
  class JoeSchmoeWithStringifiedFirstSpeedingTicketAt < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = people(:joe_schmoe)
      @person.first_speeding_ticket_at = '2005-05-05'
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class New < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = Schmoe.new
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
    def test_should_have_user_defined_after_find_method
      assert_equal false,
                   @person.instance_variable_defined?(:@after_find_counter)
      @person.save!
      @person = Schmoe.find(@person.id)
      assert_equal 1, @person.instance_variable_get(:@after_find_counter)
    end
    
  end
  
  
  class NewWithChangedName < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = Schmoe.new(:name => 'Joe Schmoe')
      @person.name = 'John Doe'
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class NewSavedWithName < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = Schmoe.new(:name => 'Joe Schmoe')
      @person.save!
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
    def test_should_be_valid_when_name_is_changed
      @person.name = 'John'
      assert_valid @person
    end
    
  end
  
  
  class NewWithChangedSocialSecurityNumber < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = Schmoe.new(:social_security_number => '987-65-4321')
      @person.social_security_number = '555-55-5555'
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class NewSavedWithSocialSecurityNumber < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = Schmoe.new(:social_security_number => '987-65-4321')
      @person.save!
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
    def test_should_have_error_on_social_security_number_when_changed
      @person.social_security_number = '000-00-0000'
      @person.valid?
      assert_equal ["Social security number can't be changed"],
                   @person.errors.full_messages
    end
    
  end
  
end
