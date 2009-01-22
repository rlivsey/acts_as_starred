
ActiveRecord::Schema.define(:version => 1) do

  create_table :starrings, :force => true do |t|
    	t.column :created_by, :integer
      t.column :created_on, :datetime
      t.column :item_id,    :integer
      t.column :item_type,  :string        
  end
  
  create_table :starred_items, :force => true do |t|
      t.column :name, :string
  end  
  
  create_table :users, :force => true do |t|
      t.column :name, :string
  end  
  
end
