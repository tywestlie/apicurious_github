class Followed
  attr_reader :login, :url

  def initialize(attributes)
    @login = attributes[:login]
    @url = attributes[:html_url]
  end
end
