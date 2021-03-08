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

    def self.category_array
        self.all.map do |object|
            "#{object.category}"
        end
    end

    def self.category_list
        self.category_array.uniq
    end

end