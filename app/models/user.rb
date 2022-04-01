# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  before_create :default_avatar
  has_one_attached :avatar
  include ReadCache

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def cart_count
    ReadCache.redis.scard "cart#{id}"
  end

  def cart_items
    ReadCache.redis.smembers "cart#{id}"
  end

  def default_avatar
    return if avatar.attached?

    avatar.attach(io: File.open("./lib/assets/user-default.jpeg"),
                  filename: "default-avatar")
  end
end
