class CreateProcessors < ActiveRecord::Migration[5.2]
  def change
    create_table :processors do |t|
      t.string :name

      t.timestamps
    end
  end
end
