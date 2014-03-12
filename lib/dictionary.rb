class Term

  @@list_of_terms = {}
  @@list_of_term_objects = []

  def Term.clear
    @@list_of_terms = {}
    @@list_of_term_objects = []
  end

  def Term.list
    string = ''
    @@list_of_terms.each do |key, value|
      string += key + " "
    end
  string[0..-2]
  end

  def Term.list_of_terms
    @@list_of_terms
  end

  def Term.search(word)
    @@list_of_term_objects.each do |term|
      word == term.word
      return term
    end
  end


  def Term.def(word)
    @@list_of_terms.each do |key,value|
      if key.include?(word)
      return value
      end
    end
  end

  def initialize(word, *definition)
    @word = word
    # words.each do |word|
    #   @word << word
    # end

    @definition = definition

    @@list_of_term_objects << self
    @@list_of_terms[@word] = @definition
  end

  def word
    @word
  end

  def definition
    @definition
  end


  def delete(word)
    @@list_of_terms.delete(word)
  end

  def edit(word, definition)
    @@list_of_terms[word] = definition
  end


end
