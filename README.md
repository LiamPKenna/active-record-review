# _Food Company Rails MVP_

#### _Web application that tracks products and their reviews., January 17, 2020_

#### By _**Liam Kenna**_

## Description

_This site is a simple Rails application that allows for the storing and reviewing of products. Users are able to:_

* _view, add, update and delete products and reviews_
* _view the product with the most reviews & three newest items from the landing page_
* _sort products by name, price, origin, or average rating_

_All user inputs are validated to meet the following specs:_

* _products have a name, cost, and country of origin_
* _reviews have an author, body, and rating_
  * _body must be between 50 and 250 characters_
  * _rating must be between 1 and 5_
* _input names are automatically capitalized_

## Setup/Installation Requirements

#### Required Versions

* _Ruby @ 2.6.5_
* _Rails @ 5.2.4_

#### Installation

* _Clone to local machine_
* _Verify that you are running postgresql locally_
* _In project root folder:_
  * _$ bundle install_
  * _$ rake db:create_
  * _$ rake db:migrate_
  * _$ rake db:test:prepare_
  * _$ rails s_

_To explore the source code, feel free to browse on github or clone to your local machine_

## Known Bugs
_Integration tests will not run unless CSS imports are commented out in application.css._

## Support and contact details
_Any issues or concerns, please email liam@liamkenna.com_

## Technologies Used
_HTML, CSS, Bootsrap, Ruby(2.6.5), Rails(5.2.4), Postgresql_

### License
*This software is available under the MIT License*
Copyright (c) 2020 **_Liam Kenna_**