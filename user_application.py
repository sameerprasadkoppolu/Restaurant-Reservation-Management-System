import pymysql
import pandas as pd
from datetime import datetime, date

username = input("DB Connect Username: ")
password = input("DB Connect Password: ")

cnx = 0
account_exists = 0
account_user = 0

try:
    cnx = pymysql.connect(host = 'localhost', user = username, password = password, db = 'restaurant_reserve', 
                      charset = 'utf8mb4',cursorclass = pymysql.cursors.DictCursor)
except pymysql.err.OperationalError as e:
    raise Exception(e)

user_choice = 0

def execute_menu_options(choice):
    if choice == 1:
        rest_name = input("Enter the Name of the Restaurant: ")
        rest_name = '%' + rest_name + '%'
        cur = cnx.cursor()
        cur.execute("CALL display_restaurant_based_on_name(%s)", rest_name)
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        cur.close()
    if choice == 2:
        cur = cnx.cursor()
        rest_name = input("Enter the Name of the Restaurant: ")
        rest_name = '%' + rest_name + '%'
        cur.execute("CALL display_restaurant_based_on_name(%s)", rest_name)
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        rest_id = input("Enter the Restaurant ID: ")
        cur.execute("CALL display_menus(%s)", rest_id)
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        cur.close()
    if choice == 3:
        cur = cnx.cursor()
        rest_name = input("Enter the Name of the Restaurant: ")
        rest_name = '%' + rest_name + '%'
        cur.execute("CALL display_restaurant_based_on_name(%s)", rest_name)
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        rest_id = input("Enter the Restaurant ID: ")
        print("Menus Available at this Restaurant Are: ")
        cur.execute("CALL display_menus(%s)", rest_id)
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        name_menu = input("Enter the Name of the Menu: ")
        cur.callproc("display_available_menu_items", (name_menu, rest_id))
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        cur.close()
    if choice == 4:
        cur = cnx.cursor()
        rest_name = input("Enter the Name of the Restaurant: ")
        rest_name = '%' + rest_name + '%'
        cur.execute("CALL display_restaurant_based_on_name(%s)", rest_name)
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        rest_id = input("Enter the Restaurant ID: ")
        cur.execute("SELECT DISTINCT category_type FROM menu_item WHERE restaurant_id = %s", rest_id)
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        cur.close()
    if choice == 5:
        cur = cnx.cursor()
        rest_name = input("Enter the Name of the Restaurant: ")
        rest_name = '%' + rest_name + '%'
        cur.execute("CALL display_restaurant_based_on_name(%s)", rest_name)
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        rest_id = input("Enter the Restaurant ID: ")
        print("Available Menu Item Categories at this Restaurant Are: ")
        cur.execute("SELECT DISTINCT category_type FROM menu_item WHERE restaurant_id = %s", rest_id)
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        type_category = input("Enter the Category Type: ")
        cur.callproc("display_menu_item_category", (type_category, int(rest_id)))
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        cur.close()
    if choice == 6:
        cur = cnx.cursor()
        rest_name = input("Enter the Name of the Restaurant: ")
        rest_name = '%' + rest_name + '%'
        cur.execute("CALL display_restaurant_based_on_name(%s)", rest_name)
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        rest_id = input("Enter the Restaurant ID: ")
        print("Items in Restaurant:")
        cur.execute("SELECT * FROM menu_item WHERE restaurant_id = %s", rest_id)
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        id_item = input("Enter the Menu Item ID: ")
        cur.callproc("display_ingredient_menu_item", (id_item))
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        cur.close()
    if choice == 7:
        cur = cnx.cursor()
        print("List of Cuisines: ")
        cur.execute("SELECT * FROM cuisine")
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        cuisine_choice = input("Enter the Name of the Cuisine: ")
        cur.execute("CALL display_restaurants_based_on_cuisine(%s)", cuisine_choice)
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        cur.close()
    if choice == 8:
        cur = cnx.cursor()
        uname = input("Enter Username: ")
        account_found_flag = cur.execute("SELECT * FROM customer_account WHERE user_name = %s", uname)
        if account_found_flag == 1:
            fname = input("Enter New First Name: ")
            cur.callproc("update_customer_account_fname", (fname, uname))
            cnx.commit()
            cur.execute("CALL display_customer_account_uname(%s)", uname)
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        else:
            print("No Account Found!")
        cur.close()
    if choice == 9:
        cur = cnx.cursor()
        uname = input("Enter Username: ")
        account_found_flag = cur.execute("SELECT * FROM customer_account WHERE user_name = %s", uname)
        if account_found_flag == 1:
            lname = input("Enter New Last Name: ")
            cur.callproc("update_customer_account_lname", (lname, uname))
            cnx.commit()
            cur.execute("CALL display_customer_account_uname(%s)", uname)
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        else:
            print("No Account Found!")
        cur.close()
    if choice == 10:
        cur = cnx.cursor()
        uname = input("Enter Username for Deletetion Verification: ")
        account_found_flag = cur.execute("SELECT * FROM customer_account WHERE user_name = %s", uname)
        if account_found_flag == 1:
            cur.execute("CALL delete_customer_account(%s)", uname)
            cnx.commit()
            print("Account Deleted!")
            global account_exists
            account_exists = 0
        else:
            print("No Account Found!")
        cur.close()
    if choice == 11:
        global account_user
        uname = account_user
        cc_num = input("Enter 16 Digit Card Number Without Spaces: ")
        c_type = input("Enter a Card Type - Choose between 'Visa', 'Amex', 'MasterCard', 'Discover'")
        ex_date = input("Enter the Expiry Date")
        cur = cnx.cursor()
        card_exists_check = cur.execute("SELECT * FROM credit_card_access WHERE credit_card_number = %s AND user_name = %s", (cc_num, uname))
        if card_exists_check == 0:
            cur.callproc("create_credit_card", (cc_num, c_type, ex_date, uname))
            cnx.commit()
            print("Credit Card Added!")
            print("List of Credit Cards Stored for User Are: ")
            cur.execute("CALL display_user_credit_card(%s)", uname)
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
            cur.close()
        else:
            print("Card Already Exists!")
            cur.execute("SELECT * FROM credit_card_access WHERE credit_card_number = %s AND user_name = %s", (cc_num, uname))
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
            cur.close()
    if choice == 12:
        uname = account_user
        cur = cnx.cursor()
        cur.execute("CALL display_user_credit_card(%s)", uname)
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        cur.close()
    if choice == 13:
        uname = account_user
        cc_old = input("Enter the Old 16 Digit Card Number Without Spaces: ")
        cc_new = input("Enter the New 16 Digit Card Number Without Spaces: ")
        c_type = input("Enter a Card Type - Choose between 'Visa', 'Amex', 'MasterCard', 'Discover'")
        ex_date = input("Enter the Expiry Date")
        cur = cnx.cursor()
        check1 = cur.execute("SELECT * FROM credit_card_access WHERE credit_card_number = %s AND user_name = %s", (cc_old, uname))
        check2 = cur.execute("SELECT * FROM credit_card_access WHERE credit_card_number = %s AND user_name = %s", (cc_new, uname))
        if check1 == 0 or check2 != 0:
            print("Old Credit Card Does Not Exist / New Credit Card Already Exists")
        else:
            cur.callproc("update_credit_card_info", (cc_old, cc_new, c_type, ex_date))
            cnx.commit()
            print("Card Updated!")
            cur.execute("SELECT * FROM credit_card_access WHERE credit_card_number = %s AND user_name = %s", (cc_new, uname))
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        cur.close()
    if choice == 14:
        uname = account_user
        cc_num = input("Enter the 16 Digit Card Number Without Spaces: ")
        cur = cnx.cursor()
        check1 = cur.execute("SELECT * FROM credit_card_access WHERE credit_card_number = %s AND user_name = %s", (cc_num, uname))
        if check1 == 0:
            print("No Credit Card Found!")
        else:
            cur.execute("CALL delete_credit_card(%s)", cc_num)
            cnx.commit()
            print("Card Deleted!")
        cur.close()
    if choice == 15:
        uname = account_user
        cc_num = input("Enter the 16 Digit Card Number Without Spaces: ")
        cur = cnx.cursor()
        rest_name = input("Enter the Name of the Restaurant: ")
        rest_name = '%' + rest_name + '%'
        result = cur.execute("CALL display_restaurant_based_on_name(%s)", rest_name)
        if result != 0:
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
            rest_id = input("Enter the Restaurant ID: ")
            print("List of Menus are: ")
            cur.execute("CALL display_menus(%s)", rest_id)
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
            menu_name = input("Pick a Menu Name: ")
            print("List of Menu Items are: ")
            cur.callproc("display_available_menu_items", (menu_name, rest_id))
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
            display_allergen_flag = ("Do you want to see Allergen Info for a Menu Item? - Press 1 for Yes")
            if display_allergen_flag == '1':
                id_item = ("Enter the Menu Item ID for which you would like to see allergen information: ")
                cur.callproc("display_ingredient_menu_item", (id_item))
                print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
            items_to_be_ordered = input("Enter the Menu Item IDs separated by space of the items you wish to order: ").split(" ")
            quantities_ordered = input("Enter Quantity for each Menu Item to be ordered separated by space: ").split(" ")
            if len(items_to_be_ordered) > 0:
                current_timestamp = datetime.now()
                current_timestamp = current_timestamp.strftime("%Y-%m-%d %H:%M:%S")
                cur.callproc("create_customer_order", ('0', rest_id, current_timestamp))
                cnx.commit()
                cur.execute("SELECT MAX(order_number) FROM customer_order WHERE restaurant_id = %s", rest_id)
                ord_num = cur.fetchone()['MAX(order_number)']
                for i in range(len(items_to_be_ordered)):
                    cur.execute("SELECT item_made_to_order FROM menu_item WHERE item_id = %s", items_to_be_ordered[i])
                    mto_flag = cur.fetchone()['item_made_to_order']
                    if bool(mto_flag) == True:
                        cur.callproc("add_order_item", (str(ord_num), items_to_be_ordered[i], quantities_ordered[i], rest_id))
                        cnx.commit()
                    else:
                        cur.execute("SELECT item_qty FROM menu_item WHERE item_id = %s", items_to_be_ordered[i])
                        inventory_qty = cur.fetchone()['item_qty']
                        if int(quantities_ordered[i]) > int(inventory_qty):
                            print("Cannot Add Item as requested quantity exceeds inventory")
                            continue
                        else: 
                            cur.callproc("add_order_item", (str(ord_num), items_to_be_ordered[i], quantities_ordered[i], rest_id))
                            cnx.commit()
                cur.callproc("create_places_order", (ord_num, rest_id, cc_num, uname))
                cnx.commit() 
                print("Order Placed!")  
            else:
                print("No Items Selected")     
        else:
            print("Cannot Place Order as No Restaurant Selected!")
        cur.close()
    if choice == 16:
        uname = account_user
        cur = cnx.cursor()
        print("List of Orders Placed by User: ")
        cur.execute("CALL display_places_order(%s)", uname)
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        order_details = input("To Display Order Details of a Specific Order, Choose a Order Number - Restaurant ID pair from the table above (Enter the values separated by space): ").split(" ")
        print("Date on which Order was Placed: ")
        cur.execute("SELECT * FROM customer_order WHERE order_number = %s AND restaurant_id = %s", (order_details[0], order_details[1]))
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        print("Items in Order: ")
        cur.callproc("display_order_item", (order_details[0], order_details[1]))
        print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        cur.close()
    if choice == 17:
        uname = account_user
        cur = cnx.cursor()
        rest_name = input("Enter the Name of the Restaurant: ")
        rest_name = '%' + rest_name + '%'
        result = cur.execute("CALL display_restaurant_based_on_name(%s)", rest_name)
        if result != 0:
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
            rest_id = input("Enter the Restaurant ID for which you would like to write a Review for: ")
            order_present = cur.execute("SELECT restaurant_id, user_name FROM places_order WHERE user_name = %s AND restaurant_id = %s", (uname, rest_id))
            if order_present == 0:
                print("You Need to Place an Order at this Restaurant before you can Write a Review")
            else:
                rate = input("Enter the Rating between 0 to 5: ")
                review_date = str(date.today())
                desc = input("Type out Review Description: ")
                cur.callproc("create_review", (rate, review_date, desc, uname, rest_id))
                cnx.commit()
                print("Review Created!")
        else:
            print("No Restaurant Selected!")
        cur.close()
    if choice == 18:
        uname = account_user
        cur = cnx.cursor()
        review_present = cur.execute("SELECT * FROM review WHERE user_name = %s", uname)
        if review_present != 0:
            cur.execute("CALL display_review_uname(%s)", uname)
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=15))
        else:
            print("You Have Not Written Any Reviews!")
        cur.close()
    if choice == 19:
        uname = account_user
        cur = cnx.cursor()
        rest_name = input("Enter the Name of the Restaurant: ")
        rest_name = '%' + rest_name + '%'
        result = cur.execute("CALL display_restaurant_based_on_name(%s)", rest_name)
        if result != 0:
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
            rest_id = input("Enter the Restaurant ID for which you would like to see the Reviews: ")
            review_present = cur.execute("SELECT * FROM review WHERE restaurant_id = %s", rest_id)
            if review_present == 0:
                print("Restaurant is Yet to be Reviewed")
            else:
                cur.execute("CALL display_review_restaurant(%s)", rest_id)
                print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        else:
            print("No Restaurant Selected!")
        cur.close()
    if choice == 20:
        uname = account_user
        cur = cnx.cursor()
        rest_name = input("Enter the Name of the Restaurant: ")
        rest_name = '%' + rest_name + '%'
        result = cur.execute("CALL display_restaurant_based_on_name(%s)", rest_name)
        if result != 0:
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
            rest_id = input("Enter the Restaurant ID for which you would like to see the Reviews: ")
            rev_date = input("Enter the Date on Which the Review was Written (YYYY-MM-DD): ")
            review_present = cur.execute("SELECT * FROM review WHERE restaurant_id = %s AND user_name = %s AND review_date = %s", (rest_id, uname, rev_date))
            if review_present == 0:
                print("No Review Found!")
            else:
                cur.execute("SELECT * FROM review WHERE restaurant_id = %s AND user_name = %s AND review_date = %s", (rest_id, uname, rev_date))
                print("Selected Review Is: ")
                print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
                cur.execute("SELECT review_id FROM review WHERE restaurant_id = %s AND user_name = %s AND review_date = %s", (rest_id, uname, rev_date))
                rev_id = cur.fetchone()['review_id']
                ch = input("Do you want to Update Review Rating - Press 1 for Yes ")
                if ch == '1':
                    new_rate = input("Enter New Review Rating etween 0 and 5: ")
                    cur.callproc("update_review_rating", (rev_id, new_rate))
                    cnx.commit()
                ch = input("Do you want to Update Review Description - Press 1 for Yes ")
                if ch == '1':
                    new_desc = input("Enter New Review Description: ")
                    cur.callproc("update_review_description", (rev_id, new_desc))
                    cnx.commit()
                cur.execute("SELECT * FROM review WHERE restaurant_id = %s AND user_name = %s AND review_date = %s", (rest_id, uname, rev_date))
                print("Modified Review: ")
                print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        else:
            print("No Restaurant Selected!")
        cur.close()
    if choice == 21:
        uname = account_user
        cur = cnx.cursor()
        rest_name = input("Enter the Name of the Restaurant: ")
        rest_name = '%' + rest_name + '%'
        result = cur.execute("CALL display_restaurant_based_on_name(%s)", rest_name)
        if result != 0:
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
            rest_id = input("Enter the Restaurant ID for which you would like to see the Reviews: ")
            review_present = cur.execute("SELECT * FROM review WHERE restaurant_id = %s AND user_name = %s", (rest_id, uname))
            if review_present == 0:
                print("No Review Found!")
            else:
                print("Here are all the Reviews You Have Written for this Restaurant: ")
                cur.callproc("display_review_uname_restaurant", (uname, rest_id))
                print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
                rev_id = input("Pick the Review ID to be Deleted: ")
                rev_id_exists = cur.execute("SELECT * FROM review WHERE review_id = %s", rev_id)
                if rev_id_exists != 0:
                    cur.execute("CALL delete_review(%s)", rev_id)
                    cnx.commit()
                    print("Review Deleted!")
                else:
                    print("Invalid Review ID Selected!")
        else:
            print("No Restaurant Selected!")
        cur.close()
    if choice == 22:
        uname = account_user
        cur = cnx.cursor()
        rest_name = input("Enter the Name of the Restaurant: ")
        rest_name = '%' + rest_name + '%'
        result = cur.execute("CALL display_restaurant_based_on_name(%s)", rest_name)
        if result != 0:
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
            rest_id = input("Pick the Restaurant ID for which You Would like to make a Resrvation: ")
            reserve_date = input("Enter the Date and Time for the Reservation (eg: 2023-12-08 20:45): ")
            current_timestamp = datetime.now()
            current_timestamp = current_timestamp.strftime("%Y-%m-%d %H:%M:%S")
            if reserve_date > current_timestamp:
                res_exist = cur.execute("SELECT * FROM reservation WHERE user_name = %s AND restaurant_id = %s AND reservation_date = %s", (uname, rest_id, reserve_date))
                if res_exist == 0:
                    cur.callproc("create_reservation_tuple", (uname, rest_id, reserve_date))
                    cnx.commit()
                    print("Reservation Created!")
                else:
                    print("You Already Have An Upcoming Reservation Based on the Entered Restaurant, Date and Time!")
            else:
                print("You Can Only Make Reservations for the Future!")
        else:
            print("No Restaurant Selected!")
        cur.close()
    if choice == 23:
        uname = account_user
        cur = cnx.cursor()
        res = cur.execute("CALL display_reservation_uname_upcoming(%s)", uname)
        if res != 0:
            print("Here Are Your Upcoming Reservations: ")
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        else:
            print("No Upcoming Reservations!")
        cur.close()
    if choice == 24:
        uname = account_user
        cur = cnx.cursor()
        res = cur.execute("CALL display_reservation_uname_upcoming(%s)", uname)
        if res != 0:
            print("Here Are Your Upcoming Reservations: ")
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
            rest_id = input("Enter the Restaurant ID for which the Reservation Needs to be Resecheduled: ")
            old_time = input("Enter the Existing Date and Time of the Reservation for the Chosen Restaurant (eg: 2023-12-08 20:45): ")
            new_time = input("Enter the Existing Date and Time of the Reservation for the Chosen Restaurant (eg: 2023-12-08 20:45): ")
            current_timestamp = datetime.now()
            current_timestamp = current_timestamp.strftime("%Y-%m-%d %H:%M:%S")
            if new_time > current_timestamp and old_time > current_timestamp:
                cur.callproc("update_reservation_time", (uname, rest_id, old_time, new_time))
                cnx.commit()
                print("Chosen Reservation Rescheduled")
            else:
                print("Cannot Push a Reservation Back In Time!")
        else:
            print("No Upcoming Reservations!")
        cur.close()
    if choice == 25:
        uname = account_user
        cur = cnx.cursor()
        res = cur.execute("CALL display_reservation_uname_upcoming(%s)", uname)
        if res != 0:
            print("Here Are Your Upcoming Reservations: ")
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
            rest_id = input("Enter the Restaurant ID for which the Reservation Needs to be Deleted: ")
            old_time = input("Enter the Existing Date and Time of the Reservation for the Chosen Restaurant (eg: 2023-12-08 20:45): ")
            current_timestamp = datetime.now()
            current_timestamp = current_timestamp.strftime("%Y-%m-%d %H:%M:%S")
            if old_time > current_timestamp:
                cur.callproc("delete_reservation", (uname, rest_id, old_time))
                cnx.commit()
                print("Chosen Reservation Deleted!")
            else:
                print("Cannot Choose to Delete a Past Reservation")
        else:
            print("No Upcoming Reservations!")
        cur.close()
    if choice == 26:
        uname = account_user
        cur = cnx.cursor()
        current_timestamp = datetime.now()
        current_timestamp = current_timestamp.strftime("%Y-%m-%d %H:%M:%S")
        res = cur.execute("SELECT * FROM reservation WHERE user_name = %s AND reservation_date < %s", (uname, current_timestamp))
        if res != 0:
            print("Here Are Your Past Reservations: ")
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
        else:
            print("No Past Reservations Exist!")
        cur.close()


