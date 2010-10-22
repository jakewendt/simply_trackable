ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

$LOAD_PATH.unshift File.dirname(__FILE__) # NEEDED for rake test:coverage

class ActiveSupport::TestCase
	self.use_transactional_fixtures = true
	self.use_instantiated_fixtures  = false
	fixtures :all

	def build_track(options = {})
		record = Track.new({
			:name => 'track name',
			:time => Time.now
		}.merge(options))
		record
	end

	def create_track(options={})
		record = build_track(options)
		record.save
		record
	end

	def create_book(options = {})
		record = Book.new({
			:tracking_number => '123'
		}.merge(options))
		record.save
		record
	end

end

class ActionController::TestCase

	setup :turn_https_on

end
