require 'spec_helper'

describe "Supported browser combinations" do

  let(:watir_browser) { Watir::Browser }


  it "includes generic Firefox" do
    expect(watir_browser).to receive(:new).with(:firefox)
    RD.watir_browser :firefox
  end

  it "includes generic Chrome" do
    expect(watir_browser).to receive(:new).with(:chrome)
    RD.watir_browser :chrome
  end

  
end
