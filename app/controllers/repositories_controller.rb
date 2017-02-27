class RepositoriesController < ApplicationController
  def index
    @repositories = Repository.all
  end

  def new
  end
end
