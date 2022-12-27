import os
import shutil
source_dir = r"C:\\project1\\TST\\tg-\\src\\tst\\we\\cur\\tst"
destination_dir = r"list"
list = ["bitbucket-01","Git-01"]
for items in list:
    path = os.path.join("C:\\project1\\TST\\tg-\\src\\tst\\we\\cur\\tst"", "test.yml" )
    shutil.copytree("C:\\project1\\TST\\tg-\\src\\tst\\we\\cur\\tst","list",dirs_exist_ok=True)
