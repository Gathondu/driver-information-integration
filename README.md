# Driver information rails app

### Getting Started
1. Please branch off of master and push your code regularly.
2. When complete, reach out to `ted@cover.com` and `firas@cover.com`
3. Please timebox yourself to a maximum of 2 hours.
4. Read the notes below, if you have any questions please reach out to `firas@cover.com` and `ted@cover.com` via email.

### Notes
1. This rails application is API only, meaning there will be no rendering of any views.
2. The clients of this application only accept JSON
3. The clients of this application expect responses formatted to the [JSONAPI](https://jsonapi.org/) spec.
4. There is a `driver_informations_controller` created with routes set up
5. There is an example request that is made to the controller [found here](https://github.com/ted/driver-information-integration/blob/master/test/fixtures/files/example_request.json)
6. Each branch of logic introduced should be thoroughly tested
7. Third party services are unreliable, we should make sure each branch of logic has appropriate error handling.
8. This app uses ruby 2.7.1, and rails 6.1.4

### Business Requirements
1. Given a `first_name`, `last_name`, and `drivers_license_number`, I need to make a request to a driver information service and return back the result to the client.
2. The requests to the driver information service are expensive, so we should persist the results in the database after requesting a report.
3. If we've already ordered a report for a given set of information, we should load it from the database instead of ordering a new report.
4. Drivers licenses must be 8 digits long, and may only contain characters between 0-9. For an example, `12345678` is valid, `a1234567` is not.
5. Build ontop of the existing methods found in [this controller](https://github.com/ted/driver-information-integration/blob/master/app/controllers/driver_informations_controller.rb) to add the ability to create driver information records, as well as the ability to view previously created driving information records given the uuid.

### Third party services
1. There is an endpoint available at: `POST https://cover-driver-information-mock.herokuapp.com/reports` which will return driver information, it accepts a payload structured like:

```ruby
{
  "data": {
    "attributes": {
      "first_name": "Jane",
      "last_name": "Doe",
      "drivers_license_number": "00002052"
    }
  }
}

```

2. The endpoint above does have authentication, you can authenticate your requests by using the `Authorization` header with value `Bearer a9f05b05ce6d`.
3. The response from the third party service will follow this format:

```ruby
{
  "data": {
    "id": "5a4a55e4962b45a7b21ad4b5583bdf66",
    "type": "DriverInformation",
    "attributes": {
      "first_name": "Jane",
      "last_name": "Doe",
      "drivers_license_number": "00000000",
      "number_of_incidents": "0",
      "number_of_vehicles": "0"
    }
  }
}
```

### Running this branch
1. Create a .env file with the following variables
```
auth_token=<token>
api_url=<url>

DB_PASS=<database password>
DB_USER=<database user>
DB_PORT=<database port>
DB_HOST=<database host>
```

2. Create the database by running the `rails db:create` commmand.
3. Run migrations using the `rails db:migrate` commmand.
4. Run `bundle install` to install dependencies specified by the GemFile.
5. Running the server should now expose the api.
