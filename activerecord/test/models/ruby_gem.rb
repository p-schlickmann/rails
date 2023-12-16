# frozen_string_literal: true

class RubyGem < ActiveRecord::Base
  has_many :versions

  def reorder_versions
    logger.info Version.all.to_sql

    versions_of_platforms = versions
                              .group_by(&:platform)

    versions_of_platforms.each_value do |platforms|
      Version.find(platforms.max.id).update_column(:latest, true)
    end
  end
end
