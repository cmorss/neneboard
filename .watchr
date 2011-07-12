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

  %w(artist board callaborator renderer shape stencil style).each do |model|
    if match[1] =~ /#{model}/
      Dir.glob("spec/**/*_spec.rb").each do |spec|
        run_spec(spec) if spec =~ /#{model}/
      end
    end
  end

  run_spec %{spec/#{match[1]}_spec.rb}
end