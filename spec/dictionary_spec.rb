require 'rspec'
require 'dictionary'


describe Term do
  before do
    Term.clear
  end
  it 'should have word and definition instance variables that are associated with each other' do
    term = Term.new(['jungle'],'A hot jungly place with monkeys')
    term.word.should eq ["jungle"]
    term.definition.should eq ['A hot jungly place with monkeys']
  end
  it 'should list all of the terms in the dictionary' do
    term = Term.new('Carbs', "Don't eat these, your crazy!")
    term2 = Term.new('Freedom', "This is America!")
    Term.list.should eq "Carbs Freedom"
  end
  it 'should list the definition of a chosen word in the dictionary' do
    term = Term.new('TheForce', "You are a strong one Jedi")
    term = Term.new('cow', "A friendly farm yard animal")
    Term.def('cow').should eq ["A friendly farm yard animal"]
  end
  it 'should allow people to edit or delete terms' do
    term = Term.new('blue', "the color of the sky")
    term = Term.new('uggo', "a bad thing to be")
    term.delete('uggo')
    Term.list.should eq 'blue'
    term.edit('blue',"the color of the blue man group")
    Term.def("blue").should eq "the color of the blue man group"
  end
   it 'should allow people to search for a term' do
    term1 = Term.new('blue', "the color of the sky")
    term2 = Term.new('uggo', "a bad thing to be")
    Term.search('blue').should eq term1
  end
   it 'should support multiple definitions per word' do
    term1 = Term.new(['blue','azul'], "the color of the sky", "my favorite theatre man group")
    term2 = Term.new('uggo', "a bad thing to be")
    Term.search('blue').should eq term1
    Term.def('blue').should eq ["the color of the sky", "my favorite theatre man group"]
  end
end
