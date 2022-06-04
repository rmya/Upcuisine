# Upcuisine

### VIPER architecture

* For foods screen : [foods-module](https://github.com/rmya/Upcuisine/tree/main/Upcuisine/Upcuisine/foods-module)
* For foodDetail screen : [foodDetail-module](https://github.com/rmya/Upcuisine/tree/main/Upcuisine/Upcuisine/foodDetail-module)
* For Cart screen : [cart-Module](https://github.com/rmya/Upcuisine/tree/main/Upcuisine/Upcuisine/cart-module)

### Lib's
- I used [Kingfisher](https://github.com/onevcat/Kingfisher) to view extensions and set an image directly from a URL.
- I used [Alamofire](https://github.com/Alamofire/Alamofire) to use [Constans](https://github.com/rmya/Upcuisine/blob/main/Upcuisine/Upcuisine/Constants/URLs.swift) APIs

### Features
* Dark & Light Mode
* Turkish and English languages support
* When a meal is selected, it will switch to the food detail screen (MenuScreen to DetailScreen)
* With the stepper button, the quantity is increased and the price is updated.(DetailScreen)
* When the “ADD TO CART” button is clicked (DetailScreen) ;
    - it is checked that the food is in the cart,
    - if there is no food in the cart, it is added as a new item,
    - if there is food the quantity is updated,
    - The user is informed with the Alert.
* Sum Total Price and update when item is deleted (Cart)
* Show emtyStackView when cart is empty
* Show cartList.count on tabbarBadge and update


![Upcuisine screen](https://github.com/rmya/Upcuisine/blob/main/Upcuisine/UpcuisineSS.png)

