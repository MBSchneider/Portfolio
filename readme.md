# Portfolio Application

By [Matt Schneider](github.com/MBSchneider)

**Portfolio Application**
A portfolio to show off my projects.  See it at [http://www.matt-schneider.com/](http://www.matt-schneider.com/)

![homepage](https://raw.github.com/MBSchneider/portfolio/master/app/assets/images/PortfolioScreenShot.png)

## Functionality
In addition to displaying my contact information, etc., my portfolio should do the following:

### Authentication / Authorization
Authentication has been implemented using the Devise gem, and the Omniauth gem allows login through twitter.  Note that links to 'log in', 'log out', etc. do not show on the page as I am the only admin that would need to log in.

Authorization is implemented using the pundit gem.  An admin (me) has access to create, edit, and destroy items, while a visitor would only be able to view content.

### Projects
Shows a listing of projects I have worked on.  Each project will have an associated picture, a description, a string with technologies used, and multiple comments.  Projects can be created or updated by an admin, and can be viewed by everyone.

### Posts
Blog posts are similar to projects, in that they can be created and updated by an admin (me), and can be viewed by everyone.  Users can add comments to blog posts as well.


## Recent Updates:

12/11/2013: Added simple form, draper, time format to projects to clean up project views a bit.

## Authors

[Matt Schneider](github.com/MBSchneider)
