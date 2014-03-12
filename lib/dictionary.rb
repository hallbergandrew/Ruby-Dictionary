require './lib/definition.rb'
require './lib/word.rb'
class Term

  @@list_of_term_objects = []

  def Term.clear
    @@list_of_terms = {}
    @@list_of_term_objects = []
  end

  def Term.list
    string = ''
    @@list_of_term_objects.each do |object|
      string += object.word + " "
    end
  string[0..-2]
  end

  def Term.list_of_terms
    @@list_of_terms
  end

  def Term.search(word)
    @@list_of_term_objects.each do |term|
      if word == term.word
      return term
     end
    end
  end

  def Term.def(word)
   @@list_of_term_objects.each do |term|
      if word == term.word
      return term.definition
      end
    end
  end

  def initialize(word, language, definition)
    @word = Word.new(word, language, definition)

    @@list_of_term_objects << self
  end

  def word
    @word.word
  end

  def definition
    @word.definition.definition
  end

  def redefine(newdef)
    @word.definition.definition = newdef
  end

  def delete(passedword)
    term_to_delete = Term.search(passedword)
    @@list_of_term_objects.delete_if {|term| term == term_to_delete}
  end

end
