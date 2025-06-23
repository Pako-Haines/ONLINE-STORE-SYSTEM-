// The code below is to be run in mongo shell
// Create database
use STORE

// Then in STORE database create types for complex attributes
db.createCollection("Categories");
db.createCollection("Products");
db.createCollection("Customers");
db.createCollection("Staff");
db.createCollection("Orders");
db.createCollection("Payments");
db.createCollection("Stores");

// Insert sample data for Categories
db.Categories.insertMany([
  { categoryID: 'cat1', categoryName: 'Books' },
  { categoryID: 'cat2', categoryName: 'Electronics' },
  { categoryID: 'cat3', categoryName: 'Clothing' },
  { categoryID: 'cat4', categoryName: 'Home & Kitchen' },
  { categoryID: 'cat5', categoryName: 'Toys' }
]);

// Insert sample data for Products
db.Products.insertMany([
  { productID: 'prod1', names: 'The Great Gatsby', descriptions: 'A classic novel', price: 10.99, stockLevel: 100, categoryID: 'cat1' },
  { productID: 'prod2', names: 'Smartphone', descriptions: 'Latest model', price: 299.99, stockLevel: 50, categoryID: 'cat2' },
  { productID: 'prod3', names: 'T-shirt', descriptions: 'Cotton T-shirt', price: 15.99, stockLevel: 200, categoryID: 'cat3' },
  { productID: 'prod4', names: 'Blender', descriptions: 'Kitchen blender', price: 49.99, stockLevel: 30, categoryID: 'cat4' },
  { productID: 'prod5', names: 'Lego Set', descriptions: 'Building blocks', price: 39.99, stockLevel: 80, categoryID: 'cat5' },
  { productID: 'prod6', names: 'Headphones', descriptions: 'Noise-cancelling', price: 89.99, stockLevel: 60, categoryID: 'cat2' },
  { productID: 'prod7', names: 'Jeans', descriptions: 'Denim jeans', price: 29.99, stockLevel: 150, categoryID: 'cat3' },
  { productID: 'prod8', names: 'Microwave', descriptions: 'Compact microwave', price: 79.99, stockLevel: 20, categoryID: 'cat4' },
  { productID: 'prod9', names: 'Toy Car', descriptions: 'Remote-controlled car', price: 24.99, stockLevel: 90, categoryID: 'cat5' },
  { productID: 'prod10', names: 'Laptop', descriptions: 'High-performance laptop', price: 999.99, stockLevel: 15, categoryID: 'cat2' }
]);

// Insert sample data for Customers
db.Customers.insertMany([
  { customerID: 'cust1', personID: 'person1', name: 'John Doe', address: '123 Main St, Anytown, CA 12345', phoneNumber: '123-456-7890', contactInfo: 'john@example.com' },
  { customerID: 'cust2', personID: 'person2', name: 'Jane Roe', address: '4564 DA St, Dallas, DA 76453', phoneNumber: '987-455-3410', contactInfo: 'jane@example.com' },
  { customerID: 'cust3', personID: 'person3', name: 'Pako BA', address: '45 OLA St, Oliver, OLA 76543', phoneNumber: '987-623-3510', contactInfo: 'pako@example.com' },
  { customerID: 'cust4', personID: 'person4', name: 'Lefika TT', address: '45690 LAM St, Las Vegas, LAM 87654', phoneNumber: '987-345-3210', contactInfo: 'lefika@example.com' },
  { customerID: 'cust5', personID: 'person5', name: 'Janki MO', address: '23 PIN St, Pine, PIN 67543', phoneNumber: '987-654-3222', contactInfo: 'jani@example.com' },
  { customerID: 'cust6', personID: 'person6', name: 'Tonderai BA', address: '019 FIN St, Finland, FIN 87654', phoneNumber: '987-654-3120', contactInfo: 'tonderai@example.com' },
  { customerID: 'cust7', personID: 'person7', name: 'Nonofo TH', address: '2828 KILL St, Gotham, KILL 76555', phoneNumber: '987-654-4510', contactInfo: 'nonofo@example.com' },
  { customerID: 'cust8', personID: 'person8', name: 'Roy TH', address: '988 HILL St, Hillbrow, HILL 23676', phoneNumber: '987-654-3200', contactInfo: 'roy@example.com' },
  { customerID: 'cust9', personID: 'person9', name: 'Kef MA', address: '4443 ABC St, Alphabet, ABC 23546', phoneNumber: '987-654-3345', contactInfo: 'kef@example.com' },
  { customerID: 'cust10', personID: 'person10', name: 'Oats GA', address: '425 UCT St, UCT Town, UCT 67', phoneNumber: '987-654-3123', contactInfo: 'oats@example.com' }
]);

