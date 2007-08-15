require File.dirname(__FILE__) + '/../test_helper'


module LicensePlateTest
  
  class MrBigUnprotected < Test::Unit::TestCase
    
    fixtures :license_plates
    
    def setup
      @license_plate = license_plates(:mr_big)
    end
    
    def test_should_be_valid
      assert_valid @license_plate
    end
    
  end
  
  
  class MrBigProtected < Test::Unit::TestCase
    
    fixtures :license_plates
    
    def setup
      @license_plate = license_plates(:mr_big)
      @license_plate.protected = true
    end
    
    def test_should_be_valid
      assert_valid @license_plate
    end
    
  end
  
  
  class MrBigUnprotectedWithChangeToExtra < Test::Unit::TestCase
    
    fixtures :license_plates
    
    def setup
      @license_plate = license_plates(:mr_big)
      @license_plate.extra = 'Extra!'
    end
    
    def test_should_be_valid
      assert_valid @license_plate
    end
    
  end
  
  
  class MrBigProtectedWithChangeToExtra < Test::Unit::TestCase
    
    fixtures :license_plates
    
    def setup
      @license_plate = license_plates(:mr_big)
      @license_plate.protected = true
      @license_plate.extra = 'Extra!'
    end
    
    def test_should_be_valid
      assert_valid @license_plate
    end
    
  end
  
  
  class MrBigUnprotectedWithChangeToState < Test::Unit::TestCase
    
    fixtures :license_plates
    
    def setup
      @license_plate = license_plates(:mr_big)
      @license_plate.state = 'Misery'
    end
    
    def test_should_be_valid
      assert_valid @license_plate
    end
    
  end
  
  
  class MrBigProtectedWithChangeToState < Test::Unit::TestCase
    
    fixtures :license_plates
    
    def setup
      @license_plate = license_plates(:mr_big)
      @license_plate.protected = true
      @license_plate.state     = 'Misery'
    end
    
    def test_should_have_error_on_state
      @license_plate.valid?
      assert_equal ["State can't be changed"],
                   @license_plate.errors.full_messages
    end
    
  end
  
  
  class MrBigUnprotectedWithChangeToNumber < Test::Unit::TestCase
    
    fixtures :license_plates
    
    def setup
      @license_plate = license_plates(:mr_big)
      @license_plate.number = 'I-AINT-FRAID-OF-NO-GHOST'
    end
    
    def test_should_be_valid
      assert_valid @license_plate
    end
    
  end
  
  
  class MrBigProtectedWithChangeToNumber < Test::Unit::TestCase
    
    fixtures :license_plates
    
    def setup
      @license_plate = license_plates(:mr_big)
      @license_plate.protected = true
      @license_plate.number    = 'I-AINT-FRAID-OF-NO-GHOST'
    end
    
    def test_should_have_error_on_number
      @license_plate.valid?
      assert_equal ['Number is off-limits. Are you a crook?'],
                   @license_plate.errors.full_messages
    end
    
  end
  
  
  class MrBigUnprotectedWithChangesToNumberAndIssuedOn < Test::Unit::TestCase
    
    fixtures :license_plates
    
    def setup
      @license_plate = license_plates(:mr_big)
      @license_plate.number    = 'I-AINT-FRAID-OF-NO-GHOST'
      @license_plate.issued_on = 1.year.ago
    end
    
    def test_should_be_valid
      assert_valid @license_plate
    end
    
  end
  
  
  class MrBigProtectedWithChangesToNumberAndIssuedOn < Test::Unit::TestCase
    
    fixtures :license_plates
    
    def setup
      @license_plate = license_plates(:mr_big)
      @license_plate.protected = true
      @license_plate.number    = 'I-AINT-FRAID-OF-NO-GHOST'
      @license_plate.issued_on = 1.year.ago
    end
    
    def test_should_have_errors_on_number_and_issued_on
      @license_plate.valid?
      assert_equal ['Number is off-limits. Are you a crook?',
                    'Issued on is off-limits. Are you a crook?'],
                   @license_plate.errors.full_messages
    end
    
  end
  
  
  class MrBigUnprotectedWithChangeToColor < Test::Unit::TestCase
    
    fixtures :license_plates
    
    def setup
      @license_plate = license_plates(:mr_big)
      Settings.license_plates_protected = false
      @license_plate.color = 'grape'
    end
    
    def test_should_be_valid
      assert_valid @license_plate
    end
    
  end
  
  
  class MrBigProtectedWithChangeToColor < Test::Unit::TestCase
    
    fixtures :license_plates
    
    def setup
      @license_plate = license_plates(:mr_big)
      Settings.license_plates_protected = true
      @license_plate.color = 'aubergine'
    end
    
    def test_should_have_error_on_color
      @license_plate.valid?
      assert_equal ["Color can't be changed"],
                   @license_plate.errors.full_messages
    end
    
  end
  
end
