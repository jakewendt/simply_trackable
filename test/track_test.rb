require File.dirname(__FILE__) + '/test_helper'

class TrackTest < ActiveSupport::TestCase

	def setup
		setup_db
	end

	def teardown
		teardown_db
	end

	test "should create track" do
		book = create_book
		assert_difference 'Track.count' do
			track = build_track
			book.tracks << track
			assert !track.new_record?,
				"#{track.errors.full_messages.to_sentence}"
		end
	end

	test "should require unique time" do
		book = create_book
		book.tracks << create_track
		t = book.tracks.first.time
		assert_no_difference 'Track.count' do
			track = build_track(:time => t)
			book.tracks << track
			assert track.errors.on(:time)
		end
	end

	test "should require trackable" do
		assert_no_difference 'Track.count' do
			track = create_track
			assert track.errors.on(:trackable_id)
			assert track.errors.on(:trackable_type)
		end
	end


end
