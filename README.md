# Project: Books API
Based on Codeignitor MVC framework

# INSTALL REQUIREMENTS

Codeignitor 3.x

# SET UP

Import the sql file: sql/db.sql

This new table(s) structure future proofs and upgrades the current legacy system to allow books to have different prices and categories without requiring duplicated data. Includes timestamp for book created date and record last modified date. Individual books can be flagged as active/inactive as required. New flag option that marks the record as deleted instead of actually deleting the record from the database.

# GET URL(S) - Returns JSON response

books/category/all/author/[the-author-name]

books/category/all

books/category/[the-category-name]

books/category/[the-category-name]/author/[the-author-name]

# CREATE URL - Returns JSON response after creation

books/create

( visit the url in your browser before trying to remotely post data to it, the page displays the required form fields )

# TODO

Validate the post data values, currently only validates required fields have been populated.

