require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe "Todo Model Test" do
    it "Success Test" do
      todo = Todo.new()
      expect(todo.test?).to be_truthy
    end
    it "Error Test" do
      todo = Todo.new()
      expect(todo.test?).to be_falsey
    end
  end
end
