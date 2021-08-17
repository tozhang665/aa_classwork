# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates_presence_of :session_token
  validates_uniqueness_of :session_token

  validates :password, length: {minimum: 6}, allow_nil: true

  attr_reader :password

  after_initialize :ensure_token_presence


  has_many :cats,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Cat

    has_many :requests,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :CatRentalRequest

  #SPIRE
  #S
  def self.find_by_credentials(user_name,password)
    user = User.find_by(user_name: user_name)
    if user && user.is_password?(password)
      user
    else
      return nil
    end
  end

#P
   def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end
    
    #I

  def is_password?(password)
    password_object = BCrypt::Password.new(self.password_digest)
    password_object.is_password?(password)
  end

#R
  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token

  end
#E
  def ensure_token_presence
    self.session_token ||= SecureRandom::urlsafe_base64
  end



end
