module ImagesPath
  class Generator < Jekyll::Generator
    def initialize(site)
      @base_dir  = site['url']
    end
    def generate(site)
      site.posts.docs.each { |p| rewrite_links(site, p) }
    end
    def rewrite_links(site, post)
      post.content = post.content.gsub(/!\[(.*)\]\((?!http)(.*)\)/) { "![#{$1}](#{@base_dir}/assets/images/#{File.basename($2)})" }
    end
  end
end