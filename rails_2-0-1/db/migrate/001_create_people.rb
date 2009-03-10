class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string   :type
      t.string   :name
      t.string   :social_security_number
      t.date     :birthdate
      t.date     :became_important_on
      t.datetime :first_speeding_ticket_at
    end
  end

  def self.down
    drop_table :people
  end
end
