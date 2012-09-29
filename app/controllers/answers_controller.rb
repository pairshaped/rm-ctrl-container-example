class AnswersController < UIViewController

  def initWithQuestion(question)
    if init
      @question = question
    end
    self
  end

  layout do
    @question.answers.each_with_index do |answer, idx|
      button = subview(UIButton.buttonWithType(UIButtonTypeRoundedRect),
        frame: [[20, (60 * (idx + 1))], [280, 40]],
        title: answer.body,
        tag: (idx + 1))

      button.addTarget(self, action:'answerSelected:', forControlEvents: UIControlEventTouchUpInside)
    end

  end

  def answerSelected(sender)
    self.parentViewController.answerSelected(sender.tag)
  end

end