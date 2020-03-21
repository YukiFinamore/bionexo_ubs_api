class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
    	t.string :name
    	t.string :address
    	t.string :city
    	t.string :phone
    	t.float :geocode_lat
    	t.float :geocode_long
    	t.timestamps
    end
  end
end
