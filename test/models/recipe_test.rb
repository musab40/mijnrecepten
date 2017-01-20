require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname: "musab", email: "musab@voorbeeld.com")
    @recipe = @chef.recipes.build(name: "Kip parmezaan", summary: "dit is de beste kip parmezaan",
              description: "voeg tomatensaus, uien, olie toe. Vervolgens voeg kip toe, kook voor 20 minuten.")
  end
  
  test "Recept moet aanwezig zijn" do
    assert @recipe.valid?
  end
  
  test "chef_id moet tevoorschijn komen" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "Name moet ingevuld zijn" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "naam mag niet te lang zijn" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "naam mag niet te kort zijn" do
    @recipe.name = "aaaa"
    assert_not @recipe.valid?
  end
  
  test "samenvatting moet ingevuld zijn" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "samenvatting lengte mag niet te lang zijn" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test "samenvatting lengte mag niet te kort zijn" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end
  
  test "uitleg moet ingevuld zijn" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "uitleg mag niet te lang zijn" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
  
  test "uitleg mag niet te kort zijn" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end
  
  
end
