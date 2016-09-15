require_relative '../crime_scene'

describe CrimeScene do
  context 'movement' do
    it 'moves east' do
      directions = ['right', 'forward']
      crime_scene = described_class.new(directions)
      expect(crime_scene.x).to eq(1)
      expect(crime_scene.y).to eq(0)
    end

    it 'moves west' do
      directions = ['left', 'forward']
      crime_scene = described_class.new(directions)
      expect(crime_scene.x).to eq(-1)
      expect(crime_scene.y).to eq(0)
    end

    it 'moves north' do
      directions = ['forward']
      crime_scene = described_class.new(directions)
      expect(crime_scene.x).to eq(0)
      expect(crime_scene.y).to eq(1)
    end

    it 'moves south' do
      directions = ['right', 'right', 'forward']
      crime_scene = described_class.new(directions)
      expect(crime_scene.x).to eq(0)
      expect(crime_scene.y).to eq(-1)
    end
  end

  it 'finds the way of a random route' do
    directions = ['forward','right','forward','forward','forward','left','forward','forward','left','right','forward','right','forward','forward','right','forward','forward','left']
    crime_scene = described_class.new(directions)
    expect(crime_scene.x).to eq(5)
    expect(crime_scene.y).to eq(2)
  end
end
