# frozen_string_literal: true

class Version < ActiveRecord::Base
  belongs_to :ruby_gem
  belongs_to :api_key

  after_save :reorder_versions, if: -> { saved_change_to_id? }
  delegate :reorder_versions, to: :ruby_gem
end
