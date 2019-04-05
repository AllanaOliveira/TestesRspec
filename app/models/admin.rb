class Admin < ApplicationRecord
  #before_validation :downcase_email
  EMAIL_REGEX = /\A[a-zA-Z0-9]+@id.uff.br\z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validates :password, presence: true, length: { minimum: 8 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: {with: EMAIL_REGEX}
  #Kaminari
  paginates_per 5

  private

  #def downcase_email
   # self.email = email.downcase if email.present?
  #end
end
