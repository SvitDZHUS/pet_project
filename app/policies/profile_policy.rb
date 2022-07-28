# frozen_string_literal: true

class ProfilePolicy < ApplicationPolicy
  def update?
    user_is_owner_of_record_or_admin?
  end

  def edit?
    user_is_owner_of_record_or_admin?
  end

  def show?
    user_is_owner_of_record_or_admin?
  end
end
