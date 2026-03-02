class CleanupTodosWithNullUserId < ActiveRecord::Migration[8.1]
  class MigrationTodo < ActiveRecord::Base
    self.table_name = "todos"
  end
  def up
    MigrationTodo.unscoped.where(user_id: nil).in_batches(of: 1_000) do |batch|
      batch.delete_all
    end
  end

  def down
    # irreversible — deleted data can't be restored
    raise ActiveRecord::IrreversibleMigration
  end
end
