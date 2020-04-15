# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id'
  before_save :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  has_secure_password
  validates :username, presence: true, length: { in: 3..12 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  private

  def signed_in
    unless logged_in?
      flash[:danger] = 'Please Sign in.'
      redirect_to login_path
    end
  end

  def downcase_email
    self.email = email.downcase
  end
end
