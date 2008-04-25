module DataMapper
  module Persistence
    def business_display_name
      self.class.name
    end
  end
end