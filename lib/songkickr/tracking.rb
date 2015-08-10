module Songkickr
  # "tracking": {
  #   "username": "username",
  #   "id": "artist:231185",
  #   "createdAt": "2010-04-17T17:27:45Z",
  #   "attendance": "i_might_go"
  # }
  class Tracking
    attr_accessor :attendance, :created_at, :id, :username

    ATTENDANCE = 'attendance'.freeze
    ID         = 'id'.freeze
    USERNAME   = 'username'.freeze
    CREATED_AT = 'created_at'.freeze

    def initialize(tracking_hash)
      @attendance = tracking_hash[ATTENDANCE] if tracking_hash.include? ATTENDANCE
      @id         = tracking_hash[ID]
      @username   = tracking_hash[USERNAME]
      @created_at = tracking_hash[CREATED_AT]
    end
  end
end
