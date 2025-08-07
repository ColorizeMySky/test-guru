# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tests do
    resources :questions, only: %i[new create show edit update destroy], shallow: true
  end
end
