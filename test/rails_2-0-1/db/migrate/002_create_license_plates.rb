class CreateLicensePlates < ActiveRecord::Migration
  def self.up
    create_table :license_plates do |t|
      t.string :state
      t.string :number
      t.date   :issued_on
      t.string :color
      t.string :extra
    end
  end

  def self.down
    drop_table :license_plates
  end
end
