class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    def can_edit?(resource)
      true
    end

    def can_create?(resource_class)
      true
    end

    def can_read?(resource)
      true
    end

    def can_destroy?(resource)
      true
    end
end
