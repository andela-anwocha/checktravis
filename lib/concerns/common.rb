module Concerns
  module Common
    def self.included(base)
      base.extend(ClassMethods)
    end

    def save
      self.class.all << self
    end


    def add_song(song)
      unless @songs.include?(song)
        @songs << song
        song.send(self.class.name.downcase+"=", self)
      end
    end

    module ClassMethods
      def create(name)
        obj = new(name)
        obj.save
        obj
      end

      def all
        class_variable_get(:@@all)
      end

      def destroy_all
        class_variable_get(:@@all).clear
      end
    end
  end
end
