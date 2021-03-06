require 'zurb-foundation'
require 'sprockets'

::Sprockets.append_path File.join(Gem::Specification.find_by_name('zurb-foundation').gem_dir, 'js')

###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

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

page 'robots.txt', layout: false
page 'humans.txt', layout: false
page 'sitemap.xml', layout: false

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

set :css_dir, 'styles'

set :js_dir, 'scripts'

set :images_dir, 'images'

# set :relative_links, true

# Build-specific configuration
#
configure :build do

  # Enable live reload while working locally
  activate :livereload

  # For example, change the Compass output styles for deployment
  activate :minify_css
  activate :minify_javascript

  # Enable cache buster
  activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # activate :smusher

  # Build with nice urls
  activate :directory_indexes

end

activate :s3_sync do |s3_sync|
  s3_sync.bucket = 'www.aktive-senioren-sempach.ch'
  s3_sync.region = 'eu-west-1'
end
