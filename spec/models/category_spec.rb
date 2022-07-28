# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:category_name) }
    it { is_expected.to validate_length_of(:category_name).is_at_least(3).is_at_most(255) }
  end
end
