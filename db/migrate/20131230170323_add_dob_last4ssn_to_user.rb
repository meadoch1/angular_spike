class AddDobLast4ssnToUser < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.date :dob
      t.string :last4ssn
    end
  end
end
