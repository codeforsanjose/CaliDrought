# About

Calidrought is a project that aims to expose drought data in a way that makes data visualizations easy to create by providing a simple, RESTful API.

It is a revival of the legacy Calidrought application, which was built on top of Node.js.

## Initial Scope

The beginning goals of this project is to:

- [ ] Crawl and collect data from the [CDEC website](http://cdec.water.ca.gov/).
- [ ] Present the CDEC data scoped only to stations and reservoirs.

That's it. Once those two goals are achieved, I'm calling a v1.0 and deploying.

## Authentication

As this is an open API, I'm not going to add any authentication mechanisms to the application.

# Getting started

* Install dependencies with `mix deps.get`
* Create and migrate your database with `mix ecto.create && mix ecto.migrate`
* Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

---
