Factory.define :package do |f|
#	f.carrier "FedEx"
	f.sequence(:tracking_number) { |n| "ABC123#{n}" }
end
Factory.define :track do |f|
	f.association :trackable, :factory => :package
	f.name "Name"
	f.time Time.now
end
