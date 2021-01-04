module EventsHelper
  def attending_button(event)
    if logged_in?
      if !Attendance.exists?(attendee_id: current_user.id, attended_event_id: event.id)
        render 'button', event: event
      else
        content_tag(:p, '--> Attending')
      end
    end
  end
end

