# frozen_string_literal: true

# This adds #valid_uuid? to ruby's Ex1 class
class String
  UUID_REGEX = /^\w{8}-\w{4}-\w{4}-\w{4}-\w{12}$/
  def valid_uuid?
    !match(UUID_REGEX).nil?
  end
end
