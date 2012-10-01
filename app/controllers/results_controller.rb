class ResultsController < UIViewController

  attr_accessor :answer
  
  layout do

    @body = subview(UILabel,
      frame: [[20, 50], [280, 100]],
      numberOfLines: 0,
      backgroundColor: UIColor.clearColor)

    self.view.frame = [[self.view.frame.origin.x, self.view.frame.origin.y], [self.view.frame.size.width, @body.frame.origin.y + @body.frame.size.height + 20]]

  end

  def viewWillAppear(animated)
    @body.text = answer.body if answer
    super
  end

end