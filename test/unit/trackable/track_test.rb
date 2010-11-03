#require File.dirname(__FILE__) + '/../test_helper'
require 'test_helper'

class SimplyTrackable::TrackTest < ActiveSupport::TestCase

#	assert_should_create_default_object
	assert_should_initially_belong_to(:trackable,
		:model => "Track")
	assert_should_require_attributes(:trackable_id,:name,:time,
		:model => "Track")
	assert_should_require_unique_attributes(:time, 
		:scope => [:trackable_id, :trackable_type],
		:model => "Track")
	assert_should_not_require_attributes(
		:trackable_type,
		:location,
		:city,
		:state,
		:zip ,
		:model => "Track")
	assert_should_require_attribute_length(
		:name, :location, :city, :state, :zip,
		:maximum => 250,
		:model => "Track" )

	test "should create track" do
		assert_difference 'Track.count' do
			track = Factory(:track)
			assert !track.new_record?,
				"#{track.errors.full_messages.to_sentence}"
		end
	end

	test "should require trackable" do
		assert_no_difference 'Track.count' do
			track = create_track(:trackable => nil)
			assert track.errors.on(:trackable_id)
			assert track.errors.on(:trackable_type)
		end
	end

	test "should require trackable_type" do
		assert_no_difference 'Track.count' do
			track = create_track(:trackable_id => 1)
			assert_nil track.trackable_type
			assert track.errors.on(:trackable_type)
		end
	end

	test "should copy city and state to location if no location" do
		track = create_track({
			:city     => "Berkeley",
			:state    => "CA"
		})
		assert_equal track.reload.trackable.tracks.first.location, "Berkeley, CA"
	end

	test "should NOT copy city and state to location if location given" do
		track = create_track({
			:location => "my location",
			:city     => "Berkeley",
			:state    => "CA"
		})
		assert_equal track.reload.trackable.tracks.first.location, "my location"
	end

	test "should combine city and state into location" do
		track = create_track( :city => "Berkeley", :state => "CA")
		assert_equal track.location, "Berkeley, CA"
	end

	test "should use just city in location if that's all that's given" do
		track = create_track(:city => "Berkeley")
		assert_equal track.location, "Berkeley"
	end

	test "should use just state in location if that's all that's given" do
		track = create_track(:state => "CA")
		assert_equal track.location, "CA"
	end

	test "should use None as location when no location, city or state given" do
		track = create_track
		assert_equal track.location, "None"
	end

protected

	def create_track(options = {})
		record = Factory.build(:track,options)
		record.save
		record
	end
	alias_method :create_object, :create_track

end
