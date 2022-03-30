require "rails_helper"

RSpec.describe LearningHour, type: :model do
  it "has a title" do
    learning_hour = build_stubbed(:learning_hour, name: nil)
    expect(learning_hour).to_not be_valid
    expect(learning_hour.errors[:name]).to eq(["/ Title cannot be blank"])
  end
  
  it "has a learning_type" do
    learning_hour = build_stubbed(:learning_hour, learning_type: nil)
    expect(learning_hour).to_not be_valid
    expect(learning_hour.errors[:learning_type]).to eq(["can't be blank"])
  end

  it "has a duration in minutes that is greater than 0" do
    learning_hour = build_stubbed(:learning_hour, duration_minutes: 0)
    expect(learning_hour).to_not be_valid
    expect(learning_hour.errors[:duration_minutes]).to eq(["must be greater than 0"])
  end

  it "has an occurred_at date" do
    learning_hour = build_stubbed(:learning_hour, occurred_at: nil)
    expect(learning_hour).to_not be_valid
    expect(learning_hour.errors[:occurred_at]).to eq(["can't be blank"])
  end

  it "has date that is not in the future" do
    learning_hour = build_stubbed(:learning_hour, occurred_at: 1.day.from_now.strftime('%d %b %Y'))
    expect(learning_hour).to_not be_valid
  end

  
end
