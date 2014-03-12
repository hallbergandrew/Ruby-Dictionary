require './lib/definition.rb'

class Word

  attr_reader :word,  :language
  attr_accessor :definition


  def initialize(word, language, definition)
    @word = word
    @language = language
    @definition = Definition.new(definition, language)
  end


end
