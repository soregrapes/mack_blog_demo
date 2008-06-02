migration 1, :create_posts do

  up do
    create_table :posts do
      column :id, Integer, :serial => true
      column :title, String
      column :email, String
      column :body, DataMapper::Types::Text
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end

  down do
    drop_table :posts
  end

end
