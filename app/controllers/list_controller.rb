class ListController < UIViewController

  CELL_ID = 'QuestionCell'

  def init
    if super
      @questions = [
        Question.new( body: "Although there are several interpretations, what is universally accepted to be the Olympic motto?",
                      answers: [
                        Answer.new(body: 'Slower, Lower, Weaker', votes: 0),
                        Answer.new(body: 'Hastier, Further, Longer', votes: 0),
                        Answer.new(body: 'Faster, Further, Braver', votes: 0),
                        Answer.new(body: 'Faster, Higher, Stronger', votes: 0)
                      ] ),
        Question.new( body: 'At which Summer Games was the Olympic flag flown for the first time?',
                      answers: [
                        Answer.new(body: 'Athens 1896', votes: 0),
                        Answer.new(body: 'London 1908', votes: 0),
                        Answer.new(body: 'Antwerp 1920', votes: 0),
                        Answer.new(body: 'Berlin 1936', votes: 0)
                      ] ),
        Question.new( body: 'How far can you see when you are at the top of the London Eye?',
                      answers: [
                        Answer.new(body: '40 km (to Windsor Castle)', votes: 0),
                        Answer.new(body: '15 km (the edge of London)', votes: 0),
                        Answer.new(body: 'In the London fog, about 1m!', votes: 0),
                        Answer.new(body: '100 km (to the White Cliffs of Dover)', votes: 0)
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