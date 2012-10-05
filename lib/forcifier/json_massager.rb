module Forcifier

	class JsonMassager

	  def self.deforce_json(json)
	    ary = []
	    json.each do |record|
	      ary << record.deforce_keys!
	    end
	    ary
	  end
	end
end
