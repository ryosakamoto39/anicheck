class CreateReviewLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :review_likes do |t|
      t.timestamps
    end
  end
end
