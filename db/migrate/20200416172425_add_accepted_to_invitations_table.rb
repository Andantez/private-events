class AddAcceptedToInvitationsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :invitations, :accepted, :boolean
  end
end
