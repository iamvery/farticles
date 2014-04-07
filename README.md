# Farticles API

This is an example of a versioned Rails API using HTTP "accept" headers rather
than including the version in resource URIs.


## Getting started

### Requirements

1. Ruby 1.9 or >
2. Postgres (I like http://postgresapp.com)

### Setup

1. Clone the repo

   ```
   git clone https://github.com/iamvery/farticles.git
   cd farticles
   ```

2. Install dependencies

   ```
   bundle install
   ```

3. Setup database

   ```
   bin/rake db:setup
   ```

### Do things

Start the local development server:

```
bin/rails s
```

Request version 1 articles:

```
bin/rake request:articles:v1
Sending headers: accept: application/vnd.farticles.v1
[{"id":1,"title":"The Things","category":null}]
```

Request version 2 articles:

```
bin/rake request:articles:v2
Sending headers: accept: application/vnd.farticles.v2
{"articles":[{"id":1,"name":"The Things","categories":[]}],"meta":{"total":1}}
```
