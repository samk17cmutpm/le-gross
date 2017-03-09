class RepositoriesController < ApplicationController
  def index
    @remote_repositories = Repository.where(location: "Remote").includes(:product)
    @on_the_way_repositories = Repository.where(location: "On The Way").where("quantity > ?", 0 ).includes(:product)
    @local_repositories =  Repository.where(location: "Local").where("quantity > ?", 0 ).includes(:product)
  end

  def new
  end
end
