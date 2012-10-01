class AnswersController < UIViewController

  def initWithAnswers(answers)
    if init
      @answers = answers
    end
    self
  end

  layout do
    answers_height = 0
    @answers.each_with_index do |answer, idx|
      button = subview(UIButton.buttonWithType(UIButtonTypeRoundedRect),
        left: 20, top: (60 * idx) + 20,
        width: 280, height: 50,
        title: answer.body,
        tag: idx)

      answers_height = button.frame.origin.y + button.frame.size.height

      button.addTarget(self, action:'answerSelected:', forControlEvents: UIControlEventTouchUpInside)
    end

    self.view.frame = [[self.view.frame.origin.x, self.view.frame.origin.y], [self.view.frame.size.width, answers_height + 20]]
  end

  def answerSelected(sender)
    self.performSelector('highlight_button:', withObject: sender, afterDelay: 0.0)
    self.parentViewController.answerSelected(sender.tag)
  end

  def highlight_button(button)
    button.highlighted = true
  end

end