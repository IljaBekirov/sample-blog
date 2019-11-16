require 'rails_helper'

describe Article do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :text }
  end

  describe 'associations' do
    it { should have_many :comments }
  end

  describe "#subject" do
    it 'returns the article title' do
      article = create(:article, title: 'Foo Bag')

      expect(article.subject).to eq('Foo Bag')
    end
  end

  describe "#last_comment" do
    it 'returns last comment' do
      article = create(:article_with_comments)

      expect(article.last_comment.body).to eq('comment body 3')
    end
  end
end