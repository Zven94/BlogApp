require 'rails_helper'

RSpec.describe 'articles/edit', type: :view do
  let(:article) do
    Article.create!
  end

  before(:each) do
    assign(:article, article)
  end

end
