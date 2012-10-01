class ResultsController < UIViewController

  attr_accessor :answer
  
  layout do

    @body = subview(UILabel,
      frame: [[50, 50], [200, 50]])

  end

end