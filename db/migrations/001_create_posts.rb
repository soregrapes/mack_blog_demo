migration 1, :create_posts do

  up do
    create_table :posts do
      column :id, "serial PRIMARY KEY"
      column :title, "varchar(50)"
      column :email, "varchar(50)"
      column :body, "text"
      column :created_at, "datetime"
      column :updated_at, "datetime"
    end
  end

  down do
    drop_table :posts
  end

end
