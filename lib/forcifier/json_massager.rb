module Forcifier
	class JsonMassager

		#
		# Removes "__c" from all non-standard salesforce.com fields
		# * *Args*    :
		#   - json -> The JSON to 'deforce'
		# * *Returns* :
		#   - JSON with '__c' removed from all keys
		# * *Raises* :
		#   - ++ ->
		#
		def self.deforce_json(json)
			ary = []
			if json.is_a?(Array)
				json.each do |record|
					ary << record.deforce_keys!
				end
				ary
			elsif json.is_a?(Hash)
				json.deforce_keys!
			end
		end

		#
		# Adds "__c" to all non-standard salesforce.com fields
		# * *Args*    :
		#   - json -> The JSON to 'enforce'
		# * *Returns* :
		#   - JSON with '__c' added to keys
		# * *Raises* :
		#   - ++ ->
		#
		def self.enforce_json(json)
			ary = []
			if json.is_a?(Array)
				json.each do |record|
					ary << record.enforce_keys!
				end
				ary
			elsif json.is_a?(Hash)
				json.enforce_keys!
			end
		end		
	end
end
