# namespace :widget_assets do
#   desc "Compiles widget.js and widget.css "
#   task precompile: :environment do
#     dest = "#{Rails.root}/public/widget/"
#     js_asset = "widget.js"
#     css_asset = "widget.sass"
#
#     File.write(dest + js_asset, Uglifier.compile(Rails.application.assets.find_asset(js_asset).to_s))
#     File.write(dest + "widget.css", Sass.compile(Rails.application.assets.find_asset(css_asset).to_s, {style: :compressed}))
#
#   end
#
# end
