module Forcifier

	STANDARD_FIELDS = %w(id isdeleted name createddate createdbyid lastmodifieddate lastmodifiedbyid systemmodstamp lastactivitydate)

	class FieldMassager

		#
		# Adds "__c" to all non-standard salesforce.com fields
		# * *Args*    :
		#   - fields -> comma separated list of fields "id,name,wins"
		# * *Returns* :
		#   - comma separated list of fields "id,name,wins__c"
		# * *Raises* :
		#   - ++ ->
		#
		def self.enforce_fields(fields)
			fields.downcase.split(',').enforce(STANDARD_FIELDS).join(',')
		end

		#
		# Removes "__c" from all fields fields
		# * *Args*    :
		#   - fields -> comma separated list of fields "id,name,wins__c"
		# * *Returns* :
		#   - comma separated list of fields "id,name,wins"
		# * *Raises* :
		#   - ++ ->
		#
		def self.deforce_fields(fields)
			fields.downcase.split(',').deforce.join(',')
		end

	end
end
