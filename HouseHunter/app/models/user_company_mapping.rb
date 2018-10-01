class UserCompanyMapping < ApplicationRecord
  belongs_to :user, :autosave => true
  belongs_to :company, :autosave => true
end
