class ResultsController < UIViewController

  attr_accessor :answer
  
  layout do

    @body = subview(UILabel,
      frame: [[20, 50], [280, 150]],
      numberOfLines: 0,
      backgroundColor: UIColor.clearColor)

  end

  def viewWillAppear(animated)
    p "viewWillAppear"
    @body.text = answer.body if answer
    super
  end

end