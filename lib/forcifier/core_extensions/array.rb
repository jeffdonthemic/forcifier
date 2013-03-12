class Array
  def enforce(std_fields)
    self.collect { |x| std_fields.include?(x) ? x : "#{x}__c" }
  end

  def deforce
    self.each { |x| x.gsub!(/__c$/, '') }
  end
end
