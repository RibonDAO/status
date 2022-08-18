class Incident < ApplicationRecord
  enum severity_level: { minor: 0, major: 1, critical: 2 }

  validates :title, :description, :severity_level, presence: true
end
