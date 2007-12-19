class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.column :type,                     :string
      t.column :name,                     :string
      t.column :social_security_number,   :string
      t.column :birthdate,                :date
      t.column :became_important_on,      :date
      t.column :first_speeding_ticket_at, :datetime
    end
  end

  def self.down
    drop_table :people
  end
end
