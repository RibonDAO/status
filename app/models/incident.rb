class Incident < ApplicationRecord
  enum severity_level: [:minor, :major, :critical]

  validates :title, :description, :severity_level, :status, presence: true
end