def show_menu_options():
    print("MENU OPTIONS")
    print(f"Choose Option - {1} to Search for a Restaurant")
    print(f"Choose Option - {2} to Display Menus for a Restaurant")
    print(f"Choose Option - {3} to Display Available Menu Items in a Restaurant's Menu")
    print(f"Choose Option - {4} to Display Available Menu Item Category Types Available at a Restaurant")
    print(f"Choose Option - {5} to Display Available Menu Items for a Specific Category Type in a Restaurant")
    print(f"Choose Option - {6} to Display Ingredients For A Specific Menu Item in a Restaurant")
    print(f"Choose Option - {7} to Display All Restaurants for a Specific Cuisine")
    print(f"Choose Option - {8} to Update First Name in Customer Account")
    print(f"Choose Option - {9} to Update Last Name in Customer Account")
    print(f"Choose Option - {10} to Delete Customer Account")
    print(f"Choose Option - {11} to Add a Credit Card to Customer Account")
    print(f"Choose Option - {12} to Display Credit Cards")
    print(f"Choose Option - {13} to Update a Credit Card")
    print(f"Choose Option - {14} to Delete a Credit Card")
    print(f"Choose Option - {15} to Place An Order")
    print(f"Choose Option - {16} to View All Orders")
    print(f"Choose Option - {17} Write a Review for a Restaurant")
    print(f"Choose Option - {18} Display All Your Reviews")
    print(f"Choose Option - {19} Display All Reviews for a Restaurant")
    print(f"Choose Option - {20} Update a Review You Have Written")
    print(f"Choose Option - {21} Delete a Review You Have Written")
    print(f"Choose Option - {22} Create a Reservation")
    print(f"Choose Option - {23} View Your Upcoming Reservations")
    print(f"Choose Option - {24} Reschedule an Upcoming Reservation")
    print(f"Choose Option - {25} Delete an Upcoming Reservation")
    print(f"Choose Option - {26} Display Past Reservations")
    user_choice = input("Select Option: ")
    option_list = list(range(1, 27))
    option_list_str = [str(element) for element in option_list]
    if user_choice in option_list_str:
        user_choice = int(user_choice)
        execute_menu_options(user_choice)
    else:
        print("Invalid Option Chosen!")


