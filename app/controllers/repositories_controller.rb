class RepositoriesController < ApplicationController
  def index
    @remote_repositories = Repository.where(location: "Remote").includes(:product)
    @on_the_way_repositories = Repository.where(location: "On The Way").includes(:product)
    @local_repositories =  Repository.where(location: "Local").includes(:product)
  end

  def new
  end
end
