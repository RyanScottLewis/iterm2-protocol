def generate_file_output(path, options={})
  path = Pathname.new(path.to_s) unless path.is_a?(Pathname)

  [].tap do |segments|
    segments << "\033]"
    segments << "1337;"
    segments << "File"
    segments << "="
    segments << "name=#{Base64.encode64(path.to_s)};"
    segments << "size=#{path.size};"
    segments << "inline=#{options[:inline] ? 1 : 0};" if options[:inline]
    segments << "width=#{options[:width]};" if options[:width]
    segments << "height=#{options[:height]};" if options[:height]
    segments << "preserveAspectRatio=#{options[:preserve_aspect_ratio] ? 1 : 0};" if options[:preserve_aspect_ratio]

    segments.last.gsub!(/;$/, "")

    segments << ":"
    segments << Base64.encode64(path.read)
    segments << "\a"
  end.join
end
