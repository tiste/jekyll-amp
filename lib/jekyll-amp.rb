require 'jekyll-amp/version'

module Jekyll
  class AmpPost < Page
    def initialize(site, dir, post, name = 'index.html')
      @site = site
      @base = site.source
      @dir = dir
      @name = name

      self.process(@name)
      self.read_yaml(File.join(site.source, '_layouts'), 'amp.html')
      self.content      = post.content
      self.data['body'] = (Liquid::Template.parse post.content).render site.site_payload

      # Merge all data from post so that keys from self.data have higher priority
      self.data = post.data.merge(self.data)

      self.data.delete('excerpt')
      self.data['canonical_url'] = post.url
    end
  end

  class AmpGenerator < Generator
    safe true
    priority :low

    def generate(site)
      dir = site.config['ampdir'] || 'amp'
      pages = site.pages.dup

      site.posts.docs.each do |post|
        next if post.data['skip_amp'] == true
        site.pages << AmpPost.new(site, File.join(dir, post.id), post)
      end

      pages.each do |page|
        next if page.data['skip_amp'] == true
        site.pages << AmpPost.new(site, File.join(dir), page, page.name)
      end
    end
  end
end
