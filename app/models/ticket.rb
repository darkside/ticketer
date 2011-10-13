class Ticket < ActiveRecord::Base
  # Constants
  STATUSES = ["open", "in_progress", "closed" ]

  # Validations
  validates_presence_of :name
  validates_presence_of :user_id
  validates_inclusion_of :status, :in => STATUSES

  # Associations
  belongs_to :user

end

