module Concerns
  module Common
    def self.included(base)
      base.extend ClassMethods
    end

    def save
      all << self
    end

    module ClassMethods
      def create(name)
        obj = new(name)
        obj.save
        obj
      end

      def destroy_all
        self.all = []
      end
    end
  end
end
