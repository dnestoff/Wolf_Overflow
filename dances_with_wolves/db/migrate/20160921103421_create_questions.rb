class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string    :title
      t.string    :text
      t.integer    :poster_id

      t.timestamps(null: false)
    end
  end
end
