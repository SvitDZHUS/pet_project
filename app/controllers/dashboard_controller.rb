# frozen_string_literal: true

class DashboardController < ApplicationController
  layout 'application'

  before_action :authenticate_user!

  include Pundit

  rescue_from Pundit::NotAuthorizedError do
    redirect_to current_user ? authenticated_root_path : unauthenticated_root_path, notice: t('global.access')
  end
end
