# InteractorsMindmap

[![Tests](https://github.com/martinnicolas/interactors_mindmap/actions/workflows/main.yml/badge.svg)](https://github.com/martinnicolas/interactors_mindmap/actions/workflows/main.yml)
[![Gem Version](https://badge.fury.io/rb/interactors_mindmap.svg)](https://badge.fury.io/rb/interactors_mindmap)
[![Gem Total Downloads](https://img.shields.io/gem/dt/interactors_mindmap)](https://rubygems.org/gems/interactors_mindmap)
[![Wercker](https://img.shields.io/github/license/mashape/apistatus.svg)](https://opensource.org/licenses/MIT)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](code_of_conduct.md)

This gem generates a mindmap chart to document your [interactors](https://github.com/collectiveidea/interactor) flow on your Ruby on Rails application.

![example](https://raw.githubusercontent.com/martinnicolas/interactors_mindmap/master/spec/fixtures/assets/test.png)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add interactors_mindmap

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install interactors_mindmap

## Usage

Run `interactors_mindmap` on the root path of your RoR application to generate an interactors mindmap chart.

### Running with options

By default running `interactors_mindmap`, without arguments, will show you the usage information message. You can use different options to run `interactors_mindmap` and generate only the files what you need:

- `interactors_mindmap --all`: This will generate the `interactors.md` and `interactors.html` files.
- `interactors_mindmap --md`: This will generate only the `interactors.md` file.
- `interactors_mindmap --html`: This will generate only the `interactors.html` file.
- `interactors_mindmap --version`: This will show the gem version.
- `interactors_mindmap --help`: This will show a usage information message.

This gem use [https://markmap.js.org/](https://markmap.js.org/) to generate your interactors mindmap chart.
Open `interactors.html` generated file to see your interactors mindmap chart on your browser. Alternatively, if you use Visual Studio Code IDE you can install [markmap](https://marketplace.visualstudio.com/items?itemName=gera2ld.markmap-vscodemd`) extension to open `interactors.md` generated file on the IDE.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/martinnicolas/interactors_mindmap. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/martinnicolas/interactors_mindmap/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the InteractorsMindmap project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/martinnicolas/interactors_mindmap/blob/master/CODE_OF_CONDUCT.md).
