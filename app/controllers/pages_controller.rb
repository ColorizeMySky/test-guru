# frozen_string_literal: true

# Контроллер для статических страниц приложения
class PagesController < ApplicationController
  def about
    @version = TestGuru::VERSION
  end

  def author
    @github_profile = 'https://github.com/ColorizeMySky'
  end
end
