class CreatePosts < DataMapper::Migration

  def self.up
    create_table :posts do |t|
      t.column :title, :string
      t.column :email, :string
      t.column :body, :text
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
  end

  def self.down
    drop_table :posts
  end

end
