class AddMembershipExpirationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :membership_expiration, :date, default: year_from_now
  end

  def year_from_now
    Date.today.change year: (Date.today.year + 1)
  end
end
