require "base64"

require "iterm2/protocol/version"
require "iterm2/protocol/formatter"
require "iterm2/protocol/file_sequence"
require "iterm2/protocol/image_sequence"

module ITerm2
  module Protocol
    class << self

      def format(attributes={})
        Formatter.format(attributes)
      end

      def file(attributes={})
        FileSequence.format(attributes)
      end

      def image(attributes={})
        ImageSequence.format(attributes)
      end

    end
  end
end