// Insert sample orders data  into Orders
db.Orders.insertMany([
  {
      orderID: 'order1',
      orderDate: new Date(),
      customerID: 'cust1',
      items: [{ productID: 'prod1', quantity: 2, price: 10.99 }],
      totalAmount: 21.98,
      shipment: { shipmentID: 'sh1', address: '123 Main St, Anytown, CA 12345', shippedDate: new Date(), expectedDeliveryDate: new Date() + 3 },
      payment: { paymentID: 'pay1', amount: 21.98, paymentDate: new Date(), paymentMethod: 'Credit Card' }
  },
  {
      orderID: 'order2',
      orderDate: new Date(),
      customerID: 'cust2',
      items: [{ productID: 'prod2', quantity: 1, price: 299.99 }],
      totalAmount: 299.99,
      shipment: { shipmentID: 'sh2', address: '4564 DA St, Dallas, DA 76453', shippedDate: new Date(), expectedDeliveryDate: new Date() + 3 },
      payment: { paymentID: 'pay2', amount: 299.99, paymentDate: new Date(), paymentMethod: 'Debit Card' }
  },
  {
      orderID: 'order3',
      orderDate: new Date(),
      customerID: 'cust1',
      items: [{ productID: 'prod3', quantity: 3, price: 15.99 }],
      totalAmount: 47.97,
      shipment: { shipmentID: 'sh3', address: '123 Main St, Anytown, CA 12345', shippedDate: new Date(), expectedDeliveryDate: new Date() + 3 },
      payment: { paymentID: 'pay3', amount: 47.97, paymentDate: new Date(), paymentMethod: 'PayPal' }
  },
  {
      orderID: 'order4',
      orderDate: new Date(),
      customerID: 'cust2',
      items: [{ productID: 'prod4', quantity: 1, price: 49.99 }],
      totalAmount: 49.99,
      shipment: { shipmentID: 'sh4', address: '4564 DA St, Dallas, DA 76453', shippedDate: new Date(), expectedDeliveryDate: new Date() + 3 },
      payment: { paymentID: 'pay4', amount: 49.99, paymentDate: new Date(), paymentMethod: 'Credit Card' }
  },
  {
      orderID: 'order5',
      orderDate: new Date(),
      customerID: 'cust3',
      items: [{ productID: 'prod5', quantity: 4, price: 39.99 }],
      totalAmount: 159.96,
      shipment: { shipmentID: 'sh5', address: '45 OLA St, Oliver, OLA 76543', shippedDate: new Date(), expectedDeliveryDate: new Date() + 3 },
      payment: { paymentID: 'pay5', amount: 159.96, paymentDate: new Date(), paymentMethod: 'Cash' }
  },
  {
    orderID: 'order6',
    orderDate: new Date(),
    customerID: 'cust4',
    items: [{ productID: 'prod6', quantity: 2, price: 89.99 }],
    totalAmount: 179.98,
    shipment: { shipmentID: 'sh6', address: '45690 LAM St, Las Vegas, LAM 87654', shippedDate: new Date(), expectedDeliveryDate: new Date() + 3 },
    payment: { paymentID: 'pay6', amount: 179.98, paymentDate: new Date(), paymentMethod: 'Credit Card' }
},
{
    orderID: 'order7',
    orderDate: new Date(),
    customerID: 'cust5',
    items: [{ productID: 'prod7', quantity: 5, price: 29.99 }],
    totalAmount: 149.95,
    shipment: { shipmentID: 'sh7', address: '23 PIN St, Pine, PIN 67543', shippedDate: new Date(), expectedDeliveryDate: new Date() + 3 },
    payment: { paymentID: 'pay7', amount: 149.95, paymentDate: new Date(), paymentMethod: 'Debit Card' }
},
{
    orderID: 'order8',
    orderDate: new Date(),
    customerID: 'cust6',
    items: [{ productID: 'prod8', quantity: 1, price: 79.99 }],
    totalAmount: 79.99,
    shipment: { shipmentID: 'sh8', address: '019 FIN St, Finland, FIN 87654', shippedDate: new Date(), expectedDeliveryDate: new Date() + 3 },
    payment: { paymentID: 'pay8', amount: 79.99, paymentDate: new Date(), paymentMethod: 'Credit Card' }
},
{
    orderID: 'order9',
    orderDate: new Date(),
    customerID: 'cust7',
    items: [{ productID: 'prod9', quantity: 3, price: 24.99 }],
    totalAmount: 74.97,
    shipment: { shipmentID: 'sh9', address: '2828 KILL St, Gotham, KILL 76555', shippedDate: new Date(), expectedDeliveryDate: new Date() + 3 },
    payment: { paymentID: 'pay9', amount: 74.97, paymentDate: new Date(), paymentMethod: 'PayPal' }
},
{
    orderID: 'order10',
    orderDate: new Date(),
    customerID: 'cust8',
    items: [{ productID: 'prod10', quantity: 1, price: 999.99 }],
    totalAmount: 999.99,
    shipment: { shipmentID: 'sh10', address: '988 HILL St, Hillbrow, HILL 23676', shippedDate: new Date(), expectedDeliveryDate: new Date() + 3 },
    payment: { paymentID: 'pay10', amount: 999.99, paymentDate: new Date(), paymentMethod: 'Credit Card' }
}
]);

