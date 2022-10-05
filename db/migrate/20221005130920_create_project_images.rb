class CreateProjectImages < ActiveRecord::Migration[7.0]
  def change
    create_table :project_images do |t|
      t.belongs_to :project
      t.string :image

      t.timestamps
    end
  end
end
