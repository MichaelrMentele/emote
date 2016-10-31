describe Dispenser do 
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:messages) }
  it { is_expected.to belong_to(:significant) }
  it { is_expected.to validate_presence_of(:purpose_statement) }

  describe "#start!" do 
    let!(:alice)      { Fabricate(:user) }
    let!(:zane)       { Fabricate(:significant, phone: "2066184282", user: alice) }
    let!(:sprinkles)  { Fabricate(:sprinkles_messenger) }
    let!(:dispenser) do 
      Fabricate(:dispenser, user: alice, messages: [], dispensable: sprinkles, significant: zane)
    end

    it "with no messages, it does not start" do 
      dispenser.start!
      expect(dispenser.reload.delivery_time).to eq(nil)
    end
  end

  describe "#send_next" do 
    context "has messages" do 
      let!(:m1)         { Fabricate(:message, sent: false) }
      let!(:alice)      { Fabricate(:user) }
      let!(:zane)       { Fabricate(:significant, phone: "2066184282", user: alice) }
      let!(:sprinkles)  { Fabricate(:sprinkles_messenger) }
      let!(:dispenser) do 
        Fabricate(:dispenser, user: alice, messages: [m1], dispensable: sprinkles, significant: zane)
      end

      context "and is overdue" do 
        # TODO: Stub out the deliver sms method

        it "sets sent on the delivered message to true" do 
          dispenser.start!
          dispenser.send_next

          expect(dispenser.reload.messages.first.sent).to eq(true)
        end

        it "sends a message that hasn't been sent before" do 
          dispenser.messages.push(Fabricate(:message, sent: true))
          dispenser.start!
          dispenser.send_next

          expect(dispenser.reload.messages.where(sent: true).count).to eq(2)
        end

        it "sets delivery_time to a DateTime in the future" do 
          dispenser.start!

          dispenser.send_next
          expect(dispenser.reload.delivery_time).to be > DateTime.now
        end
      end

      context "but isn't overdue" do 
        it "does not send a message" do
          dispenser.update(delivery_time: DateTime.now.tomorrow)

          dispenser.send_next
          expect(dispenser.reload.sent_messages.count).to eq(0)
        end
      end
    end

    context "has no messages" do
      let!(:alice)      { Fabricate(:user) }
      let!(:zane)       { Fabricate(:significant, phone: "2066184282", user: alice) }
      let!(:sprinkles)  { Fabricate(:sprinkles_messenger) }
      let!(:dispenser) do 
        Fabricate(:dispenser, user: alice, messages: [], dispensable: sprinkles, significant: zane)
      end

      it "does not send a message" do 
        dispenser.send_next
        expect(dispenser.reload.sent_messages.count).to eq(0)
      end
    end
  end

  describe "#overdue?" do 
    let!(:alice)      { Fabricate(:user) }
    let!(:zane)       { Fabricate(:significant, user: alice) }
    let!(:sprinkles)  { Fabricate(:sprinkles_messenger) }
    let!(:dispenser) do 
      Fabricate(:dispenser, user: alice, dispensable: sprinkles, significant: zane)
    end

    it "returns true if delivery_time is in the past" do 
      dispenser.delivery_time = DateTime.yesterday
      
      expect(dispenser.overdue?).to eq(true)
    end

    it "returns false if delivery_time is in the future" do
      dispenser.delivery_time = DateTime.tomorrow

      expect(dispenser.overdue?).to eq(false)
    end
  end
end