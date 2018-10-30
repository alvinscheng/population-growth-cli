RSpec.describe PopulationGrowth do
  it "returns a successful response when given a valid zip" do
    response = HTTParty.get("https://alvin-pop-growth-api.herokuapp.com/", :query => {:zip => "90266"})
    expect(response).to be_success
  end

  it "returns an error when given a invalid zip" do
    response = HTTParty.get("https://alvin-pop-growth-api.herokuapp.com/", :query => {:zip => "111111"})
    expect(response).not_to be_success
  end

  describe "Test Cases" do
    it "returns the correct information for 90266" do
      response = HTTParty.get("https://alvin-pop-growth-api.herokuapp.com/", :query => {:zip => "90266"})
      json = JSON.parse(response.body)
      expect(json['CBSA']).to eq("31084")
      expect(json['MSA']).to eq("Los Angeles-Long Beach-Anaheim, CA")
      expect(json['Pop2015']).to eq("13340068")
      expect(json['Pop2014']).to eq("13254397")
    end

    it "returns the correct information for 32003" do
      response = HTTParty.get("https://alvin-pop-growth-api.herokuapp.com/", :query => {:zip => "32003"})
      json = JSON.parse(response.body)
      expect(json['CBSA']).to eq("27260")
      expect(json['MSA']).to eq("Jacksonville, FL")
      expect(json['Pop2015']).to eq("1449481")
      expect(json['Pop2014']).to eq("1421004")
    end

    it "returns the correct information for 88340" do
      response = HTTParty.get("https://alvin-pop-growth-api.herokuapp.com/", :query => {:zip => "88340"})
      json = JSON.parse(response.body)
      expect(json['CBSA']).to eq("10460")
      expect(json['MSA']).to eq("N/A")
      expect(json['Pop2015']).to eq("N/A")
      expect(json['Pop2014']).to eq("N/A")
    end

    it "returns the correct information for 88338" do
      response = HTTParty.get("https://alvin-pop-growth-api.herokuapp.com/", :query => {:zip => "88338"})
      json = JSON.parse(response.body)
      expect(json['CBSA']).to eq("99999")
      expect(json['MSA']).to eq("N/A")
      expect(json['Pop2015']).to eq("N/A")
      expect(json['Pop2014']).to eq("N/A")
    end
  end
end