def check_customer_account_exists():
    cur = cnx.cursor()
    user_name = input("Enter Username: ")
    exist_flag = cur.execute("SELECT * FROM customer_account WHERE user_name = %s", user_name)
    if exist_flag == 0:
        print("Username does not Exist!")
        create_flag = input("Do you want to create an account - Press 1 to Create an Account: ")
        if create_flag == '1':
            first_name = input("Enter your first name: ")
            last_name = input("Enter your last name: ")
            user_name = input("Create a Username: ")
            exist_flag = cur.execute("SELECT * FROM customer_account WHERE user_name = %s", user_name)
            while exist_flag == 1:
                exist_flag = input("Username Already Exists! Try a Different one: ")
                exist_flag = cur.execute("SELECT * FROM customer_account WHERE user_name = %s", user_name)
            cur.callproc("create_customer_account", (first_name, last_name, user_name))
            cnx.commit()
            print("Account Created!")
            cur.execute("CALL display_customer_account_uname(%s)", user_name)
            print(pd.DataFrame(cur.fetchall()).to_string(index = False, col_space=10))
            return user_name, 1
        else:
            print("Goodbye!")
            return 0, 0
    else:
        print("Welcome!")
        return user_name, 1



account_user, account_exists = check_customer_account_exists()

while account_exists == 1:
    continue_application  = 0
    show_menu_options()
    if account_exists != 0:
        continue_application = input("Do you wish to continue using the application - Press 1 for Yes ")
    if continue_application == '1':
        continue
    else:
        break