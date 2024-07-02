# frozen_string_literal: true

RSpec.describe 'MeiliSearch::Index - Search with matching_strategy' do
  include_context 'search books with nested fields'

  it 'does a custom search with a matching strategy ALL' do
    response = index.search('best book again', matching_strategy: 'all')

    expect(response['hits'].count).to eq(1)
  end

  it 'does a custom search with a matching strategy LAST' do
    response = index.search('best book again', matching_strategy: 'last')

    expect(response['hits'].count).to eq(2)
  end

  it 'does a custom search with a matching strategy frequency' do
    response = index.search('best book again', matching_strategy: 'frequency')

    expect(response['hits'].count).to eq(1)
  end
end
