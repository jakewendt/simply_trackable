require 'active_record'

module SimplyTrackable #:nodoc:
	def self.included(base)
		base.extend(ARMethods)
	end

	module ARMethods
		def acts_as_trackable(options = {})
			has_many	:tracks, :as => :trackable, :dependent => :destroy
#			validates_length_of :tracking_number, :minimum => 3
			validates_uniqueness_of :tracking_number,
				:allow_blank => true

			if self.accessible_attributes
				attr_accessible :tracking_number
			end

			include SimplyTrackable::InstanceMethods

			before_validation :nullify_blank_tracking_number

		end
		alias_method :simply_trackable, :acts_as_trackable
	end

	module InstanceMethods
		def nullify_blank_tracking_number
			#	An empty form field is not NULL to MySQL so ...
			self.tracking_number = nil if tracking_number.blank?
		end
	end

end
ActiveRecord::Base.send( :include, SimplyTrackable )
