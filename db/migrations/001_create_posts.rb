migration 1, :create_posts do

  up do
    create_table :posts do
      column :id, Serial
      column :title, String
      column :email, String
      column :body, Text
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end

  down do
    drop_table :posts
  end

end
