class Addtimestamps < ActiveRecord::Migration[5.2]
  def change_tabel
    add_timestamps(:users)
    add_timestamps(:bands)
  end
end
