class Package < ActiveRecord::Base
	attr_accessible :name
	acts_as_trackable
end
