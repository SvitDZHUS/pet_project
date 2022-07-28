# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { member: 0, admin: 1 }

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one :cart, inverse_of: :owned_by, foreign_key: 'owned_by_id', dependent: :destroy
  has_one :shelf, inverse_of: :owned_by, foreign_key: 'owned_by_id', dependent: :destroy
  has_one :profile, inverse_of: :owned_by, foreign_key: 'owned_by_id', dependent: :destroy

  after_create :init_cart
  after_create :init_profile
  after_create :init_shelf

  def init_shelf
    self.create_shelf!
  end

  def init_cart
    self.create_cart!
  end

  def init_profile
    self.create_profile!
  end
end
