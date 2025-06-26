# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'rails/welcome#index'

  get 'about', to: 'pages#about'
  get 'about/author', to: 'pages#author'
end
