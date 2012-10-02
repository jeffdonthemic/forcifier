module Forcifier
  
	class JsonMassager

	  def self.deforce_json(json)
	    ary = []
	    json.each do |record|
	      pretty_hash = {}
	      record.to_hash.each_pair do |k,v|
	        pretty_hash.merge!({k.gsub('__c','').downcase => v}) 
	        if k.include? '__r'
	          pretty_hash.update(k.downcase => deforce_related_json(v))
	        end  
	      end
	      ary << pretty_hash
	    end
	    ary
	  end

	  def self.deforce_related_json(json)
	    pretty_hash = {}
	    json.each do |k,v|
	      pretty_hash.merge!({k.gsub('__c','').downcase => v})     
	      if v.kind_of?(Array)
	        pretty_hash.update(k.downcase => deforce_json(v))
	      end        
	    end
	    pretty_hash
	  end  		

	end

end