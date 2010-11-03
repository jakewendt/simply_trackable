class SimplyTrackableGenerator < Rails::Generator::Base

	def manifest
		record do |m|

			File.open('Rakefile','a'){|f| 
				f.puts "#	From `script/generate simply_trackable` ..."
				f.puts "require 'simply_trackable/test_tasks'"
			}

			File.open('.autotest','a'){|f| 
				f.puts "#	From `script/generate simply_trackable` ..."
				f.puts "require 'simply_trackable/autotest'"
			}

			# m.directory "lib"
			# m.template 'README', "README"
#			m.migration_template 'migration.rb', 'db/migrate'
		end
	end

end