// Insert sample data for Staff
db.Staff.insertMany([
  { employeeID: 'emp1', personID: 'person11', name: 'Alice Johnson', address: '789 Elm St, Bigcity, NY 10101', phoneNumber: '111-222-3333', positions: 'Manager', schedule: 'Mon-Fri: 9:00-17:00' },
  { employeeID: 'emp2', personID: 'person12', name: 'Bob Brown', address: '987 Pine St, Midtown, AL 54321', phoneNumber: '444-555-6666', positions: 'Sales', schedule: 'Mon-Fri: 9:00-17:00' },
  { employeeID: 'emp3', personID: 'person13', name: 'Jen ABC', address: '932 Psa St, Ytown, DL 54321', phoneNumber: '444-455-6566', positions: 'Sales', schedule: 'Mon-Fri: 9:00-17:00' },
  { employeeID: 'emp4', personID: 'person14', name: 'Lewa Doski', address: '023 Pil St, Firetown, QP 57621', phoneNumber: '324-545-3266', positions: 'Sales', schedule: 'Mon-Fri: 9:00-17:00' },
  { employeeID: 'emp5', personID: 'person15', name: 'Pablo Gavi', address: '234 Jin St, Smalltown, LP 54741', phoneNumber: '444-525-3236', positions: 'Sales', schedule: 'Mon-Fri: 9:00-17:00' }
]);

// Insert sample data for Payments
db.Payments.insertMany([
  { paymentID: 'pay1', amount: 21.98, paymentDate: new Date(), paymentMethod: 'Credit Card', orderID: 'order1' },
  { paymentID: 'pay2', amount: 299.99, paymentDate: new Date(), paymentMethod: 'Debit Card', orderID: 'order2' },
  { paymentID: 'pay3', amount: 47.97, paymentDate: new Date(), paymentMethod: 'PayPal', orderID: 'order3' },
  { paymentID: 'pay4', amount: 49.99, paymentDate: new Date(), paymentMethod: 'Credit Card', orderID: 'order4' },
  { paymentID: 'pay5', amount: 159.96, paymentDate: new Date(), paymentMethod: 'Cash', orderID: 'order5' },
  { paymentID: 'pay6', amount: 179.98, paymentDate: new Date(), paymentMethod: 'Credit Card', orderID: 'order6' },
  { paymentID: 'pay7', amount: 149.95, paymentDate: new Date(), paymentMethod: 'Debit Card', orderID: 'order7' },
  { paymentID: 'pay8', amount: 79.99, paymentDate: new Date(), paymentMethod: 'Credit Card', orderID: 'order8' },
  { paymentID: 'pay9', amount: 74.97, paymentDate: new Date(), paymentMethod: 'PayPal', orderID: 'order9' },
  { paymentID: 'pay10', amount: 999.99, paymentDate: new Date(), paymentMethod: 'Credit Card', orderID: 'order10' }
]);

// Insert sample data for Stores
db.Stores.insertMany([
  { storeID: 'store1', names: 'Main Store', address: '789 Elm St, Maincity, NY 10101', inventory: ['prod1', 'prod2'], staff: 'emp1' },
  { storeID: 'store2', names: 'Branch Store1', address: '789 Br1 St, Br1city, NY 10231', inventory: ['prod3', 'prod4'], staff: 'emp2' },
  { storeID: 'store3', names: 'Branch Store2', address: '987 Br2 St, Br2town, BR 54231', inventory: ['prod5', 'prod6'], staff: 'emp3' },
  { storeID: 'store4', names: 'Branch Store3', address: '789 Br3 St, Br4city, BR 10321', inventory: ['prod7', 'prod8'], staff: 'emp4' },
  { storeID: 'store5', names: 'Branch Store4', address: '987 Br4 St, Br4town, BR 53541', inventory: ['prod9', 'prod10'], staff: 'emp5' }
]);