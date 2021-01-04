require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    @user = User.create(name: 'Tom')
    @event1 = @user.created_events.create(date: '02.05.2010', title: 'Birthday', description: 'Birthday Party')
    @event2 = @user.created_events.create(date: '10.09.2009', title: 'Jazz Festival',
                                          description: 'Attending Jazz Festival')
    @event_attended = @user.attendances.create(attended_event_id: @event1.id)
  end

  context 'has associations' do
    it 'can be created' do
      expect(Event.first).to eq(@event1)
    end

    it 'can get his creator' do
      expect(@event1.creator).to eq(@user)
    end

    it 'could get all the attendees' do
      expect(@event1.attendees).to eq([@user])
    end
  end
end
