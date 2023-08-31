# README

## Populate db
I made a rake task to populate the local database (is not too much data, so maybe some items could be repeated but with a different id of course)

rails db:create db:migrate db:populate

## Start server
rails server

## Endpoints

### GET /movies
Return the full list of movies
### GET /seasons
Return the full list of seasons
### GET /products
Return full list of movies and seasons

You can also access only movies through /products/movies and seasons through /products/seasons
### GET /library_items?user_id={user id}
Return purchased items available for the user

### POST /purchases
    Body example: {
            "user_id": 1,
            "purchase_option_id": 1
          }         
Buy a product



