class Trivia::API

    URL = "https://opentdb.com/api.php?amount=50&type=boolean"

    def get_trivia
        hash = HTTParty.get(URL)
        array = hash["results"]
        self.trivia_objects(array) 
    end

    def trivia_objects(array)
        array.each do |hash|
            Trivia::Info.new(hash)
        end
    end

end