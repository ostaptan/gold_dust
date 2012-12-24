class User < ActiveRecord::Base

  # md5 is needed for pasword generation
  require 'digest/md5'

  include Rules::UserRules

  GENDER_MALE = "m"
  GENDER_FEMALE = "f"
  GENDERS = [GENDER_MALE, GENDER_FEMALE]

  has_secure_password

  attr_accessor :visitor_user

  validates_presence_of :name
  validates_presence_of :mail
  validates_uniqueness_of :name, :case_sensitive => false
  validates_size_of :name, :within => 4..20, :allow_nil => false
  #validates_format_of :name, :with => /^([a-zA-Z0-9]+[a-zA-Z0-9 _\-]+[a-zA-Z0-9]+)/, :allow_nil => true, :if => :validate_format_of_name, :message => :format

  validates_size_of :password_digest, :within => 5..100, :allow_nil => false

  # when we will give user to select gender should uncomment this validator
  # validates_inclusion_of :gender, :in => GENDERS # m - male, f - female

  validates_uniqueness_of :phone

  def active?
    !self.visitor_user && self.active
  end

  def male?
    self.gender == GENDER_MALE
  end

  def female?
    self.gender == GENDER_FEMALE
  end

  def is_me?
    self.id.present? && controller.try(:controller).try(:current_user).try(:id) == self.id
  end

  def is_admin?
    return true if self.is_admin == 1
    false
  end

  def register(attr)

    self.active = true
    self.name = attr[:name]
    self.surname = attr[:surname]
    self.mail = attr[:mail]
    self.gender = attr[:gender]
    self.password_digest = User.encrypt_a_password(attr[:password_digest]) if attr[:password_digest]
    self.save!
  end

  def authenticate(user_mail, user_password)
    encrypted_password = User.encrypt_a_password(user_password)
    r = User.all :conditions => ["mail = ? and password_digest = ?", user_mail, encrypted_password ]

    unless r
      encrypted_password = User.encrypt_a_password(user_password, true)
      r = User.all :conditions => ["mail = ? and password_digest = ?", user_mail, encrypted_password ]
    end

    r
  end

  private

  # private class methods
  def self.encrypt_a_password(password, case_sensitive = false)
    password = password.mb_chars.downcase unless case_sensitive
    Digest::MD5.hexdigest(password)
  end

end