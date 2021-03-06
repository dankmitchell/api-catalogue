# Getting started

## About this project

The API catalogue is a [Middleman site][middleman] which uses the
[Tech Docs Template][tech-docs-template] to provide the layout and functionality
such as the Table of Contents.

Pages describing the APIs are generated dynamically from a CSV file located in
the `data/inputs` directory. Content for other pages is based on Markdown files
located in the `source` directory.

## Before you start

[Setup rbenv][setup-rbenv] and install the Ruby version specified in [`.ruby-version`][ruby-version]

## Setup

1. Clone the git repository: `git clone git@github.com:alphagov/api-catalogue.git`
1. Navigate to the project directory: `cd api-catalogue`
1. Install gems: `bundle install`
1. Run the test suite to verify your setup: `bundle exec rspec`

## Preview your changes locally

To preview the API catalogue locally run:

```sh
bundle exec middleman server
```

See the generated website on `http://localhost:4567` in your browser. Any
content changes you make to the website will be updated in real time.

To shut down the Middleman instance running on your machine, use `ctrl+C`.

## Build

To build the static website run:

```sh
bundle exec middleman build
```

If the build fails, run it again with the `--verbose` flag to get detailed error
messages to help with finding the problem.

## Publishing

[Create a pull request][pull-request] to make changes to the site. When the pull
request is merged it'll be published automatically. See the
[deployment documentation][deployment] for further details.

[middleman]: https://middlemanapp.com/
[tech-docs-template]: https://github.com/alphagov/tech-docs-template
[setup-rbenv]: https://github.com/rbenv/rbenv#installation
[ruby-version]: ../.ruby-version
[pull-request]: https://gds-way.cloudapps.digital/standards/pull-requests.html
[deployment]: ./deployment.md
