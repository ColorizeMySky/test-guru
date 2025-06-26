# frozen_string_literal: true

module TestGuru
  # Класс для хранения и управления версией приложения в формате SemVer (https://semver.org).
  class Version
    MAJOR = 1
    MINOR = 0
    PATCH = 0

    def self.to_s
      "#{MAJOR}.#{MINOR}.#{PATCH}"
    end
  end

  VERSION = Version.to_s.freeze
end
