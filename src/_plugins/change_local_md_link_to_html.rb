module ChangeLocalMdLinksToHtml
  class Generator < Jekyll::Generator
    def generate(site)
      @base_dir = Jekyll.configuration({})['url']
      site.posts.each { |p| rewrite_links(site, p) }
    end
    def rewrite_links(site, post)
      post.content = post.content.gsub(/\(([^)]+)\.md\)/){"(#{@base_dir}/docs/#{$1.downcase.gsub(/_|\P{Word}/, '-').gsub(/-{2,}/, '-')}/)"}
    end
  end
end