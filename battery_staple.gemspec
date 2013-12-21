Gem::Specification.new do |s|
  s.name        = "battery-staple"
  s.version     = "0.1.0"
  s.date        = "2013-12-20"
  s.summary     = "Password generator, based on http://xkcd.com/936/"
  s.description = "It generates strong (though obscure) passwords"
  s.authors     = ["Kevin Liddle", "Jim Suchy"]
  s.email       = "kevin@8thlight.com"
  s.files       = [
    "lib/battery_staple.rb",
    "lib/dictionary_reader.rb",
    "lib/random_password.rb",
    "lib/randomizer.rb",
    "lib/dictionary.txt",
  ]
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'fakefs'
  s.add_runtime_dependency 'colorize'
  s.executables = ["battery_staple"]
  s.homepage    = "http://github.com/KevinLiddle"
  s.license     = "WTFPL"
end
