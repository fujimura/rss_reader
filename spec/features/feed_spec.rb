require 'spec_helper'

feature 'Feed 一覧を表示する' do
  let!(:feed) { FactoryGirl.create :feed, author: 'alice' }

  scenario 'feed の持ち主の名前が表示されること' do
    visit root_path
    within first('.panel-title') do
      expect(page).to have_content 'alice'
    end
  end
end

feature 'Feed 一覧を表示する', 'ItemのないFeedが存在する時' do
  let!(:feed) { FactoryGirl.create :feed, author: 'alice' }

  before do
    Item.delete_all
  end

  scenario 'エラーが起きない' do
    visit root_path
    expect(page).to have_content 'read items'
  end
end

feature 'Feed 詳細画面を表示する' do
  let!(:feed) { FactoryGirl.create :feed, author: 'alice' }

  scenario 'feed の持ち主の名前が表示されること' do
    visit feed_path(feed)
    within 'h2' do
      expect(page).to have_content 'alice'
    end
  end
end
