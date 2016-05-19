module Concerns
  module Common
    @@all = []

    def self.included(base)
      base.extend ClassMethods
    end

    def save
      @@all << self
    end

    def self.all
      @@all
    end

    def self.all=(value)
      @@all = value
    end

    module ClassMethods
      def create(name)
        obj = self.new(name)
        obj.save
        obj
      end

      def all
        Common.all
      end

      def destroy_all
        Common.all = []
      end
    end
  end

end
