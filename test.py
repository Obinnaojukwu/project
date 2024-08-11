enter = input("SIGN up /n click ENTER to continue  :")
if enter == "":
    email = input("Create email Address :")
    pas = input("Create password :")
    print()
    print("You have successfully signed up !")
    def login(email, pas):
        detail_E = input("Enter email address :")
        detail_P = input("Enter password :")
        while detail_E != email or detail_P != pas:
            if detail_E != email:
                print("invalid email !")
                detail_E = input("Enter email address :")
            elif detail_P != pas:
                print("incorrect password !")
                detail_P = input("Enter password :")
        print("Welcome " + email + " to your new account")
    login(email,pas)