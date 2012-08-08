module SQL
  
  def self.[] path
    sql = raw_sql(path)
    if sql
      sql.gsub!(/--.*$/, '')  # Remove comments
      sql.gsub!(/\n/, " ")    # Remove newlines
      sql.gsub!(/\s+/, " ")   # Remove multiple consecutive spaces
      sql.strip!              # Remove spaces from beginning and end
      sql = ActiveRecord::Base.send(:sanitize_sql_array, [sql]) if defined? ActiveRecord
    end
    sql
  end
  
  
  def self.raw_sql(path)
    sql = nil
    
    paths.each do |load_path|
      file_path = "#{load_path}/#{path}"
      file_path += ".sql" unless file_path =~ /\.sql\z/
      
      if File.exists? file_path  
        sql = File.open(file_path) {|f| f.read }
        break
      end
    end
    sql
  end
  
  
  def self.paths
    SqlSeparate.paths
  end
  
end