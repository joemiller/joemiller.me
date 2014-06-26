require 'reverse_markdown'
require 'yaml'

module ReverseMarkdown
  module Converters
    class Pre < Base
      def convert(node)
        content = treat_children(node)
        lang = node['lang'] || ''
        "\n" << "{% highlight #{lang}%}" << "\n" << node.text.strip << "\n" << "{% endhighlight %}" << "\n"
      end
    end
  end
end
ReverseMarkdown::Converters.register :pre, ReverseMarkdown::Converters::Pre.new


f = ARGV[0]
contents = File.new(f, 'r').read

if (md = contents.match(/^(?<metadata>---\s*\n.*?\n?)^(---\s*$\n?)/m))
  contents = md.post_match
  metadata = YAML.load(md[:metadata])
  #metadata = md[:metadata]
end

# remove these keys from the metadata
%w[
comments
excerpt
].each do |k|
  metadata.delete(k) rescue nil
end

puts YAML.dump(metadata)
puts '---'
markdown = ReverseMarkdown.convert contents
puts markdown
