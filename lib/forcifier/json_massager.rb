module Forcifier
	class JsonMassager

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
	end
end
