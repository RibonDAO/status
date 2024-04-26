FactoryBot.define do
  factory :incident do
    title { 'Incident title' }
    description { 'Incident description' }
    severity_level { :minor }
    resolved { false }
  end
end
