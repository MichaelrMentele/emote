describe Significant do 
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:phone) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:dispensers) }
end