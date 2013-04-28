###
# Blog settings
###

activate :blog do |blog|
  blog.prefix = "blog"
  # blog.permalink = ":year/:month/:day/:title.html"
  # blog.sources = ":year-:month-:day-:title.html"
  # blog.taglink = "tags/:tag.html"
  blog.layout = "blog"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "blog/tag.html"
  blog.calendar_template = "blog/calendar.html"
end
page "/blog/*", :layout => "blog"

page "blog/feed.xml", :layout => false

#blog blog_index
#index
# Methods defined in the helpers block are available in templates
helpers do
  def nav_active(current_page, page_link , title=nil)
    title ||= page_link
    if /\s/.match(current_page)
      current_page = current_page.split(/\s/)[0]
    end
      if current_page == page_link then css_class = "active" else css_class = "" end
      if page_link == "index"
        page_link = "/"
      else
        page_link = "/" + page_link
      end
      content_tag(:li, link_to(title, page_link), :class => css_class)
  end
end

###
# Compass
###

# Susy grids in Compass
# First: gem install compass-susy-plugin
# require 'susy'

# Change Compass configuration
compass_config do |config|
  config.output_style = :expanded
  config.sass_options = {debug_info: true}
end
activate :livereload
###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end
# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'img'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
