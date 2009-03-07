require File.dirname(__FILE__) + '/../test_helper'


module LicensePlateTest
  
  class MrBigUnprotected < ActiveSupport::TestCase
    
    fixtures :license_plates
    
    def setup
      super
      @license_plate = license_plates(:mr_big)
    end
    
    def test_should_be_valid
      assert_valid @license_plate
    end
    
  end
  
  
  class MrBigProtected < ActiveSupport::TestCase
    
    fixtures :license_plates
    
    def setup
      super
      @license_plate = license_plates(:mr_big)
      @license_plate.protected = true
    end
    
    def test_should_be_valid
      assert_valid @license_plate
    end
    
  end
  
  
  class MrBigUnprotectedWithChangeToExtra < ActiveSupport::TestCase
    
    fixtures :license_plates
    
    def setup
      super
      @license_plate = license_plates(:mr_big)
      @license_plate.extra = 'Extra!'
    end
    
    def test_should_be_valid
      assert_valid @license_plate
    end
    
  end
  
  
  class MrBigProtectedWithChangeToExtra < ActiveSupport::TestCase
    
    fixtures :license_plates
    
    def setup
      super
      @license_plate = license_plates(:mr_big)
      @license_plate.protected = true
      @license_plate.extra = 'Extra!'
    end
    
    def test_should_be_valid
      assert_valid @license_plate
    end
    
  end
  
  
  class MrBigUnprotectedWithChangeToState < ActiveSupport::TestCase
    
    fixtures :license_plates
    
    def setup
      super
      @license_plate = license_plates(:mr_big)
      @license_plate.state = 'Misery'
    end
    
    def test_should_be_valid
      assert_valid @license_plate
    end
    
  end
  
  
  class MrBigProtectedWithChangeToState < ActiveSupport::TestCase
    
    fixtures :license_plates
    
    def setup
      super
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
  
  
  class MrBigUnprotectedWithChangeToNumber < ActiveSupport::TestCase
    
    fixtures :license_plates
    
    def setup
      super
      @license_plate = license_plates(:mr_big)
      @license_plate.number = 'I-AINT-FRAID-OF-NO-GHOST'
    end
    
    def test_should_be_valid
      assert_valid @license_plate
    end
    
  end
  
  
  class MrBigProtectedWithChangeToNumber < ActiveSupport::TestCase
    
    fixtures :license_plates
    
    def setup
      super
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
  
  
  class MrBigUnprotectedWithChangesToNumberAndIssuedOn < ActiveSupport::TestCase
    
    fixtures :license_plates
    
    def setup
      super
      @license_plate = license_plates(:mr_big)
      @license_plate.number    = 'I-AINT-FRAID-OF-NO-GHOST'
      @license_plate.issued_on = 1.year.ago
    end
    
    def test_should_be_valid
      assert_valid @license_plate
    end
    
  end
  
  
  class MrBigProtectedWithChangesToNumberAndIssuedOn < ActiveSupport::TestCase
    
    fixtures :license_plates
    
    def setup
      super
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
  
  
  class MrBigUnprotectedWithChangeToColor < ActiveSupport::TestCase
    
    fixtures :license_plates
    
    def setup
      super
      @license_plate = license_plates(:mr_big)
      Settings.license_plates_protected = false
      @license_plate.color = 'grape'
    end
    
    def test_should_be_valid
      assert_valid @license_plate
    end
    
  end
  
  
  class MrBigProtectedWithChangeToColor < ActiveSupport::TestCase
    
    fixtures :license_plates
    
    def setup
      super
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
