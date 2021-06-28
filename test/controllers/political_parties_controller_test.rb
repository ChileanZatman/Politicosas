require "test_helper"

class PoliticalPartiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @political_party = political_parties(:one)
  end

  test "should get index" do
    get political_parties_url
    assert_response :success
  end

  test "should get new" do
    get new_political_party_url
    assert_response :success
  end

  test "should create political_party" do
    assert_difference('PoliticalParty.count') do
      post political_parties_url, params: { political_party: { coalition: @political_party.coalition, founding: @political_party.founding, founding_ideology: @political_party.founding_ideology, name: @political_party.name, political_compass: @political_party.political_compass, principles: @political_party.principles } }
    end

    assert_redirected_to political_party_url(PoliticalParty.last)
  end

  test "should show political_party" do
    get political_party_url(@political_party)
    assert_response :success
  end

  test "should get edit" do
    get edit_political_party_url(@political_party)
    assert_response :success
  end

  test "should update political_party" do
    patch political_party_url(@political_party), params: { political_party: { coalition: @political_party.coalition, founding: @political_party.founding, founding_ideology: @political_party.founding_ideology, name: @political_party.name, political_compass: @political_party.political_compass, principles: @political_party.principles } }
    assert_redirected_to political_party_url(@political_party)
  end

  test "should destroy political_party" do
    assert_difference('PoliticalParty.count', -1) do
      delete political_party_url(@political_party)
    end

    assert_redirected_to political_parties_url
  end
end
