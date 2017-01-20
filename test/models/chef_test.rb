require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "john", email: "john@voorbeeld.com")
  end
  
  test "chef moet aanwezig zijn" do
    assert @chef.valid?
  end
  
  test "chefname moet tevoorschijn komen" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end
  
  test "chefnaam mag niet te lang zijn" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end
  
  test "chefnaam mag niet te kort zijn" do
    @chef.chefname = "aa"
    assert_not @chef.valid?
  end
  
  test "email moet tevoorschijn komen" do
    @chef.email = " "
    assert_not @chef.valid?
  end
  
  test "email moet voldoende lengte hebben" do
    @chef.email = "a" * 101 + "@voorbeeld.com"
    assert_not @chef.valid?
  end
  
  test "email adres moet uniek zijn" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email validation moet geaccepteerd zijn" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]
    valid_addresses.each do |va|
      @chef.email = va
      assert @chef.valid?, '#{va.inspect} is beschikbaar'
  end
end

  test "email validation gaat email afwijzen" do
    invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
    invalid_addresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, '#{ia.inspect} is niet beschikbaar'
    end
  end
end
