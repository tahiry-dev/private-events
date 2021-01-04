module EventsHelper
  def attending_button(event)
    # rubocop:disable Style/GuardClause
    if logged_in?
      if !Attendance.exists?(attendee_id: current_user.id, attended_event_id: event.id)
        render 'button', event: event
      else
        content_tag(:p, '--> Attending')
      end
    end
    # rubocop:enable Style/GuardClause
  end
end
