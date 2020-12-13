class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :AB
      t.integer :single
      t.integer :double
      t.integer :triple
      t.integer :HR
      t.integer :RBI
      t.integer :run
      t.integer :BB_HBP
      t.integer :steal
      t.decimal :inning
      t.integer :hit_allowed
      t.integer :run_allowed
      t.integer :SO
      t.integer :BB_HBP_allowed
      t.text :body
      t.string :post_image_id
      t.string :youtube_url
      t.string :team_against
      t.integer :score_my_team
      t.integer :score_team_against
      t.datetime :date
      t.string :win_lose
      t.boolean :status

      t.timestamps
    end
  end
end
