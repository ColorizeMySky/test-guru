# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_tests_path
    else
      flash[:notice] = "Привет, #{[resource.first_name, resource.last_name].compact.join(' ')}!" if resource.first_name || resource.last_name
      super
    end
  end
end
