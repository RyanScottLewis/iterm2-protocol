require "aspect/has_attributes"

module ITerm2
  module Protocol

    class Formatter

      class << self

        def format(attributes={})
          new(attributes).to_s
        end

      end

      include Aspect::HasAttributes

      def initialize(attributes={})
        @tmux = ENV["TERM"] =~ /^screen/

        update_attributes(attributes)
      end

      # @method key
      # Get the key.
      #
      # @return [String]

      # @method key=
      # Set the key.
      #
      # @param [#to_s] value
      # @return [String]
      attribute(:key) { |value| value.to_s }

      # @method value
      # Get the value.
      #
      # @return [Hash, String]

      # @method value=
      # Set the value.
      #
      # @param [#to_h, #to_s] value
      # @return [Hash, String]
      attribute(:value) { |value| value.respond_to?(:to_h) ? value.to_h : value.to_s }

      # @method content
      # Get the content.
      #
      # @return [nil, String]

      # @method content=
      # Set the content.
      #
      # @param [nil, #to_s] value
      # @return [nil, String]
      attribute(:content) { |value| value.nil? ? nil : value.to_s }

      # @method tmux
      # Get whether to format for tmux output.
      #
      # @return [Boolean]

      # @method tmux=
      # Set whether to format for tmux output.
      #
      # @param [Boolean] value
      # @return [Boolean]
      attribute(:tmux, query: true)

      # Get the key-value pair formatted as an iTerm2 escape sequence.
      #
      # If the value is a Hash, it will be formatted as `key=value` with each pair being delimited
      # by a semicolon (`;`).
      #
      # @return [String]
      def to_s
        [].tap do |segments|
          segments << escape_sequence
          segments << "1337;"
          segments << @key
          segments << "="
          segments << format_value(@value)
          segments << ":#{@content}" unless @content.nil?
          segments << st_sequence
        end.join
      end

      protected

      def escape_sequence
        @tmux ? "\033Ptmux;\033\033]" : "\033]"
      end

      def st_sequence
        @tmux ? "\a\033\\" : "\a"
      end

      def format_value(value)
        return value unless value.is_a?(Hash)

        value.collect { |k,v| "#{k}=#{v}" }.join(";")
      end

    end

  end
end
