class GogsActions

  require "rest-client"

  def initialize repositoryName
    @repository_name = repositoryName
  end

  def add_repository

    @token = RestClient.get "http://localhost:8082/api/v1/users/chet/tokens"

    puts @token
  end


end