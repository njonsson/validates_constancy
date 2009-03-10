# == Schema Information
# Schema version: 2
#
# Table name: license_plates
#
#  id        :integer(11)   not null, primary key
#  state     :string(255)   
#  number    :string(255)   
#  issued_on :date          
#  color     :string(255)   
#  extra     :string(255)   
#

class LicensePlate < ActiveRecord::Base
  
  validates_constancy_of :state, :if => :protected?
  validates_constancy_of :number, :issued_on,
                         :if => Proc.new { |plate| plate.protected? },
                         :message => 'is off-limits. Are you a crook?'
  validates_constancy_of :color, :if => 'Settings.license_plates_protected?'
  
  attr_writer :protected
  
  def protected?
    @protected
  end
  
end
