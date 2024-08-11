#My_shopping_cart_assignment_grade_it_well_ >_< 
items = ["chips" , "soda" , "milk"]
price_items =[3.00, 2.50, 4.50]
print("Welcome to the shopping cart program !")
action = ""
while action != "5":
    print("Please select one of the following :")
    menu = ["Add item" , "view cart" , "Remove item" , "compute total" , "quit" ]
    for index, item in enumerate(menu, start=1):
     print(f"{index}. {item}")
    action = input("Please enter an action : ")
    if action == "1":
       first_menu = input("what item would you like to add ? ")    
       items.append(first_menu)
       price_firstmenu = float(input("what is the price of " + "'" + first_menu.capitalize() + "'? "))
       price_items.append(price_firstmenu)
       print("'" + first_menu.capitalize() +"'" "has been added to the cart." )
    elif action == "2":
       for i in range(len(items)):
          print(f"{items[i]} - ${price_items[i]:.2f}")
        #add_prices_to_items_and_display
    elif action == "3":
        remove_item = int(input("which item would you like to remove ? "))
        if remove_item >= 1 and remove_item <= len(items):
           del items[remove_item-1]
           del price_items[remove_item-1]
           print("Item removed.")
           #there_are_3_items_in_my_list_but_i_can't_seem_to_delete_the_3rd_item_?!!  
        else:
           print("invalid number. please enter a number within the range of the list.")
    elif action == "4":
       added_price = sum(price_items)
       print(f"The total price of the items in the shopping cart is: ${added_price:.2f}")
print("Thank you. Goodbye.")
        

              
