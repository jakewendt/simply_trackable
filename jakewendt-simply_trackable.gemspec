# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jakewendt-simply_trackable}
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["George 'Jake' Wendt"]
  s.date = %q{2011-02-14}
  s.description = %q{longer description of your gem}
  s.email = %q{github@jake.otherinbox.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "app/models/track.rb",
    "config/routes.rb",
    "generators/simply_trackable/USAGE",
    "generators/simply_trackable/simply_trackable_generator.rb",
    "generators/simply_trackable/templates/autotest_simply_trackable.rb",
    "generators/simply_trackable/templates/migration.rb",
    "generators/simply_trackable/templates/simply_trackable.rake",
    "generators/track_migration/USAGE",
    "generators/track_migration/templates/migration.rb",
    "generators/track_migration/track_migration_generator.rb",
    "generators/trackable_migration/USAGE",
    "generators/trackable_migration/templates/migration.rb",
    "generators/trackable_migration/trackable_migration_generator.rb",
    "lib/jakewendt-simply_trackable.rb",
    "lib/simply_trackable.rb",
    "lib/simply_trackable/autotest.rb",
    "lib/simply_trackable/factories.rb",
    "lib/simply_trackable/simply_trackable.rb",
    "lib/simply_trackable/tasks.rb",
    "lib/simply_trackable/test_tasks.rb",
    "lib/tasks/simply_trackable_tasks.rake"
  ]
  s.homepage = %q{http://github.com/jakewendt/simply_trackable}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{one-line summary of your gem}
  s.test_files = [
    "test/app/controllers/application_controller.rb",
    "test/app/controllers/home_controller.rb",
    "test/app/models/book.rb",
    "test/app/models/package.rb",
    "test/config/routes.rb",
    "test/unit/acts_as_trackable_test.rb",
    "test/unit/trackable/track_test.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 2"])
      s.add_runtime_dependency(%q<jakewendt-simply_helpful>, [">= 0"])
      s.add_runtime_dependency(%q<jakewendt-ruby_extension>, [">= 0"])
      s.add_runtime_dependency(%q<jakewendt-rails_extension>, [">= 0"])
      s.add_runtime_dependency(%q<ryanb-acts-as-list>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 2"])
      s.add_dependency(%q<jakewendt-simply_helpful>, [">= 0"])
      s.add_dependency(%q<jakewendt-ruby_extension>, [">= 0"])
      s.add_dependency(%q<jakewendt-rails_extension>, [">= 0"])
      s.add_dependency(%q<ryanb-acts-as-list>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 2"])
    s.add_dependency(%q<jakewendt-simply_helpful>, [">= 0"])
    s.add_dependency(%q<jakewendt-ruby_extension>, [">= 0"])
    s.add_dependency(%q<jakewendt-rails_extension>, [">= 0"])
    s.add_dependency(%q<ryanb-acts-as-list>, [">= 0"])
  end
end

