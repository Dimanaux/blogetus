class User < ApplicationRecord
  devise :confirmable,
    :database_authenticatable,
    :lockable,
    # :omniauthable,
    :recoverable,
    :registerable,
    :rememberable,
    :timeoutable,
    :trackable,
    :validatable

  has_many :stories, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :likes, dependent: :destroy
end
