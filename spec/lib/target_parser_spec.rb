require 'spec_helper'

class TestSubject
  include RDee::TargetParser
end


describe RDee::TargetParser do

  let(:parser) { TestSubject.new }

  it "should parse generic Firefox" do
    target, version, host = parser.parse(:firefox)
    expect(target).to eql :firefox
  end

  it "should parse the version number" do
    target, version, host = parser.parse(:firefox30)
    expect(version).to eql '30'
  end

  it "should parse the windows 8.1 host" do
    target, version, host = parser.parse(:firefox30_win81)
    expect(host).to eql 'Windows 8.1'
  end

  it "should parse the windows 8 host" do
    target, version, host = parser.parse(:firefox30_win8)
    expect(host).to eql 'Windows 8'
  end

  it "should parse the windows 7 host" do
    target, version, host = parser.parse(:firefox30_win7)
    expect(host).to eql 'Windows 7'
  end

  it "should parse the windows xp host" do
    target, version, host = parser.parse(:firefox30_winxp)
    expect(host).to eql 'Windows XP'
  end

  it "should parse snow leopard" do
    target, version, host = parser.parse(:firefox30_snow_leopard)
    expect(host).to eql 'OS X 10.6'
  end

  it "should parse mountain lion" do
    target, version, host = parser.parse(:firefox30_mountain_lion)
    expect(host).to eql 'OS X 10.8'
  end

  it "should parse mavricks" do
    target, version, host = parser.parse(:firefox30_mavricks)
    expect(host).to eql 'OS X 10.9'
  end

  it "should parse linux" do
    target, version, host = parser.parse(:firefox30_linux)
    expect(host).to eql 'linux'
  end
end
