describe Dispenser do 
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:messages) }
  it { is_expected.to belong_to(:significant) }
  it { is_expected.to validate_presence_of(:purpose_statement) }
end