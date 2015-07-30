require 'spec_helper'
require_relative '../../../../apps/web/views/top/index'

describe Web::Views::Top::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/top/index.html.erb') }
  let(:view)      { Web::Views::Top::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    expect(view.foo).to eq exposures.fetch(:foo)
  end
end
