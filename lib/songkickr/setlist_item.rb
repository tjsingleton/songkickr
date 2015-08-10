module Songkickr
  # A single set list item.
  #    {
  #      encore: 0
  #      name: "Anti Matter "
  #    }
  class SetlistItem
    attr_accessor :encore, :name

    ENCORE = 'encore'.freeze
    NAME   = 'name'.freeze

    # Takes the set list item hash and parses a boolean out for encore.
    def initialize(setlist_item_hash)
      @encore = !setlist_item_hash[ENCORE].zero?
      @name   = setlist_item_hash[NAME]
    end
  end
end
