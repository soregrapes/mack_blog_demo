migration 2, :posted_files do

  up do
    create_table :posted_files do
      column :id, "serial PRIMARY KEY"
      column :post_id, "integer"
      column :original_file_name, "varchar(50)"
      column :file_type, "varchar(50)"
      column :created_at, "datetime"
    end
  end

  down do
    drop_table :posted_files
  end

end
