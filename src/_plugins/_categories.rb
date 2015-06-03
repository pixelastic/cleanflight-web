# override default Jekyll post's process method not extracting categories
module Jekyll
  class Post
    def process(name)
      m, cats, date, slug, ext = *name.match(MATCHER)
      self.categories += (cats || '').split('/')
      self.date = Time.parse(date)
      self.slug = slug
      self.ext = ext
    rescue ArgumentError
      path = File.join(@dir || "", name)
      msg  =  "Post '#{path}' does not have a valid date.\n"
      msg  << "Fix the date, or exclude the file or directory from being processed"
      raise Errors::FatalException.new(msg)
    end
  end
end