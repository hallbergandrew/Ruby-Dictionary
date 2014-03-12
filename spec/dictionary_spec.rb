require 'rspec'
require 'dictionary'
require 'word'
require 'definition'


describe Term do
  before do
    Term.clear
  end
  it 'should have word and definition instance variables that are associated with each other' do
    term = Term.new(['jungle'],'english','A hot jungly place with monkeys')
    term.word.should eq ["jungle"]
    term.definition.should eq 'A hot jungly place with monkeys'
  end
  it 'should list all of the terms in the dictionary' do
    term = Term.new('Carbs','english', "Don't eat these, your crazy!")
    term2 = Term.new('Freedom', 'english',"This is America!")
    Term.list.should eq "Carbs Freedom"
  end
  it 'should list the definition of a chosen word in the dictionary' do
    term1 = Term.new('TheForce','english', "You are a strong one Jedi")
    term2 = Term.new('cow', 'english',["A friendly farm yard animal"])
    Term.def('cow').should eq ["A friendly farm yard animal"]
  end
  it 'should allow people delete terms' do
    term = Term.new('blue', 'english', "the color of the sky")
    term = Term.new('uggo', 'english', "a bad thing to be")
    term = Term.new('yellow', 'english', "another color")
    term.delete('uggo')
    Term.list.should eq 'blue yellow'
  end
  it 'should allow people edit terms' do
    term1 = Term.new('blue', 'english', "the color of the sky")
    term2 = Term.new('uggo', 'english', "a bad thing to be")
    term3 = Term.new('yello', 'english', "another color")
    term1.redefine('new definition')
    term1.definition.should eq "new definition"
  end
   it 'should allow people to search for a term' do
    term1 = Term.new('blue', 'english',"the color of the sky")
    term2 = Term.new('uggo', 'english',"a bad thing to be")
    Term.search('uggo').should eq term2
  end
   it 'should support multiple definitions per word' do
    term1 = Term.new('azul', 'spanish', ["the color of the sky", "my favorite theatre man group"])
    term2 = Term.new('uggo','english', "a bad thing to be")
    Term.search('azul').should eq term1
    Term.def('azul').should eq ["the color of the sky", "my favorite theatre man group"]
  end
end

describe Word do
  it "should distinguish the language in which the word is used" do
    word = Word.new('Bueno', 'Spanish', 'a great greeting')
    word.language.should eq 'Spanish'
    word.word.should eq 'Bueno'
    word.definition.definition.should eq 'a great greeting'
  end
end

describe Definition do
  it "should define a word and have a specific language" do
    definition = Definition.new('a great greeting', 'Spanish')
    definition.language.should  == "Spanish"
    definition.definition.should == 'a great greeting'
  end
  describe 'set_definition' do
  it "should set a new definition" do
    definition = Definition.new('a great greeting', 'Spanish')
    definition.language.should  == "Spanish"
    definition.definition = 'whatever it means'
    definition.definition.should eq 'whatever it means'
  end
end
end







