class Question

  attr_accessor :body, :answers

  def initialize(attributes = {})
    attributes.each do |key, val|
      self.public_send("#{key}=", val) rescue nil
    end
  end

end