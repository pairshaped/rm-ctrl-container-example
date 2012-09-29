class ListController < UIViewController

  CELL_ID = 'QuestionCell'

  def init
    if super
      @questions = [
        Question.new( body: "What does hipster mean to you?",
                      answers: [
                        Answer.new(body: '20 something in skinny jeans.', votes: 0),
                        Answer.new(body: 'Definitions are so mainstream.', votes: 0),
                        Answer.new(body: 'No one says "Hipster" anymore...', votes: 0),
                        Answer.new(body: 'Someone who works at Github.', votes: 0)
                      ] ),
        Question.new( body: 'LOL...',
                      answers: [
                        Answer.new(body: 'Laugh Out Loud', votes: 0),
                        Answer.new(body: 'Cat', votes: 0),
                        Answer.new(body: 'IPOP', votes: 0)
                      ] )
      ]
    end
    self
  end

  layout do
    self.title = 'Questions'

    @list = subview(UITableView,
                    frame: self.view.bounds,
                    delegate: self,
                    dataSource: self)

  end



  # Delegate Methods
  # ****

  def tableView(tableView, numberOfRowsInSection: section)
    @questions.count
  end

  def tableView(tableView, heightForRowAtIndexPath: indexPath)
    50
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    question_controller = QuestionController.alloc.initWithQuestion(@questions[indexPath.row])
    navigationController.pushViewController(question_controller, animated: true)
  end

  def viewDidAppear(animated)
    super
    @list.deselectRowAtIndexPath(@list.indexPathForSelectedRow, animated: false)
  end


  # Datasource Methods
  # ****
  
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = UITableViewCell.alloc.initWithStyle( UITableViewCellStyleDefault, reuseIdentifier: CELL_ID)

    cell.textLabel.text = @questions[indexPath.row].body

    cell
  end

end