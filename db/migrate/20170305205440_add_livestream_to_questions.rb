class AddLivestreamToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :livestream, foreign_key: true
  end
end
