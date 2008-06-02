migration 2, :posted_files do

  up do
    create_table :posted_files do
      column :id, Integer, :serial => true
      column :post_id, Integer
      column :original_file_name, String, :size => 255
      column :file_type, String, :size => 100
      column :created_at, DateTime
    end
  end

  down do
    drop_table :posted_files
  end

end
