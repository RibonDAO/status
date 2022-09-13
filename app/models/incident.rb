class Incident < ApplicationRecord
  enum severity_level: { minor: 0, major: 1, critical: 2 }

  validates :title, :description, :severity_level, presence: true

  after_create :send_to_discord

  def send_to_discord
    Discord::Entrypoint.new(title, description).run
  end
end
