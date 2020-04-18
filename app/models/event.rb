# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :invitations,
                       source: :attendee, dependent: :destroy
  scope :upcomming_events, -> { where('date >= ?', Time.now) }
  scope :past_events, -> { where('date < ?', Time.now) }
end
