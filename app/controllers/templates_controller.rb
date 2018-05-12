class TemplatesController < ApplicationController
  skip_authorization_check
  respond_to              :html

  def serve
    render action: params[:id], layout: false
  end
end
