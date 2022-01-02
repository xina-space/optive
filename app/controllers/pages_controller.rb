class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :activities

  def activities
  end
end
