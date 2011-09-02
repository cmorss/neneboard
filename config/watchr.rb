def run_spec(file)
  unless File.exist?(file)
    puts "#{file} does not exist"
    return
  end

  puts "Running #{file}"
  system "bundle exec rspec #{file}"
  puts
end

watch("spec/.*/*_spec\.rb") do |match|
  run_spec match[0]
end

watch("app/(.*/.*)\.rb") do |match|

  %w(artist board callaborator renderer shape stencil theme).each do |model|
    if match[1] =~ /#{model}/
      Dir.glob("spec/**/*_spec.rb").each do |spec|
        run_spec(spec) if spec =~ /#{model}/
      end
    end
  end

  run_spec %{spec/#{match[1]}_spec.rb}
end

def brew(path, out_dir = "public/javascripts/lib")
  print "Brewing #{path}. "
  STDOUT.flush
  system "coffee -b -o #{out_dir} -c #{path}"
  puts "done"
end

watch("public/javascripts/.*/*\.coffee") do |match|
  brew(match[0])
end

watch("public/javascripts/*\.coffee") do |match|
  brew(match[0])
end

# Brew the spec files. These get placed in the same directory as the .coffee src
watch("spec/javascripts/*\.coffee") do |match|
  brew(match[0], File.dirname(match[0]) + "/lib")
end

watch("spec/javascripts/.*/*\.coffee") do |match|
  brew(match[0], File.dirname(match[0]) + "/lib")
end
