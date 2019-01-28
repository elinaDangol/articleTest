class Article < ApplicationRecord

def self.to_csv
		attributes = %w{id title text}
		CSV.generate(headers: true) do |csv|
			csv << attributes
			all.each do |article|
				csv << article.attributes.values_at(*attributes)		
			end	
		end	
	end	
end
