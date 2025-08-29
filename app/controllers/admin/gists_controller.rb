class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.includes(:question, :user).all
  end
end
