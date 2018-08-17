class ApplicationController < ActionController::Base
	before_action :set_language

	private

	def set_language
	  cookies[:lang] = params[:lang] unless params[:lang].blank?
	  locale = cookies[:lang] || I18n.default_locale
	  I18n.locale = locale if locale && I18n.available_locales.include?(locale.to_sym)

	end
end
