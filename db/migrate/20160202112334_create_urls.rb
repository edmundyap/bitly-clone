class CreateUrls < ActiveRecord::Migration
	def change
    create_table :urls do |l|
      l.string :long_url
      l.string :short_url
      l.integer :click_count, default: 0
    end
	end
end
