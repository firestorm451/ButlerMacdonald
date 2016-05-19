class User < ActiveRecord::Base
  has_secure_password
  has_many :job_machines

  validates :name, :role, presence: true, length: {
    minimum: 3,
    maximum: 15
  }
  validates :password, length: {
    minimum: 8,
    too_short: "Password must be at least 8 characters",
    maximum: 25,
    too_long: "Password must be less than 25 characters"
  }
end
