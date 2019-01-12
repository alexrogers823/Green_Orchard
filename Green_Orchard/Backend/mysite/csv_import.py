import csv, os, shutil
from pathlib import Path
from expenses.models import Expenses, Banks, Categories
from django.contrib.auth.models import User
from django.utils.dateparse import parse_date
from django.core.exceptions import ObjectDoesNotExist


def upload_files(banks, user_pk):
    home = Path.home()
    files_list = retrieve_files(home, banks)
    move_files(home, files_list)

    database_list = read_files(home, files_list)
    add_to_database(database_list, username)

    return True


def retrieve_files(home, banks):
    # Calls to downloads folder where csv file originally is
    path = Path(str(home)+'/Downloads/')
    # path = str(Path.home()) + '/Downloads'

    files_to_move = []

    # Temporary solution
    # Finds specific csv files based on bank
    bank_matches = {
        'Capital One': ['*transaction_download*'],
        'Wells Fargo': ['*CreditCard*', '*Checking*'],
        'Discover': ['*Discover*'],
    }

    # Loops through all banks indicated
    for bank in banks:
        # this loops through list values in dict
        for query in bank_matches[bank]:
            # this adds csv files to our list

            queried_files = [( bank.replace(' ', '_'), str(file).replace(str(path), '') ) for file in path.glob(query)]
            files_to_move.extend(queried_files)

    # returns list of tuples to unpack in move_files
    return files_to_move # [(Wells_Fargo, 'file.csv'), (Discover, 'file.csv')]


def move_files(home, files_list):
    path_from = str(home) + '/Downloads/'

    # For first time use of app:
    if not os.path.isdir(str(home)+'/.Green_Orchard_Banks/'):
        os.mkdir(str(home)+'/.Green_Orchard_Banks/')

    path_to = str(home) + '/.Green_Orchard_Banks/{}'

    for bank, file in files_list:
        bank_folder = path_to.format(bank)
        if not os.path.isdir(bank_folder):
            os.mkdir(bank_folder)

        # move files into appropriate folder
        shutil.move(path_from + file, bank_folder)


def read_files(home, files_list):
    file_path = str(home) + '/.Green_Orchard_Banks/{}/{}'
    database_list = []
    for bank, file in files_list:
        # Getting contents of csv file, line by line
        with open(file_path.format(bank, file)) as csvfile:
            reader = csv.reader(csvfile, delimiter=',')

            # Get each line's content in variable to compare and add
            current_file_contents = [row for row in reader]

            # # Adding content from each line into the database
            # for row in reader:
            #     print(row)

        database_list.extend(check_for_duplicates(bank, file_path.format(bank, ''), current_file_contents))

    return database_list


def check_for_duplicates(bank, bank_folder, current_file_contents):
    # return list if file is the first file in folder
    bank_files = [file.name for file in os.scandir(bank_folder) if os.path.isfile(file)]
    if len(bank_files) < 2:
        for content in current_file_contents:
            content.append(bank) # For bank id later
        return current_file_contents

    # will compare current file with last added file
    with open(bank_folder+bank_files[-2]) as previous_csv:
        reader = csv.reader(previous_csv, delimiter=',')
        previous_file_contents = [row for row in reader]

    # First line of current file
    start_index = 0 if bank == 'Wells_Fargo' else 1

    # Checking for where duplicates start in previous file
    for prev_expense in previous_file_contents:
        if prev_expense == current_file_contents[start_index]:
            break

    # Line of previous file where duplicates start
    previous_file_index = previous_file_contents.index(prev_expense)

    # Checking for where duplicates end in current file
    for i in range(start_index, len(current_file_contents)):
        if previous_file_contents[previous_file_index] != current_file_contents[i]:
            break
        current_file_contents[i].append(bank) # For bank id later
        try:
            previous_file_index += 1
        except IndexError:
            break # When lines for previous file run out

    if i + 1 != len(current_file_contents):
        # if there are unique values to be added to database
        return current_file_contents[i:]
    else:
        # if all contents are duplicates
        return []


def add_to_database(database_list, user_pk):
    # print(database_list)
    # Look into the bulk_create option in django, but have to do it right

    # will use ORM queries to add to postgresql
    for expense in database_list:
        if expense[0] == 'Trans. Date':
            continue

        bank_name = expense[-1]
        date, month, year = arrange_date(expense[0])

        if bank_name == 'Discover': # definitely changing this
            name = expense[2]
            amount = float(expense[3])
            category = expense[4]

        category_name = category if category else None
        check_for_database_existence(bank_name, category_name)


        bank_object = Banks.objects.get(name=bank_name)
        try:
            category_object = Category.object.get(name=category_name)
        except ObjectDoesNotExist:
            category_object = {'pk': 0}




        # will add each individual expense
        e = Expenses(
            name=name,
            amount=amount,
            month=month,
            year=year,
            date_posted=date,
            category=category_object.pk,
            bank_id=bank_object.pk,
            user=User.objects.get(pk=user_pk)
            )
        e.save()
        # User.expenses_set.create(name=name, amount=amount, date_posted=date)



# === HELPER FUNCTIONS ===

def arrange_date(date_original):
    date_split = date_original.split('/')
    # tuple reassignment to re-order into date format
    date_split[0], date_split[1], date_split[2] = date_split[2], date_split[0], date_split[1]

    # setting month and year as strings for database
    month = date_split[1] if len(date_split[1]) == 2 else '0'+date_split[1]
    year = '20' + date_split[2]
    return '-'.join(date_split), month, year


def check_for_database_existence(bank_name, category_name):
    # Check if bank is already in database
    if not Banks.filter(name=bank_name).exists():
        new_bank = Banks(name=bank_name)
        new_bank.save()

    if category_name:
        # Check if category is already in database
        if not Categories.filter(name=category_name).exists():
            new_category = Categories(name=category_name)
            new_category.save()
