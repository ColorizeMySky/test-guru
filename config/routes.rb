# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tests do
    resources :questions, only: %i[new create show edit update destroy], shallow: true

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
