class Profile
  attr_reader :username,
              :name
  def initialize(profile_data)
    @username = profile_data[:login]
    @name = profile_data[:name]
  end
end
