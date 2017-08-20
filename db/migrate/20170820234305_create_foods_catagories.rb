class CreateFoodsCatagories < ActiveRecord::Migration
  def change
    create_table :foods_catagories do |t|
      t.string :foodcatagory_name

      t.timestamps

    end
  end
end
