class SimplyTrackableGenerator < Rails::Generator::Base

	def manifest
		record do |m|
			m.directory('config/autotest')
			m.file('autotest_simply_trackable.rb', 'config/autotest/simply_trackable.rb')
			m.directory('lib/tasks')
			m.file('simply_trackable.rake', 'lib/tasks/simply_trackable.rake')

#			File.open('Rakefile','a'){|f| 
#				f.puts "#	From `script/generate simply_trackable` ..."
#				f.puts "require 'simply_trackable/test_tasks'"
#			}
#
#			File.open('.autotest','a'){|f| 
#				f.puts "#	From `script/generate simply_trackable` ..."
#				f.puts "require 'simply_trackable/autotest'"
#			}

			# m.directory "lib"
			# m.template 'README', "README"
#			m.migration_template 'migration.rb', 'db/migrate'
		end
	end

end
