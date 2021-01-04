require 'rails_helper'

RSpec.describe Attendance, type: :model do
    before(:each) do
        @user = User.create(name: 'Angelina')
        @event = @user.created_events.create(title:'Title test',  date: '1.10.2021', description: 'description test')
        @first_attendant = @user.attendances.create(attended_event_id: @event.id)
        @second_attendant = @event.attendances.create(attendee_id: @user.id)
      end
    
      it 'Can be created by the user' do
        expect(Attendance.first).to eq(@first_attendant)
      end
    
      it 'Can be created by the event' do
        expect(Attendance.second).to eq(@second_attendant)
      end
end
