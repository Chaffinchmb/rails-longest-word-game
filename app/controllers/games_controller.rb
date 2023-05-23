require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('a'..'z').to_a.sample }
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    word = JSON.parse(URI.open(url).read)
    if word['found'] == false
      @answer = "Sorry, #{params[:word].upcase} is not an english word"
    else
      @letters = params[:inital_letters]
      @guesses = params[:word].split(//)
    end
  end
end
