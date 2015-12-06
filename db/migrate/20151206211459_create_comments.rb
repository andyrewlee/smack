class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :message, index: true, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
