class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.create(attendance_params)
  end

  private

  def attendance_params
    params.permit(:attendee_id, :attended_event_id)
  end
end
