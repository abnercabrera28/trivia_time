class Trivia::Info

    @@all = []

    def initialize(hash)
        hash.each do |key, value| 
          self.class.attr_accessor(key)
          self.send("#{key}=", value)
        end
        @@all << self
    end

    def self.all
        @@all
    end

    def self.question_list
        self.all.map do |object|
            HTMLEntities.new.decode "#{object.category}"
        end
    end

    def self.category_list
        return self.question_list.uniq
    end

end