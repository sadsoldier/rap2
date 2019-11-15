
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler'
require 'bootsnap'
Bootsnap.setup(cache_dir: '/home/ziggi/rapp4bw/app/tmp/cache', load_path_cache: false, autoload_paths_cache: false)

