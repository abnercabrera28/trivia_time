class Trivia::CLI
    
    def run
        cheers
        Trivia::API.new.get_trivia
        #cats
        new_question
        #Trivia::Info.select_cat
        #binding.pry
        #Trivia::Info.category_list
        #binding.pry
        #start   
    end
    
    def cheers
        puts "Welcome to The Greatest Trivia Show!!!"
    end
    
    
    # def one_question
    #     Trivia::Info.all.each do |object|    
    #         puts HTMLEntities.new.decode object.question
            
    #         prompt = TTY::Prompt.new
    
    #         choice = prompt.select("True or False?") do |menu|
    #             menu.choice "True"
    #             menu.choice "False"
    #         end
        
    #         if choice == object.correct_answer
    #             puts "Correct!"
    #             continue
    #         else 
    #             puts "No, it's #{object.correct_answer}!"
    #             continue
    #         end
    #     end
    # end

    def new_question
        
        prompt = TTY::Prompt.new

        choices = Trivia::Info.category_list
    
        choice = prompt.select("Choose a category", choices) do |menu|
        end

        gory = Trivia::Info.all.find do |object|
            object.category == choice
        end

        puts HTMLEntities.new.decode gory.question
        
            choice_a = prompt.select("True or False?") do |menu|
                menu.choice "True"
                menu.choice "False"
            end
        
            if choice_a == gory.correct_answer
                puts "Correct!"
                continue
            else 
                puts "No, it's #{gory.correct_answer}!"
                continue
            end
        
    end
    
    def continue
        Trivia::Info.all.clear
        Trivia::API.new.get_trivia

        prompt = TTY::Prompt.new
    
        choice = prompt.select("Continue?") do |menu|
            menu.choice "Yes"
            menu.choice "No"
        end
    
        if choice == "Yes"
            new_question
        else 
            goodbye
        end
        
    end
    
    def goodbye
        puts "-------------------"
        puts "Thanks for playing!"
        puts "-------------------"
        exit
    end
    
    #display category list
    #get to a question within that category

    def cats
        prompt = TTY::Prompt.new

        choices = Trivia::Info.category_list
    
        choice = prompt.select("Choose a category", choices) do |menu|
        end

        Trivia::Info.find_cat(choice)

    end

end