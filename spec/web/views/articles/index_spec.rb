require 'spec_helper'
require_relative '../../../../apps/web/views/articles/index'

describe Web::Views::Articles::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/articles/index.html.erb') }
  let(:view)      { Web::Views::Articles::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    expect(view.foo).to eq exposures.fetch(:foo)
  end
end
