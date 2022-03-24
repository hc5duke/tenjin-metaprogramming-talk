# frozen_string_literal: true

require './ex2/ex2'

SAMPLE_CITY_NAMES = %w[seoul charlotte sf la chicago pittsburgh buenos\ aires toronto]

describe Ex2::City do
  let!(:cities) do
    SAMPLE_CITY_NAMES.count.times.map do |i|
      Ex2::City.new(place_name: SAMPLE_CITY_NAMES[i], population: i * 100)
    end
  end

  describe '.find_by_place_name' do
    it 'finds' do
      city = Ex2::City.find_by_place_name('seoul')
      expect(city.place_name).to eq('seoul')
    end
  end
end