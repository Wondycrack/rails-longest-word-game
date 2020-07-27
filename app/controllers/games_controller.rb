class GamesController < ApplicationController
    def new
        @letters =[]
        10.times do 
            letter = [*('A'..'Z')].sample
            @letters.push(letter)
        end
        @letters
    end

    def answer
        
    end
    def score
        @word = params[:word]
        @letters = params[:letters].split
        @result = is_english?
        if !has_letters?
            @result = "Sorry but #{@word.upcase} cant be build out of #{@letters.join}"
        elsif !is_english?
            @result = "Sorru but #{@word.upcase} its not an valid english word!"
        else !is_english?
            @result = "Congratulation #{@word.upcase} its a valid english word!"
        end

    end

    def has_letters?
        @word.upcase.split("").all? { |letter| @letters.count(letter) >= @word.upcase.split("").count(letter) }

    end
    def is_english?
        require 'json'
        require 'open-uri'

        url = "https://wagon-dictionary.herokuapp.com/#{@word}"
        user_serialized = open(url).read
        user = JSON.parse(user_serialized)
        user["found"]
        
    end

end
