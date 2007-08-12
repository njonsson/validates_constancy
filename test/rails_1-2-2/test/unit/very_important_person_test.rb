require File.dirname(__FILE__) + '/../test_helper'


module VeryImportantPersonTest
  
  class MidoriTest < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = people(:midori)
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class MidoriWithChangedNameTest < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = people(:midori)
      @person.name = 'Midori the Great'
    end
    
    def test_should_have_error_on_name
      @person.valid?
      assert_equal ['Name is engraved on the Walk of Fame'],
                   @person.errors.full_messages
    end
    
  end
  
  
  class MidoriWithChangedBecameImportantOnTest < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = people(:midori)
      @person.became_important_on = Time.now
    end
    
    def test_should_have_error_on_became_important_on
      @person.valid?
      assert_equal ['Became important on is set in stone'],
                   @person.errors.full_messages
    end
    
  end
  
  
  class MidoriWithStringifiedBecameImportantOnTest < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = people(:midori)
      @person.became_important_on = '1982-12-31'
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class MidoriWithChangedNameAndBecameImportantOnTest < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
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
  
  
  class NewTest < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = VeryImportantPerson.new
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class NewWithChangedNameTest < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = VeryImportantPerson.new(:name => 'Midori (Goto)')
      @person.name = 'Midori the Great'
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class NewWithChangedBecameImportantOnTest < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
      @person = VeryImportantPerson.new(:became_important_on => '1982-12-31')
      @person.became_important_on = Time.now
    end
    
    def test_should_be_valid
      assert_valid @person
    end
    
  end
  
  
  class NewWithChangedNameAndBecameImportantOnTest < Test::Unit::TestCase
    
    fixtures :people
    
    def setup
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
