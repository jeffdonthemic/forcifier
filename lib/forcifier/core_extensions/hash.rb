class Hash
  def enforce_keys!(std_fields)
    keys.each do |key|
      self[("#{key}__c" rescue key) || key] = delete(key) unless std_fields.include?(key)
    end
    self
  end

  def deforce_keys!
    keys.each do |key|
      self[(key.downcase.gsub('__c','') rescue key) || key] = delete(key)
      if self[key].is_a?(Hash) then self[key].deforce_keys! end
      if self[key].is_a?(Array)
        self[key].each { |record| record.deforce_keys! if record.is_a?(Hash) }
      end
    end
    self
  end
end
