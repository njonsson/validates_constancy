require File.dirname(__FILE__) + '/../test_helper'


module PersonTest
  
  class JohnDoeTest < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = people(:john_doe)
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class JohnDoeWithChangedNameTest < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = people(:john_doe)
      @person.name = 'Jane Doe'
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class JohnDoeWithChangedSocialSecurityNumberTest < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = people(:john_doe)
      @person.social_security_number = '555-55-5555'
    end
    
    def test_should_have_error_on_social_security_number
      @person.valid?
      assert_equal ["Social security number can't be changed"],
                   @person.errors.full_messages
    end
    
  end
  
  
  class JohnDoeWithChangedFirstSpeedTicketAtTest < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = people(:john_doe)
      @person.first_speeding_ticket_at = 2.months.ago
    end
    
    def test_should_have_error_on_first_speeding_ticket_at
      @person.valid?
      assert_equal ["First speeding ticket at can't be changed"],
                   @person.errors.full_messages
    end
    
  end
  
  
  class JohnDoeWithStringifiedFirstSpeedingTicketAtTest < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = people(:john_doe)
      @person.first_speeding_ticket_at = '1999-09-09'
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class NewTest < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = Person.new
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class NewWithChangedNameTest < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = Person.new(:name => 'John Doe')
      @person.name = 'Jane Doe'
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class NewWithChangedSocialSecurityNumberTest < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = Person.new(:social_security_number => '987-65-4321')
      @person.social_security_number = '555-55-5555'
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
end
