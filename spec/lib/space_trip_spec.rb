require_relative '../spec_helper'

RSpec.shared_examples 'fuel calculations' do
  it 'returns required fuel amount' do
    expect(subject.fuel_required).to eq(expected_result)
  end
end

RSpec.describe SpaceTrip do
  subject { described_class.new(ship_mass, route_data) }

  describe 'Apollo 11 trip' do
    let(:ship_mass) { 28801 }
    let(:route_data) { [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]] }
    let(:expected_result) { 49479 }

    include_examples 'fuel calculations'
  end

  describe 'Mission on Mars' do
    let(:ship_mass) { 14606 }
    let(:route_data) { [[:launch, 9.807], [:land, 3.711], [:launch, 3.711], [:land, 9.807]] }
    let(:expected_result) { 31124 }

    include_examples 'fuel calculations'
  end

  describe 'Apollo 11 trip' do
    let(:ship_mass) { 75432 }
    let(:route_data) { [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 3.711], [:launch, 3.711], [:land, 9.807]] }
    let(:expected_result) { 204898 }

    include_examples 'fuel calculations'
  end
end

