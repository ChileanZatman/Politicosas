require "application_system_test_case"

class PoliticalPartiesTest < ApplicationSystemTestCase
  setup do
    @political_party = political_parties(:one)
  end

  test "visiting the index" do
    visit political_parties_url
    assert_selector "h1", text: "Political Parties"
  end

  test "creating a Political party" do
    visit political_parties_url
    click_on "New Political Party"

    fill_in "Coalition", with: @political_party.coalition
    fill_in "Founding", with: @political_party.founding
    fill_in "Founding ideology", with: @political_party.founding_ideology
    fill_in "Name", with: @political_party.name
    fill_in "Political compass", with: @political_party.political_compass
    fill_in "Principles", with: @political_party.principles
    click_on "Create Political party"

    assert_text "Political party was successfully created"
    click_on "Back"
  end

  test "updating a Political party" do
    visit political_parties_url
    click_on "Edit", match: :first

    fill_in "Coalition", with: @political_party.coalition
    fill_in "Founding", with: @political_party.founding
    fill_in "Founding ideology", with: @political_party.founding_ideology
    fill_in "Name", with: @political_party.name
    fill_in "Political compass", with: @political_party.political_compass
    fill_in "Principles", with: @political_party.principles
    click_on "Update Political party"

    assert_text "Political party was successfully updated"
    click_on "Back"
  end

  test "destroying a Political party" do
    visit political_parties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Political party was successfully destroyed"
  end
end
