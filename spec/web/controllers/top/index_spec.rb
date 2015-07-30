require 'spec_helper'
require_relative '../../../../apps/web/controllers/top/index'

describe Web::Controllers::Top::Index do
  let(:action) { Web::Controllers::Top::Index.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
