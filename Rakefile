# frozen_string_literal: true
require 'rake/clean'
require 'bundler/gem_tasks'
require 'quality/rake/task'

$LOAD_PATH.unshift File.dirname(__FILE__) + '/lib'

PROJECT_NAME = 'quality'

BUILD_DIR = 'build'
directory BUILD_DIR

PKG_DIR = "#{BUILD_DIR}/pkg"
directory PKG_DIR

GEM_MANIFEST = 'Manifest.txt'
VERSION_FILE = 'lib/quality.rb'

CLOBBER.include("#{BUILD_DIR}/*")

Dir['tasks/**/*.rake'].each { |t| load t }

Quality::Rake::Task.new do |t|
  t.skip_tools = ['reek']
  t.verbose = true
end

task :clear_metrics do |_t|
  puts Time.now
  ret = system('git checkout coverage/.last_run.json *_high_water_mark')
  raise unless ret
end

task localtest: [:clear_metrics, :test, :quality]

task default: [:localtest]

#
# To publish docker image after gem is published:
#   ./publish-docker-image.sh
#
# ...after source_finder is published:
#   QUALITY_BUILD_ARGS='--no-cache' ./publish-docker-image.sh
