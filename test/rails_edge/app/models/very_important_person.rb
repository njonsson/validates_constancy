# == Schema Information
# Schema version: 2
#
# Table name: people
#
#  id                       :integer(11)   not null, primary key
#  type                     :string(255)   
#  name                     :string(255)   
#  social_security_number   :string(255)   
#  birthdate                :date          
#  became_important_on      :date          
#  first_speeding_ticket_at :datetime      
#

class VeryImportantPerson < Person
  
  validates_constancy_of :name, :message => 'is engraved on the Walk of Fame'
  validates_constancy_of :became_important_on, :message => 'is set in stone'
  
end
