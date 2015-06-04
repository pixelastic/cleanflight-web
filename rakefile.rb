require "rubygems"
require "tmpdir"

require "bundler/setup"
require "jekyll"
require "algoliasearch"

namespace :site do
  jekyll_config = Jekyll.configuration(source: 'src', destination: '_temp')
  jekyll_site = Jekyll::Site.new(jekyll_config)

  task :generate do
    jekyll_site.process
  end

  desc "Reindex doc"
  task :reindex, [:algolia_api_key] => :generate do |t, args|
    raise "missing algolia_api_key argument" if args[:algolia_api_key].nil?
    jekyll_config['algolia']['clusters'].each do |cluster|
      Thread.current[:algolia_hosts] = nil
      Algolia.destroy
      Algolia.init application_id: jekyll_config['algolia']['application_id'], api_key: args[:algolia_api_key], hosts: [ "#{cluster}.algolia.io" ]
      idx = Algolia::Index.new("#{jekyll_config['algolia']['index_name']}")
      idx.set_settings attributesToIndex: ['unordered(title)', 'tags', 'categories', 'unordered(content)'], customRanking: ['desc(rank)'], attributesForFaceting: ['categories', 'tags']
      idx.clear_index
      idx.add_objects jekyll_site.posts.map { |post| { title: post.title, url: post.url, rank: post.data['rank'], categories: post.categories, tags: post.tags, content: post.content } }
      FileUtils.remove_entry '_temp'
    end
  end
end