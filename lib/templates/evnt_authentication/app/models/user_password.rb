# frozen_string_literal: true

# Queries::UserPassword.
# Created by Ideo SRL on 15-09-2017.

# UserPassword.
class UserPassword < ApplicationRecord

  # Relations:

  belongs_to :user, foreign_key: :user_uuid

end
