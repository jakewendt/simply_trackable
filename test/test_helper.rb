require 'test/unit'	#	<-- needed but not added by rails generator
require 'rubygems'
require 'active_support'
require 'active_support/test_case'
require 'active_record'
require File.dirname(__FILE__) + '/../init'


ActiveRecord::Base.establish_connection(
	:adapter => "sqlite3", :database => ":memory:")

def setup_db
	ActiveRecord::Schema.define(:version => 1) do
		create_table :tracks do |t|
			t.references :trackable, :polymorphic => true
			t.string :location
			t.string :name
			t.datetime :time
			t.timestamps
		end
		add_index :tracks, [:trackable_id, :trackable_type, :time], 
			:unique => true
		create_table :packages do |t|
			t.string :name
			t.string :tracking_number
		end
		create_table :books do |t|
			t.string :title
			t.string :tracking_number
		end
	end
end

def teardown_db
	ActiveRecord::Base.connection.tables.each do |table|
		ActiveRecord::Base.connection.drop_table(table)
	end
end

class Track < ActiveRecord::Base
end
class Package < ActiveRecord::Base
	attr_accessible :name
	acts_as_trackable
end
class Book < ActiveRecord::Base
	acts_as_trackable
end

class ActiveSupport::TestCase

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
