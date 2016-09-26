class CreatePrivacies < ActiveRecord::Migration[5.0]
  def change
    create_table :privacies do |t|
    	t.boolean :email_allowed, default: true
      t.boolean :organisation_allowed, default: true
      t.boolean :membership_allowed, default: true
      t.integer :user_id
      
      t.timestamps
    end
  end
end



