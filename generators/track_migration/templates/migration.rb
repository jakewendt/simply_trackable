class CreateTracksTable < ActiveRecord::Migration
	def self.up
		create_table :tracks do |t|
			t.references :trackable, :polymorphic => true
			t.string :location
			t.string :name
			t.datetime :time
			t.timestamps
		end
		add_index :tracks, [:trackable_id, :trackable_type, :time], 
			:unique => true
	end

	def self.down
		drop_table :tracks
	end
end
