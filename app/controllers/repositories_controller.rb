class RepositoriesController < ApplicationController
  def index
    @repositories = Repository.all.includes(:product)
  end

  def new
  end
end
