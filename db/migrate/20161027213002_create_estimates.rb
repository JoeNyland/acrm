class CreateEstimates < ActiveRecord::Migration[5.0]
  def change
    create_table :estimates do |t|
      t.text :body
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
