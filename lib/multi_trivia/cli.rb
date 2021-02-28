class Trivia::CLI
    
    def run
        cheers
        sleep 1.5
        Trivia::API.new.get_trivia
        new_question
    end
    
    def cheers
        puts ""
        puts "---------------------------------------"
        puts ""
        puts " Welcome to The Greatest Trivia Show!!!"
        puts ""
        puts "---------------------------------------"
        puts ""
    end

    def new_question 
        prompt = TTY::Prompt.new

        choices = Trivia::Info.category_list
    
        choice = prompt.select("Choose a category:", choices) do |menu|
        end

        gory = Trivia::Info.all.find do |object|
            object.category == choice
        end

        puts ""
        puts HTMLEntities.new.decode gory.question
        
        choice_a = prompt.select("True or False?") do |menu|
            menu.choice "True"
            menu.choice "False"
        end
        
        if choice_a == gory.correct_answer
            puts ""
            puts "-------------------"
            puts ""
            puts "     Correct!     "
            puts ""
            puts "-------------------"
            puts ""
            continue
            puts ""
        else 
            puts ""
            puts "No, it's #{gory.correct_answer}!"
            puts ""
            continue
            puts ""
        end    
    end
    
    def continue
        Trivia::Info.all.clear
        sleep 1
        Trivia::API.new.get_trivia

        prompt = TTY::Prompt.new
    
        choice = prompt.select("Continue?") do |menu|
            menu.choice "Yes"
            menu.choice "No"
        end
    
        if choice == "Yes"
            puts ""
            new_question
        else 
            puts ""
            goodbye
        end     
    end
    
    def goodbye
        puts "-------------------"
        puts ""
        puts "Thanks for playing!"
        puts ""
        puts "-------------------"
        exit
    end

end