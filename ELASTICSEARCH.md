# ELASTICSEARCH

+ smallest unit of data is a field
+ a field can be a integer, string, array or any other common data type.
+ many fields make up a document

#### URL interface structure

    /index/type/docid

#### analogies of elasticsearch structure vs relational database structure
+ indexes are akin to databases
+ types are akin to tables
+ documents are akin to rows/records
+ each document has _id which is equivalent to primary id for relational databases
+ field is also field (same terminology)

#### Basic CRUD

    // Create an index named 'planet'
    PUT /planet

    // Create a type called 'hacker'
    PUT /planet/hacker/_mapping
    {
     "hacker": {
     "properties": {
     "handle": {"type": "string"},
     "age": {"type": "long"}}}}

    // Create a document
    PUT /planet/hacker/1
    {"handle": "jean-michel", "age": 18}

    // Retrieve the document
    GET /planet/hacker/1

    // Update the document's age field
    POST /planet/hacker/1/_update
    {"doc": {"age": 19}}

    // Delete the document
    DELETE /planet/hacker/1
