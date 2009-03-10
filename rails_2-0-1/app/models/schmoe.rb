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

# This is a model whose only constancy validations are inherited from its base
# class.
class Schmoe < Person
end
