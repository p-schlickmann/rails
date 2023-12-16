# frozen_string_literal: true

class ApiKey < ActiveRecord::Base
  has_many :versions
end
