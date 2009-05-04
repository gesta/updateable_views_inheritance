class ClassTableInheritanceMigrationGenerator < Rails::Generator::NamedBase
  def initialize(runtime_args, runtime_options = {})
    runtime_args << 'add_class_table_inheritance_migration' if runtime_args.empty?
    super
  end

  def manifest
    record do |m|
      m.migration_template 'migration.rb', 'db/migrate'
    end
  end
end