class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :message
      t.boolean :moderation, default: false

      t.timestamps
    end
  end
end
