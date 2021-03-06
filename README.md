# Anode.js
A JavaScript library for interacting with a
[Cathode](https://github.com/mobyinc/Cathode) API.

## Getting Started
### Setting the Root URL
```javascript
Anode.root = 'http://localhost:3000/api';
```

### Setting the Version
```javascript
Anode.version = '1.0.5';
```

### Setting the API Token

```javascript
Anode.token = "2f6d5a..."
```
## CRUD Operations

Use Anode’s CRUD functions–`create`, `read`, `update`, `delete`–to work
meaningfully with JavaScript objects that hold data from your API. 

```javascript
var productId, product;

// Create a new record
productId = Anode.create('product', { title: 'cool product' }).id;

// Request the record we just created
product = Anode.read('product', productId);

// Update the record
product.update({ title: 'cooler product' });

// Delete the record
product.delete();
```

## Nested Resources & Associations
Anode adds accessor functions to objects with associations that allow you to
easily request those associations’ records from the API.

```javascript
var product, productSales;

product = Anode.read('product', 3);
productSales = product.sales();
```

Note that the `sales()` function makes a *new* request to your API requesting
product 3’s associated `sale` record. If the product response includes a sale
sub-object, that object is accessible at just `product.sale`.

## Queries

Anode has built-in support for Cathode’s DSL for constructing read-only queries
that communicate with your API. This DSL is equivalent whether you’re using
Anode.js, Anode-iOS, and Anode-Android, making it easy to remember how queries
are constructed and re-use them. See the Cathode DSL reference for all the
available options.

To get the past week’s sales:
```javascript
Anode.sales.query('where created_at after 1.week.ago');
```

To get all products with more than 5 sales:
```javascript
Anode.products.query('where sales.count > 5');
```

To apply sorting, ordering, and limits:
```javascript
Anode.products.query('sort title desc, limit 5');
```

## Ajax Helpers

When you can’t use the resourceful CRUD operations, use Anode’s `get`, `post`,
`put`, and `delete` methods to work with your API’s endpoints.

```javascript
Anode.get('status')
  .done(function(status) {
    App.status = status;
  })
  .fail(function(response, status) {
    alert('There was a problem connecting to the service.');
  });
```
