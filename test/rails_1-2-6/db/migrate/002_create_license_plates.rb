class CreateLicensePlates < ActiveRecord::Migration
  def self.up
    create_table :license_plates do |t|
      t.column :state,     :string
      t.column :number,    :string
      t.column :issued_on, :date
      t.column :color,     :string
      t.column :extra,     :string
    end
  end

  def self.down
    drop_table :license_plates
  end
end
