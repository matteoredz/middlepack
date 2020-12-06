activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :directory_indexes

external_pipeline_options = {
  name: :webpack,
  command: build? ? "yarn run build" : "yarn run start",
  source: ".tmp/dist",
  latency: 1
}

activate :external_pipeline, external_pipeline_options

configure :development do
  activate :livereload
end

page "/*.xml",  layout: false
page "/*.json", layout: false
page "/*.txt",  layout: false

set :css_dir,    "assets/stylesheets"
set :js_dir,     "assets/javascript"
set :images_dir, "images"

configure :build do
  activate :asset_hash, ignore: [/\.jpg\Z/, /\.png\Z/]
end
