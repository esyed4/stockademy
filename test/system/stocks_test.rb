require "application_system_test_case"

class StocksTest < ApplicationSystemTestCase
  setup do
    @stock = stocks(:one)
  end

  test "visiting the index" do
    visit stocks_url
    assert_selector "h1", text: "Stocks"
  end

  test "should create stock" do
    visit stocks_url
    click_on "New stock"

    fill_in "Company name", with: @stock.company_name
    fill_in "Country", with: @stock.country
    fill_in "Currency", with: @stock.currency
    fill_in "Description", with: @stock.description
    fill_in "Exchange", with: @stock.exchange
    fill_in "Industry", with: @stock.industry
    fill_in "Ipo", with: @stock.ipo
    fill_in "Logo", with: @stock.logo
    fill_in "Phone", with: @stock.phone
    fill_in "Stock symbol", with: @stock.stock_symbol
    fill_in "Weburl", with: @stock.weburl
    click_on "Create Stock"

    assert_text "Stock was successfully created"
    click_on "Back"
  end

  test "should update Stock" do
    visit stock_url(@stock)
    click_on "Edit this stock", match: :first

    fill_in "Company name", with: @stock.company_name
    fill_in "Country", with: @stock.country
    fill_in "Currency", with: @stock.currency
    fill_in "Description", with: @stock.description
    fill_in "Exchange", with: @stock.exchange
    fill_in "Industry", with: @stock.industry
    fill_in "Ipo", with: @stock.ipo
    fill_in "Logo", with: @stock.logo
    fill_in "Phone", with: @stock.phone
    fill_in "Stock symbol", with: @stock.stock_symbol
    fill_in "Weburl", with: @stock.weburl
    click_on "Update Stock"

    assert_text "Stock was successfully updated"
    click_on "Back"
  end

  test "should destroy Stock" do
    visit stock_url(@stock)
    click_on "Destroy this stock", match: :first

    assert_text "Stock was successfully destroyed"
  end
end
