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

class Person < ActiveRecord::Base
  
  validates_constancy_of :social_security_number, :first_speeding_ticket_at
  
end
