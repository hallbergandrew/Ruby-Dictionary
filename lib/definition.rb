class Definition

  attr_reader  :language
  attr_accessor :definition

  def initialize(definition, language)
    @definition = definition
    @language = language
  end


end
