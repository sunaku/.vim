#!/usr/bin/env ruby
#
# Updates Vim scripts (defined by *.get files in this directory) as needed.
#
# These *.get files are YAML documents that define a "script_id" parameter:
#
#   script_id: NNNNN
#
# where NNNNN is a placeholder for the unique identifier of the particular
# Vim script that you want to download from http://www.vim.org/scripts/.
#
# The basenames of these *.get files (minus the file extension) are used as
# directory names for housing their corresponding Vim scripts after download.
#
# After a new version of a Vim script is downloaded, the corresponding *.get
# file is overwritten (while preserving the original "script_id" parameter) to
# reflect the newly downloaded version, and the old download directory (if it
# exists) is renamed to include its corresponding, old version identifier.
#
# This script was inspired by the GetLatestVimScripts utility:
# http://www.vim.org/scripts/script.php?script_id=642
#
###
#
# Prerequisites:
#
# - Ruby 1.9 or newer      : http://www.ruby-lang.org
# - mechanize 1.0 or newer : gem install mechanize
# - unzip 6.0 or newer     : http://www.info-zip.org
# - tar 1.23 or newer      : http://www.gnu.org/software/tar/
#
###
#
# (the ISC license)
#
# Copyright 2010 Suraj N. Kurapati <sunaku@gmail.com>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#

require 'mechanize'
require 'rake'
require 'tmpdir'
require 'yaml'

Dir['*.get'].each do |get_file|
  puts '', get_file
  get_info = YAML.load_file(get_file)

  script_id = get_info['script_id'] or
  raise "#{get_file} must define the 'script_id' parameter"

  get_dir = File.expand_path(get_file).sub(/\.get$/, '')

  # check for new version
  agent = Mechanize.new
  page = agent.get("http://www.vim.org/scripts/script.php?script_id=#{script_id}")

  newest_version_link = page.links.find do |link|
    link.href.start_with? 'download_script.php?src_id='
  end or raise "no versions found for script_id=#{script_id}"

  newest_version = newest_version_link.href[/\d+$/].to_i
  current_version = get_info['src_id'].to_i

  if newest_version > current_version or not File.exist? get_dir
    puts "#{get_file} is out of date (newest=#{newest_version})"

    Dir.mktmpdir do |download_dir|
      # download new version
      download = agent.click(newest_version_link)
      download_file = File.join(download_dir, download.filename)
      File.open(download_file, 'wb') {|f| f << download.body }

      # extract new version
      mkdir extract_dir = download_file + '.extract'

      case download_file
      when /\.vim$/
        mkdir plugin_dir = File.join(extract_dir, 'plugin')
        mv download_file, plugin_dir

      when /\.zip$/
        sh 'unzip', '-d', extract_dir, download_file

      when /\.tar$/
        sh 'tar', '-x', '-C', extract_dir, '-f', download_file

      when /\.tar\.gz$/, /\.tgz$/
        sh 'tar', '-x', '-C', extract_dir, '-f', download_file, '--gzip'

      when /\.tar\.bz2?$/, /\.tbz$/
        sh 'tar', '-x', '-C', extract_dir, '-f', download_file, '--bzip2'

      else
        raise "don't know how to extract #{download.filename}"
      end

      # install new version
      if File.exist? get_dir
        mv get_dir, [get_dir, current_version].join('@')
      end

      mv extract_dir, get_dir
    end

    # update the get file to reflect the newly installed version
    get_info['src_id'] = newest_version
    File.open(get_file, 'w') {|f| f << get_info.to_yaml }
  end

  puts "#{get_file} is up to date"
end
