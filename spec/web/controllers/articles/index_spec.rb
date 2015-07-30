require 'spec_helper'
require_relative '../../../../apps/web/controllers/articles/index'

describe Web::Controllers::Articles::Index do
  let(:action) { Web::Controllers::Articles::Index.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end