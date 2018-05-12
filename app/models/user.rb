class User < ActiveRecord::Base
  # Password management stuff.
  has_secure_password

  has_many    :diets,   dependent:  :destroy
  has_many    :courses, through:    :diets

  has_many    :meals,   dependent:  :destroy
  has_many    :plates,  through:    :meals

  # Roles definition.
  ROLES = %w[ administrator dietitian chef ]

  # User's roles getter / setter.
  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r.to_s)).zero?
    end
  end
  def roles= (rs)
    self.roles_mask = (rs.map{ |r| r.to_s } & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end
  # User's roles tester.
  def is? (r)
    roles.include? r.to_s
  end

  # eMail validation.
  VALID_EMAIL_REGEX     = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates             :email,
                          uniqueness:     { case_sensitive: false },
                          format:         { with: VALID_EMAIL_REGEX, message: 'must be a valid email address' }
  # Password validation.
  VALID_PASSWORD_REGEX  = /\A(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){5,40}\z/
  validates             :password,
                          format: {
                            on:           :create,
                            with:         VALID_PASSWORD_REGEX,
                            message:      'must contain at least 5 characters including one lowercase letter and one uppercase letter as well as a digit'
                          }
  validates             :password_confirmation,
                          on:             :create,
                          presence:       true

  before_create         { generate_token_in :remember_token }
  before_save           {
    self.email.downcase!
    self.first_name.capitalize!
    self.last_name.upcase
  }

  def full_name
    "#{last_name} #{first_name}"
  end

  def is_confirmed?
    created_at!=password_reset_sent_at
  end
  def send_password_reset
    generate_token_in :password_reset_token
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
  def send_account_creation
    generate_token_in :password_reset_token
    self.password_reset_sent_at = created_at
    save!
    UserMailer.account_creation(self).deliver
  end

  private
    def generate_token_in col
      begin
        self[col] = SecureRandom.urlsafe_base64
      end while User.exists? col => self[col]
    end
end
