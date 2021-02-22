class GamesController < ApplicationController
  def new
    @letters = (0...10).map { (65 + rand(26)).chr }.join(' ')
  end

  def score
    @word = (params[:word] || "").upcase
    # @included = included?(@word, @letters)
    @english_word = english_word?(@word)
  end

  # def included?(word, letters)
  #   word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  # end

  def english_word?
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
