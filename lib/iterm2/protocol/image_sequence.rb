require "iterm2/protocol/file_sequence"

module ITerm2
  module Protocol

    # Escape sequence for use with inline images.
    class ImageSequence < FileSequence

      def initialize(attributes={})
        @width = "auto"
        @height = "auto"
        @preserve_aspect_ratio = true

        super

        @inline = true
      end

      # @method width
      # Get the width.
      #
      # @return [String]

      # @method width=
      # Set the width.
      #
      # Given as a number followed by a unit, or the word "auto":
      #
      #   N: N character cells.
      #   Npx: N pixels.
      #   N%: N percent of the session's width or height.
      #   auto: The image's inherent size will be used to determine an appropriate dimension.
      #
      # @param [#to_s] value
      # @return [String]
      attribute(:width) { |value| value.nil? ? "auto" : value.to_s }

      # @method height
      # Get the height.
      #
      # @return [String]

      # @method height=
      # Set the height.
      #
      # Given as a number followed by a unit, or the word "auto":
      #
      #   N: N character cells.
      #   Npx: N pixels.
      #   N%: N percent of the session's width or height.
      #   auto: The image's inherent size will be used to determine an appropriate dimension.
      #
      # @param [#to_s] value
      # @return [String]
      attribute(:height) { |value| value.nil? ? "auto" : value.to_s }

      # @method preserve_aspect_ratio
      # Get whether to preserve the aspect ratio.
      #
      # @return [Boolean]

      # @method preserve_aspect_ratio=
      # Set whether to preserve the aspect ratio.
      #
      # @param [Boolean] value
      # @return [Boolean]
      attribute(:preserve_aspect_ratio, query: true)

      # Return the arguments to this escape sequence.
      #
      # @param [nil, Symbol] output
      #   The output format to return the Hash for.
      #
      #   Set to `:terminal` to format for an escape sequence.
      # @return [Hash]
      def to_h(output=nil)
        result = {
          width: @width,
          height: @height
        }

        if output == :terminal
          result[:preserveAspectRatio] = @preserve_aspect_ratio ? 1 : 0
        else
          result[:preserve_aspect_ratio] = @preserve_aspect_ratio
        end

        super(output).merge(result)
      end

    end

  end
end
