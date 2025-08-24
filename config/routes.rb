# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: {
                       registrations: 'users/registrations'
                     }

  resources :tests do
    resources :questions, only: %i[show], shallow: true

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, only: %i[new create show edit update destroy], shallow: true do
        resources :answers, only: %i[new create edit update destroy], shallow: true
      end
    end
  end
end
