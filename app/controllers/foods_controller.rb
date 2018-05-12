class FoodsController < ApplicationController
  load_and_authorize_resource
  respond_to      :json
  before_action   :before_multi,  only: :index

  def index
    respond_with          @foods
  end

  def show
    respond_with          @food
  end

  private
    def before_multi
      # Handle filtering.
      filters               = JSON.parse params.fetch :filters, '{}'
      # Filter on name?
      if (like = filters.fetch('name', '').gsub('*', '%').downcase.split.join '%').length>0
        if Rails.env=='production'
          @foods              = @foods.where 'CONVERT(name USING utf8) LIKE _utf8 ? COLLATE utf8_general_ci', "%#{ like }%"
        else
          @foods              = @foods.where 'name LIKE ?', "%#{ like }%"
        end
      end

      # Append metadata to response.
      response.headers['queryTotal']      = @foods.count.to_s
      if params.has_key?(:limit) && params.has_key?(:offset)
        response.headers['queryLimit']    = params[:limit].to_s
        response.headers['queryOffset']   = params[:offset].to_s
        @foods                            = @foods.limit(params[:limit].to_i).offset(params[:offset].to_i)
      end
    end
end
