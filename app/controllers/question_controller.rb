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
      frame: [[20, 10], [280, 80]],
      numberOfLines: 0,
      text: @question.body,
      backgroundColor: UIColor.clearColor)

    @container = subview(UIScrollView,
      left: 0, top: 90,
      width: 320, height: 326) do

      @answers_controller = AnswersController.alloc.initWithAnswers(@question.answers)
      addChildViewController(@answers_controller)
      answers_view = subview(@answers_controller.view,
        left: 0, top: 0,
        backgroundColor: UIColor.greenColor)
      answers_view.layoutIfNeeded # Forces layout so we can get an actual height.

      # Enforce the minimum height of the container.
      if answers_view.frame.size.height < 326
        answers_view.frame = [[answers_view.frame.origin.x, answers_view.frame.origin.y], [answers_view.frame.size.width, 326]]
      end
      @answers_height = answers_view.frame.size.height

      @results_controller = ResultsController.alloc.init
      addChildViewController(@results_controller)
      results_view = subview(@results_controller.view,
        left: 320, top: 0,
        backgroundColor: UIColor.blueColor)
      results_view.layoutIfNeeded
      # It's OK to go bigger on the transition, but going smaller just looks wierd.
      if @answers_height > results_view.frame.size.height
        results_view.frame = [[results_view.frame.origin.x, results_view.frame.origin.y], [results_view.frame.size.width, @answers_height]]
      end
      @results_height = results_view.frame.size.height
    end
    @container.contentSize = [320, @answers_height]
  end

  def answerSelected(number)
    @results_controller.answer = @question.answers[number]

    width = 320
    height = @results_height
    @container.contentSize = [width, height]
    
    self.transitionFromViewController(@answers_controller, 
      toViewController: @results_controller, 
      duration: 0.5, 
      options: UIViewAnimationOptionTransitionNone, 
      animations: lambda {
        # @answers_controller.view.frame = CGRectMake(0 - width, 0, width, height);
        @results_controller.view.frame = CGRectMake(0, 0, width, height);
      }, 
      completion:nil)
  end

end