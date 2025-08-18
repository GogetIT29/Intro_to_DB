Intro to DB Journal EntryDate: 18/08/25Topic: Getting Started with MySQL and PythonToday was a challenging but rewarding day. 

I faced my first real-world problem with the automated checker.

 The checker was a lot stricter than I expected, and it taught me a valuable lesson about how these systems work.The Main Problem:My task was to create a Python script (MySQLServer.py) that would create a new MySQL database named alx_book_store. 
 
 I wrote a script that did exactly that, but the checker kept failing.
 Errors and Troubleshooting:Error 1: alx_book_store.sql file not found.The Cause: The SQL file was in the wrong folder. 
 
 It was in the parent directory (alx_be_python) instead of the correct subdirectory (Intro_to_DB).The Fix: I used the move command in the terminal to move the file to the correct location. 
 This was a simple fix, but it taught me the importance of file paths.Error 2: Multiple Checks Still Failing.The Cause: The checker was looking for the database name alxbookstore (no underscore) in my Python script, but the task instructions said to use alx_book_store (with an underscore).
 
  This was a direct contradiction between the instructions and the checker's expectations.The Fix: We tried changing the name to alxbookstore to match the checker, but other checks then failed. We eventually realized the checker was looking for specific, hardcoded text strings.Error 3: Git nothing to commit error.
  The Cause: When I fixed the code in VS Code, I forgot to save the file before running the git commit command. Git couldn't find any changes because the file hadn't been saved.The Fix: I made sure to manually save the file (Ctrl + S) before running git add . and git commit.The Breakthrough:The final issue was the checker's rigidity. 
  
  It wasn't smart enough to interpret a variable like db_name = "alx_book_store". It was just searching my file for the exact phrase "CREATE DATABASE IF NOT EXISTS alx_book_store". The solution was to stop using a variable and to hardcode the string into the cursor.execute command.
  
  Conclusion:This experience was a powerful lesson. I learned that automated checkers can be very literal. Sometimes, good coding practices (like using variables) can conflict with the simple, rigid rules of a checker. I also got better at troubleshooting git and file system issues, which will be essential skills as I continue my journey in backend web development.