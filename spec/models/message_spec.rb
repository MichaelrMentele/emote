describe Message do 
  it { should validate_presence_of(:message) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:dispenser) }
end