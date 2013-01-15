require 'rack'
require 'rack/is_the_site_still_up'


describe Rack::IsTheSiteStillUp do

  subject {Rack::IsTheSiteStillUp}

  describe "#initialize" do
    let(:s) do
      subject.new("foo", "bar") do
        "baz"
      end
    end

    it "creates state" do
      s.app.should == "foo"
      s.path.should == "bar"
      s.msg.should == "baz"
    end

    it "is persistent" do
      expect {s.app = "baz"}.to raise_error
      expect {s.path = "baz"}.to raise_error
    end

    it "has useful defaults" do
      basic = subject.new("foo")
      basic.path.should == '/online'
      basic.msg.should == "Site is Still Up"
    end
  end


  describe "#call" do
    let(:app) {stub()}
    let(:s)   {subject.new(app)}

    before do
      Rack::Request.stub(:new) {|x| x}
    end

    it "returns a simple 200 with the 'msg' when the 'path' is requested" do
      env = stub(:path => '/online')
      s.call(env).should == [200, {"Content-Type" => "text/html"}, ["Site is Still Up"]]
    end

    it "returns the result of the called app when other paths are requested" do
      env = stub(:path => '/other')
      app.should_receive(:call).with(env).and_return("foo")
      s.call(env).should == "foo"
    end
  end
end
