class Settings
  
  class << self
    
    attr_writer :license_plates_protected
    
    def license_plates_protected?
      @license_plates_protected
    end
    
  end
  
end