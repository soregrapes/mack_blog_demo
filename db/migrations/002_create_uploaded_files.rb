class CreateUploadedFiles < DataMapper::Migration

  def self.up
    create_table :uploaded_files do |t|
      t.column :klass_type, :string
      t.column :klass_id, :integer
      t.column :original_file_name, :string
      t.column :file_type, :string
      t.column :created_at, :datetime
    end
  end

  def self.down
    drop_table :uploaded_files
  end

end
