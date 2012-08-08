module SqlSeparate
  class Engine < ::Rails::Engine
    initializer "sql_separate.setup_sql_paths" do |app|
      if app.config.paths['app/sql'].present?
        SQL.paths += app.config.paths['app/sql']
      else
        SQL.paths.prepend "#{app.root}/app/sql"
      end
    end
    
  end
end
