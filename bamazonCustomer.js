var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "test",
  database: "bamazonDB"
});

connection.connect(function(err) {
  if (err) throw err;
  console.log("connected as id " + connection.threadId);
  queryAllProducts();
  placeAnOrder();
  });

//   Running this application will first display all of the Products available for sale. Include the ids, names, and prices of products for sale.
  function queryAllProducts() {
    connection.query("SELECT * FROM products", function(err, res) {
      for (var i = 0; i < res.length; i++) {
        console.log("\nProduct ID: " + res[i].item_id + " || " + "Product Name: " + res[i].product_name + " || " + "Price ($): " + res[i].price_$);
      }
      console.log("-----------------------------------");
    });
  }


// function to handle order process
function placeAnOrder() {
    // prompt for info about the order
    inquirer
      .prompt([
        {
          name: "item_id_wanted",
          type: "input",
          message: "What is the ID of the product you would like to buy from the list below?"
        },
        {
          name: "quantity_wanted",
          type: "input",
          message: "how many units of the product would you like to buy?",
          validate: function(value) {
            if (isNaN(value) === false && parseInt(value) > 0) {
              return true;
            }
            return false;
            console.log("Please enter a valid number.")
          }
        }
      ])
      .then(function(answer) {
        // get the information of the chosen item
        var chosenProduct;
        var chosenProductQuantity;
        var chosenProductPrice;
        var currentStockLevel;
        for (var i = 0; i < res.length; i++) {
          if (res[i].item_id === answer.item_id_wanted) {
            chosenProduct = res[i].product_name;
            chosenProductQuantity = answer.quantity_wanted;
            chosenProductPrice = res[i].price_$;
            currentStockLevel = res[i].stock_quantity;
          }
        }

        // determine if stock level is high enough
        if (currentStockLevel < parseInt(answer.quantity_wanted)) {
          // if stock level is high enough, so update db, let the user know, and start over
          currentStockLevel = currentStockLevel - answer.quantity_wanted;
          connection.query(
            "UPDATE stock level? Where?",
            [
              {
                stock_quantity: currentStockLevel
              },
              {
                item_id: chosenProduct.id
              }
            ],
            function(error) {
              if (error) throw err;
              console.log("Order placed successfully!");
              placeAnOrder();
            }
          );
        }
        else {
          // bid wasn't high enough, so apologize and start over
          console.log("Insufficient stock level. Please try a different quantity again.");
          placeAnOrder();
        }
      });
  };
  
