# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  has_secure_password

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, format: { with: /\A[\p{ascii}&&[^\x20]]{8,72}\z/, allow_nil: true }
  # validates :terms_of_service, acceptance: true
  after_create_commit :send_welcome_email

  private

    def send_welcome_email
      Rails.logger "[DONE] メールを送ったぜよ！"
    end
end
