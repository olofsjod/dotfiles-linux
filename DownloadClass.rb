#!/usr/bin/ruby -w
require 'nokogiri'
require 'open-uri'
require 'uri'

class DownloadClass
	def initialize(url, downloadpath)
		@url = url
		@hostname = ExtractHostname(@url)

		puts "Loading URL..."
		@urlhandle = open(@url)
		@htmlfile = Nokogiri::HTML(@urlhandle)
		puts "...done"
		@prefix = String.new

		@downloadpath = downloadpath
	end

	def SetPrefix(prefix)
		@prefix = prefix
	end

	def SearchImg(regex)
		objects = @htmlfile.xpath('.//img/@src').to_a
		searchedArray = RecursiveSearch(regex, objects)
		return searchedArray
	end

	def SearchLinks(regex)	## Searching links in a document
		return RecursiveSearch(regex, URI.extract(@urlhandle))
	end

	def RecursiveSearch(regexp, array)
		matches = Array.new()
		array.each do |object|
			if "#{object.to_s}" =~ /#{regexp}/		
				if object.to_s =~ /^\/[^\/].*$/ then		# /abc/xyz/foo.bar
					matches.push("#{@hostname}#{object.to_s}")
				elsif object.to_s =~ /^http:\/\/(.*)/ then
					matches.push("#{object.to_s}")
				elsif object.to_s =~ /^[^http:\/\/].*/ then
					matches.push("#{@hostname}/#{object.to_s}")
				elsif object.to_s =~ /^\/\/(.*)$/ then		# //abc.xyz/foo/bar/...
					matches.push("http://#{$1}")
				end
			end
		end
		if matches.count == 0
			puts "No search result!"
		end
		return matches
	end

	def DownloadFile(url, ddir)
		filename = ExtractFileName(url)
		
		# What type of URL is it?
		if url =~ /^\/[^\/].*$/ then		# /abc/xyz/foo.bar
			url = "#{@hostname}#{url}"
		elsif url =~ /^\/\/(.*)$/ then		# //abc.xyz/foo/bar/...
			url = "http://#{$1}"
		end	

		# Should the downloaded file got a prefix?
		if @prefix.empty? == false
			filename = "#{@prefix}#{filename}"
		end

		# Is there an duplicate?
		dircontent = Dir["#{ddir}/*"]
		filenames = Array.new()
		
		for i in 0..dircontent.count-1 do
			filenameTemp = ExtractFileName(dircontent[i])
			filenames[i] = filenameTemp
		end

		# The comparing stage
		safe = true	## Assuming there is no duplicate
		filenames.each do |item|
			if "#{filename}" == "#{item.to_s}"
				safe = false
				puts "There was already an '#{filename}' in the directory!"
				break
			end
		end

		if safe == true then
			puts "Downloading #{url}..."
			@filehandle = open("#{ddir}/#{filename}", "wb")

			puts "Writing to #{ddir}/#{filename}..."
			@filehandle.write(open(url).read)

			@filehandle.close
			puts "...done"
		elsif safe == false then
			@filehandle = open("#{ddir}/!#{filename}", "wb")

			puts "Writing the doublette to #{ddir}/!#{filename}"
			@filehandle.write(open(url).read)
			@filehandle.close
			puts "...done"
		else
			puts "Dafuq"
		end
	end	

	def DownloadArray(array)
		array.each do |url|
			DownloadFile(url, @downloadpath)
		end
	end

	def ExtractFileName(url)
		if url =~ /^.*\/(.*)\.(.*)$/
			return "#{$1}.#{$2}"
		end
	end

	def ExtractHostname(url)
		if url =~ /^(http:\/\/.*[a-z]+\.[a-z]+)\/.*$/
			return "#{$1}"
		end
	end
end
