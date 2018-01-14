# DreamBlog - A Blogger's Paradise

### This is a blogging site where a user can either signup by providing details or by using facebook or goolge to allow to fetch information. A user gets to see articles that are based on his interests. A user can also write articles. A user can follow other users and read his posts.

Note: Import the database dump (included in the directory `database_dump`). Facebook and Google Login require secret keys, these are not included in the repository.

## Features

1.This site uses frontend login for Facebook using the javascript sdk then it stores the user variables using ajax in the `users` tables (different from ordinary `Users` table).
2. The site uses php sdk for the Google login. Then stores data in 'users' table.
3. The site uses a contenteditable div for the WYSIWYG editor. You can straightway copy/paste content from other sources into the editor and it will retain all the text formattings even images. You cannot use html tags like <B> for bold. This has been done on purpose so that the user gets what he types. 
4. You can chat both in groups and one-to-one.



## TODO:

1. Change all sql queries to PDO or use prepared statements for security and efficiency
2. Storing data put in the editor (especially alongwith images and videos) with text stored in database (alongwith the formatting) and the pictures and videos in respective folders. Retrieving information (especially putting the images back in between proper text) is also pending. Currently the feeds are populated from the text stored in database and all formatting is ignored using htmlentities so that everything is just paragraphs. 
3. All pages after checking the login_user should also check whether the oauth_provider is set in session variable before redirecting to index.php (if not logged in any of these ways). All the sites have to populate data accordingly.
4. A user can follow other users. Implemented in database but not in site or profile.
5. Improve the chatting interface. And provide users to open a new chat.
