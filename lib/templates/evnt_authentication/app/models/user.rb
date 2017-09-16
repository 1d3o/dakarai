# frozen_string_literal: true

# Queries::User.
# Created by Ideo SRL on 15-09-2017.

# User.
class User < ApplicationRecord

  # Relations:

  has_one :user_password, dependent: :destroy, foreign_key: :user_uuid

end
