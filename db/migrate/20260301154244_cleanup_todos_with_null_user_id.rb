class CleanupTodosWithNullUserId < ActiveRecord::Migration[8.1]
  def up
    execute "DELETE FROM todos WHERE user_id IS NULL"
  end

  def down
    # irreversible — deleted data can't be restored
    raise ActiveRecord::IrreversibleMigration
  end
end
