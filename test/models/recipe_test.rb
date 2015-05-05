require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: "Lasagna", text: "The best lasagna ever", description: "Cook meat, add layers of pasta, meat and cheese. Heat oven and cook for 45 minutes. ")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "chef_id should be preset" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "name should be present" do
    @recipe.name = ""
    assert_not @recipe.valid? 
  end
  
  test "name should not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid? 
  end
  
  test "name should not be too short" do
    @recipe.name = "aaa"
    assert_not @recipe.valid? 
  end
  
  test "text should be present" do
    @recipe.text = ""
    assert_not @recipe.valid? 
  end
  
  test "text should not be too long" do
    @recipe.text = "a" * 151
  end
  
  test "text should not be too short" do
    @recipe.text = "aaaaaa"
  end
  
  test "description should be present" do
    @recipe.description = ""
    assert_not @recipe.valid? 
  end
  
  test "description should not be too long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid? 
  end
  
  test "description should not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid? 
  end
end
