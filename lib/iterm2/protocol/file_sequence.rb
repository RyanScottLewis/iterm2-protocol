require "aspect/has_attributes"

require "iterm2/protocol/formatter"

module ITerm2
  module Protocol

    # Escape sequence for use file downloads.
    class FileSequence

      class << self

        def format(attributes={})
          new(attributes).to_s
        end

      end

      include Aspect::HasAttributes

      def initialize(attributes={})
        @inline = false

        update_attributes(attributes)

        raise ArgumentError, "path must be given" if @path.nil?
      end

      # @method path
      # Get the path.
      #
      # @return [String]

      # @method path=
      # Set the path.
      #
      # @param [#to_s] value
      # @return [String]
      attribute(:path) { |value| value.is_a?(Pathname) ? value : Pathname.new(value.to_s) }

      # @method inline
      # Get whether the file will be displayed inline.
      #
      # @return [Boolean]

      # @method inline=
      # Set whether the file will be displayed inline.
      #
      # @param [Boolean] value
      # @return [Boolean]
      attribute(:inline, query: true)

      # Return the arguments to this escape sequence.
      #
      # @param [nil, Symbol] output
      #   The output format to return the Hash for.
      #
      #   Set to `:terminal` to format for an escape sequence.
      # @return [Hash]
      def to_h(output=nil)
        result = {
          name: Base64.encode64(@path.to_s),
          size: @path.size
        }

        result[:inline] = output == :terminal ? (@inline ? 1 : 0) : @inline

        result
      end

      # Get the escape sequence.
      #
      # @param [#to_h] attributes The attributes to pass to the `Formatter`.
      # @return [String]
      def to_s(attributes={})
        attributes = {
          key: "File",
          value: to_h(:terminal),
          content: Base64.encode64(@path.read)
        }.merge(attributes)

        Formatter.format(attributes)
      end

    end

  end
end
