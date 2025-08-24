# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    resource.is_a?(Admin) ? admin_tests_path : super
  end
end
