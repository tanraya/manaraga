module Manaraga
  module Permissions
    def can_edit?(resource)
      true
    end

    def can_create?(resource_class)
      false
    end

    def can_read?(resource)
      true
    end

    def can_destroy?(resource)
      true
    end
  end
end
