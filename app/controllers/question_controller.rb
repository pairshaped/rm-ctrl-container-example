class QuestionController < UIViewController

  def initWithQuestion(question)
    if init
      @question = question
    end
    self
  end

  layout do
    self.view.backgroundColor = UIColor.grayColor

    subview(UILabel,
      frame: [[20, 10], [280, 40]],
      numberOfLines: 0,
      text: @question.body,
      backgroundColor: UIColor.clearColor)

    @child_container = subview(UIView) do

      @answers_controller = AnswersController.alloc.initWithQuestion(@question)
      addChildViewController(@answers_controller)
      answers_view = subview(@answers_controller.view,
        left: 0, top: 0,
        backgroundColor: UIColor.greenColor)
      answers_view.layoutIfNeeded # Forces layout so we can get an actual height.
      @answers_height = answers_view.frame.size.height

      @results_controller = ResultsController.alloc.init
      addChildViewController(@results_controller)
      results_view = subview(@results_controller.view,
        left: 320, top: 0,
        backgroundColor: UIColor.blueColor)
      results_view.layoutIfNeeded # Forces layout so we can get an actual height.
      #results_view = subview(@results_controller.view)
      #results_view.layoutIfNeeded # Forces layout so we can get an actual height.
      #@results_height = results_view.frame.size.height

    end
    @child_container.frame = [[0, 70], [320, @answers_height]]

  end

  def answerSelected(number)
    p "parent answerSelected: #{number}"
    @results_controller.answer = @question.answers[number]

    width = @child_container.frame.size.width
    height = @child_container.frame.size.height

    self.transitionFromViewController(@answers_controller, 
      toViewController: @results_controller, 
      duration: 0.5, 
      options: UIViewAnimationOptionTransitionNone, 
      animations: lambda {
        @answers_controller.view.frame = CGRectMake(0 - width, 0, width, height);
        @results_controller.view.frame = CGRectMake(0, 0, width, height);
      }, 
      completion:nil)
  end

end