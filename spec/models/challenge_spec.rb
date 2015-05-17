
require 'rails_helper'

RSpec.describe Challenge, type: :model do
  describe '#time_progress' do
    it 'returns 1 if challenge finished' do
      start_date = Time.now - 30.days
      end_date = Time.now - 20.days

      run = Challenge.create(start_date: start_date, end_date: end_date)
      expect(run.time_progress).to eq(1)
    end
    it 'returns 0.5 if time 50% passed' do
      start_date = Time.now - 4.days
      end_date = Time.now + 4.days
      run = Challenge.create(start_date: start_date, end_date: end_date)
      expect(run.time_progress).to eq(0.5)
    end
    it 'returns 0 if challenge not yet started' do
      start_date = Time.now + 10.days
      end_date = Time.now + 30.days
      run = Challenge.create(start_date: start_date, end_date: end_date)
      expect(run.time_progress).to eq(0)
    end
  end

  
end