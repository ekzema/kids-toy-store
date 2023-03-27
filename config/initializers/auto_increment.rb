module AutoIncrement
  def auto_increment_value
    connection.query('SET @@SESSION.information_schema_stats_expiry = 0')
    connection.select_value(<<-SQL.squish)
      SELECT `AUTO_INCREMENT`
        FROM `INFORMATION_SCHEMA`.`TABLES`
       WHERE `TABLE_SCHEMA` = '#{connection.current_database}'
         AND `TABLE_NAME` = '#{table_name}'
    SQL
  end
end

ActiveRecord::Base.extend(AutoIncrement)
