activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :directory_indexes

command =
  if build?
    "./node_modules/webpack/bin/webpack.js --bail -p"
  else
    "./node_modules/webpack/bin/webpack.js --watch -d --progress --color"
  end

external_pipeline_options = {
  name: :webpack,
  command: command,
  source: ".tmp/dist",
  latency: 1
}

activate :external_pipeline, external_pipeline_options

set :relative_links, true

configure :development do
  activate :livereload

  config[:css_dir] = ".tmp/dist"
  config[:js_dir]  = ".tmp/dist"
end

page "/*.xml",  layout: false
page "/*.json", layout: false
page "/*.txt",  layout: false

configure :build do
  config[:http_prefix] = "/middlepack"
  config[:css_dir]     = ""
  config[:js_dir]      = ""
end
