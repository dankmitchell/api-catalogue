require "govuk_tech_docs"
require "lib/api_catalogue"
require "lib/dashboard_stats"
require "lib/url_helpers"

GovukTechDocs.configure(self)

set(:layout, :api_catalogue)

helpers UrlHelpers

catalogue_csv = File.expand_path("data/catalogue.csv", __dir__)
organisation_csv = File.expand_path("data/organisation.csv", __dir__)
api_catalogue = ApiCatalogue.from_csv(catalogue_csv: catalogue_csv, organisation_csv: organisation_csv)

# Order organisations from A-Z in the Table of Contents,
# leaving a buffer from 0-999 for static content to be given priority
initial_org_weight = 1_000

api_catalogue.organisations_apis.each.with_index(initial_org_weight) do |(organisation, apis), org_weight|
  proxy(
    UrlHelpers.organisation_path(organisation),
    "organisation_index.html",
    locals: { organisation: organisation, apis: apis },
    data: {
      title: organisation.name,
      weight: org_weight,
    },
    ignore: true,
  )

  apis.each_with_index do |api, api_weight|
    proxy(
      UrlHelpers.api_path(organisation: organisation, api: api),
      "api_details.html",
      locals: { api: api },
      data: {
        title: api.name,
        weight: api_weight,
      },
      ignore: true,
    )
  end
end

proxy(
  "/dashboard/index.html",
  "dashboard.html",
  locals: { dashboard_stats: DashboardStats.new(api_catalogue) },
  ignore: true,
)
