# About

Calidrought is a project that aims to expose drought data in a way that makes data visualizations easy to create by providing a simple, RESTful API.

It is a revival of the legacy Calidrought application, which was built on top of Node.js.

## Why?

There exists data portals for the California drought, sure. The CDEC website, the current main source of data for Calidrought, is probably the best example. However, the website is incredibly difficult to browse through and use - which is fairly typical for Government produced websites. Also, it does not provide its data programmatically - which makes building out custom visualizations difficult.

Furthermore, every non-government visualization I've seen so far has been built off of packaged CSV files that capture point in time data. That being said, I want to lower the barrier to entry for those types of projects as well as providing the tooling needed for those projects to keep up to date.

## Initial Scope

The beginning goals of this project is to:

- [ ] Crawl and collect data from the [CDEC website](http://cdec.water.ca.gov/).
- [ ] Present the CDEC data scoped only to stations and reservoirs.

That's it. Once those two goals are achieved, I'm calling a v1.0 and deploying.

## Longterm Scope

I dunno. There is way too much data for me to write crawlers for so I'll see how it goes after completing the initial scope.

## JSON Clients

Calidrought implements the [JSON:API](http://jsonapi.org/) specification and uses [Swagger](http://swagger.io/) to generate API documentation.

There are plans to use Swagger to generate client SDKs.

## Authentication

As this is an open API, I'm not going to add any authentication mechanisms to the application.

## Tech Stack

* Elixir
* Postgres

That's it.

## Getting started

* Install dependencies with `mix deps.get`
* Create and migrate your database with `mix ecto.create && mix ecto.migrate`
* Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

---
