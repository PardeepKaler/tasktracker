# Tasktracker

Assumptions:

1) In the Assigned column of the Tasks, the email of the assignee is listed as two users having same name could cause a confusion.
2) If a User is deleted, then the Assisned column in tasks shows(Add new Assignee) if the deleted user was assigned that task.
3) If a User is deleted, then the User column for all the tasks created by that user displays "user deleted". But the tasks       remain there.
4) If the user who is assigned some task is deleted , then the assignee for that task can be changed by clicking the edit button.
5) If a user changes his email id, then the email id in assigned section of tasks table is automatically changed.(I have added a foreign key constraint on assigned as well)


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
