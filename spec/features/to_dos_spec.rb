feature "ToDos" do
  scenario "A user can sign in a create a ToDo" do

    visit "/"

    click_link "Register"

    fill_in "Username", with: "hunta"
    fill_in "Password", with: "pazzword"

    click_button "Register"

    fill_in "Username", with: "hunta"
    fill_in "Password", with: "pazzword"

    click_button "Sign In"

    expect(page).to have_content "Welcome, hunta"

    fill_in "What do you need to do?", with: "Get a haircut"
    click_button "Add ToDo"

    expect(page).to have_content "ToDo added"

    within ".todos" do
      expect(page).to have_content "Get a haircut"
    end
  end

  scenario "User can edit todo" do
    visit "/"

    click_link "Register"

    fill_in "Username", with: "hunta"
    fill_in "Password", with: "pazzword"

    click_button "Register"

    fill_in "Username", with: "hunta"
    fill_in "Password", with: "pazzword"

    click_button "Sign In"

    expect(page).to have_content "Welcome, hunta"

    fill_in "What do you need to do?", with: "Get a haircut"
    click_button "Add ToDo"

    expect(page).to have_content "ToDo added"

    within ".todos" do
      expect(page).to have_content "Get a haircut"
    end

    click_link "Edit"

    expect(page).to have_field("body", with: "Get a haircut")

    fill_in "body", with: "I like my hair long"
    click_button "Update ToDo"

    expect(page).to have_content "ToDo updated"

    within ".todos" do
      expect(page).to have_content "I like my hair long"
    end

  end

  scenario "User can complete todo" do
    visit "/"

    click_link "Register"

    fill_in "Username", with: "hunta"
    fill_in "Password", with: "pazzword"

    click_button "Register"

    fill_in "Username", with: "hunta"
    fill_in "Password", with: "pazzword"

    click_button "Sign In"

    expect(page).to have_content "Welcome, hunta"

    fill_in "What do you need to do?", with: "Get a haircut"
    click_button "Add ToDo"

    expect(page).to have_content "ToDo added"

    within ".todos" do
      expect(page).to have_content "Get a haircut"
    end

    click_button "Complete"

    expect(page).to have_content "ToDo complete"

    within ".todos" do
      expect(page).to have_no_content "Get a haircut"
    end

  end

  scenario "User can only see todos they created" do
    visit "/"

    click_link "Register"

    fill_in "Username", with: "hunta"
    fill_in "Password", with: "pazzword"

    click_button "Register"

    fill_in "Username", with: "hunta"
    fill_in "Password", with: "pazzword"

    click_button "Sign In"

    expect(page).to have_content "Welcome, hunta"

    fill_in "What do you need to do?", with: "Get a haircut"
    click_button "Add ToDo"

    expect(page).to have_content "ToDo added"

    within ".todos" do
      expect(page).to have_content "Get a haircut"
    end

    click_button "Sign Out"

    click_link "Register"

    fill_in "Username", with: "luke"
    fill_in "Password", with: "luke"

    click_button "Register"

    fill_in "Username", with: "luke"
    fill_in "Password", with: "luke"

    click_button "Sign In"

    expect(page).to have_content "Welcome, luke"

    fill_in "What do you need to do?", with: "Laundry"
    click_button "Add ToDo"

    expect(page).to have_content "ToDo added"

    within ".todos" do
      expect(page).to_not have_content "Get a haircut"
      expect(page).to have_content "Laundry"
    end

  end
end
