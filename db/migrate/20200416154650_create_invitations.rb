class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :attended_event, foreign_key: true
      t.references :attendee, foreign_key: true

      t.timestamps
    end
  end
end
