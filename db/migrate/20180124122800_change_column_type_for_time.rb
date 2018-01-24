class ChangeColumnTypeForTime < ActiveRecord::Migration[5.0]
  def change
  	change_column :places, :time, 'integer USING CAST(time AS integer)'
  end
end
