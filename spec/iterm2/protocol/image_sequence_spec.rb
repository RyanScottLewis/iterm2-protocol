require "spec_helper"

describe ITerm2::Protocol::ImageSequence do

  describe "#to_s" do

    it "should have the correct output" do
      fixture_path = $FIXTURE_PATH.join("ruby-logo.png")
      expectation = generate_file_output(fixture_path, inline: true, preserve_aspect_ratio: true, width: "auto", height: "auto")

      instance = described_class.new(path: fixture_path)

      expect(instance.to_s).to eq(expectation)
    end

  end

end
