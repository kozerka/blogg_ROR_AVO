class CreateJoinTableFaqPost < ActiveRecord::Migration[7.1]
  def change
    create_join_table :faqs, :posts do |t|
      # t.index [:faq_id, :post_id]
      # t.index [:post_id, :faq_id]
    end
  end
end
