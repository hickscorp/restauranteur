class StaticPagesController < ApplicationController
  skip_authorization_check
  def index
    render html: '', layout: true
  end
end
