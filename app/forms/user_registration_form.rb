class UserRegistrationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :email, :string
  attribute :password, :string
  attribute :password_confirmation, :string

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :email_is_not_taken_by_another

  validates :password, presence: true
  validates :terms_of_service, acceptance: true

  def save
    return false if invalid?
    user.save!
    puts "[ユーザー登録成功]"
    true
  end

  def user
    @user ||= User.new(email: email, password: password)
  end

  private

  def email_is_not_taken_by_another
    errors.add(:email, :taken, value: email) if User.exists?(email: email)
  end
end
