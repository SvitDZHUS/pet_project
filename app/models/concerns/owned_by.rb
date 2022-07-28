# frozen_string_literal: true

module OwnedBy
  extend ActiveSupport::Concern

  included do
    belongs_to :owned_by, class_name: 'User'
    scope :by_user, ->(user) { where(owned_by: user) }
  end
end
