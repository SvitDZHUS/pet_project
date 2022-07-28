# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout 'public'

  before_action :set_locale

  private

  def set_locale
    locale_in_cookies = I18n.available_locales.map(&:to_s).include?(cookies[:locale])
    I18n.locale = locale_in_cookies ? cookies[:locale] : I18n.default_locale
  end
end
