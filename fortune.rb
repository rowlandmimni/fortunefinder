require 'rubygems'
require 'sinatra'

before do
  headers "Content-Type" => "text/html; charset=utf-8" 
 end

get '/' do
  @title="Fortune Finder 1.0"
  erb :form
end

post '/fortune' do
@title="Your fortune is revealed"
 @dirty=[" in bed during the ride of your life", " with your best friends mom", " with great pride in your own private parts", " with penis in thy ear", " with more than one sex partner at the same time"," but your lover will still cheat on you"," and you will receive twice the amount of oral sex as usual", " but its too bad you will get chlamydia from a stripper"," but sometimes even a blow job won't help you succeed", " but your private parts may not be as safe as you think they are", " with sex toy in hand"]
 @oldpersonfortune=["Your hip will break", "Your viagara subscription may run out before you know it", "You will be hospitalized within the next week for any number of reasons", "You will find love but he or she will be toothless", "Hold on, you are how old?"]
 @fortune=["You will make new friends this year", "You will find yourself particularly lucky in the month of March", "Play games often and you will be surprised how often you will win", "Watch your mouth when your temper gets hot", "You will have great success in many endeavors", "You will receive money in the mail", "You will have success in every aspect of your life", "You will come up with the next great idea of this generation"] 
 
 if params[:normalfortune]
  @birthyear=params[:birthyear]
    if @birthyear.to_i < 1968 
    @yourfortune=  @oldpersonfortune[rand(@oldpersonfortune.length)] + "."
    else 
    @yourfortune=  @fortune[rand(@fortune.length)] + "."
    end
 else
  @birthyear=params[:birthyear]
    if @birthyear.to_i < 1968
    @yourfortune= @oldpersonfortune[rand(@oldpersonfortune.length)] + @dirty[rand(@dirty.length)] +"."
    elsif
      @birthyear.to_i < 1998 
      @yourfortune= @fortune[rand(@fortune.length)] + @dirty[rand(@dirty.length)] + "."
    else 
      @yourfortune= "Read a book, kid."
 end
    end

 erb :fortune
end


