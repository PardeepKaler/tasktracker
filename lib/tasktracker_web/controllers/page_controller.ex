defmodule TasktrackerWeb.PageController do
  use TasktrackerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def feed(conn, _params) do
      posts = Tasktracker.TaskTrack.list_tasks()
      changeset = Tasktracker.TaskTrack.change_task(%Tasktracker.TaskTrack.Task{})
      render conn, "feed.html", posts: posts, changeset: changeset
    end

end
