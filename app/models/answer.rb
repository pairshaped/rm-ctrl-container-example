class Answer

  attr_accessor :body, :votes

  def initialize(attributes = {})
    attributes.each do |key, val|
      self.public_send("#{key}=", val) rescue nil
    end
  end

end