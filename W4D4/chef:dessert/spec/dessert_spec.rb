require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do
      expect(Dessert.new("cake", 10, chef)).to have_attributes(type: "cake")
    end

    it "sets a quantity" do
      expect(Dessert.new("cake", 10, chef)).to have_attributes(quantity: 10)
    end

    it "starts ingredients as an empty array" do
      expect(Dessert.new("cake", 10, chef)).to have_attributes(ingredients: [])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "10", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert = Dessert.new("cake", 10, chef)
      dessert.add_ingredient("flour")
      expect(dessert.ingredients).to include("flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert = Dessert.new("cake", 10, chef)
      dessert.add_ingredient("flour")
      dessert.add_ingredient("sugar")
      dessert.add_ingredient("butter")
      dessert.add_ingredient("eggs")
      dessert.mix!
      expect(dessert.ingredients).to_not eq(["flour", "sugar", "butter", "eggs"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert = Dessert.new("cake", 10, chef)
      dessert.eat(5)
      expect(dessert.quantity).to eq(5)
    end

    it "raises an error if the amount is greater than the quantity" do
      dessert = Dessert.new("cake", 10, chef)
      expect { dessert.eat(15) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef John the Great Baker")
      dessert = Dessert.new("cake", 10, chef)
      expect(dessert.serve).to eq("Chef John the Great Baker has made 10 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      dessert = Dessert.new("cake", 10, chef)
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
