require 'rails_helper'

RSpec.describe Incident, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:severity_level) }
  end
end
