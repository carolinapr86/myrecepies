require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "John", email: "john12@example.com")  
  end
  
  test "chef must be valid" do
    assert @chef.valid?
  end 
  
  test "chefname must be present" do
    @chef.chefname = ""
    assert_not @chef.valid?
  end
  
  test "chefname sould not be too long" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end
  
  test "chefname sould not be too short" do
    @chef.chefname = "aa"
    assert_not @chef.valid?
  end
  
  
  test "email must be present" do
    @chef.email = ""
    assert_not @chef.valid?
  end
  
  test "email length sould be within bounds" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end
  
  test "email sould be unique" do
    @chef.chefname = "john@bla.com"
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    
    assert_not dup_chef.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_adresses = %w{user@eee.com R_TDD@eee.hello.org user@example.com c.perez@eee.co}    
    valid_adresses.each do |va|
      @chef.email = va
      assert @chef.valid?, '#{va.inspect} should be valid'
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_adresses = %w{user@eee,com R_TDD.eee.hello.org user@.com c.perez@a_eee_.co}    
    invalid_adresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, '#{ia.inspect} should not be valid'
    end
  end
  
end