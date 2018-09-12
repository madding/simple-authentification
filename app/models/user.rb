class User < ApplicationRecord
  include Paginable

  attr_accessor :password

  validates :email, :password, presence: true

  before_create :set_crypted_password

  scope :filter_by_email, ->(email) { where('email like ?', "%#{email}%") }

  def check_password(password)
    crypted_password == Digest::SHA2.hexdigest(password)
  end

  private

  def set_crypted_password
    # TODO: in next version add salt
    assign_attributes(crypted_password: Digest::SHA2.hexdigest(password))
  end
end
