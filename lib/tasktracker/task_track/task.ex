defmodule Tasktracker.TaskTrack.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.TaskTrack.Task


  schema "tasks" do
    field :assigned, :string
    field :completed, :boolean, default: false
    field :description, :string
    field :timeSpent, :decimal
    field :title, :string

    belongs_to :user, Tasktracker.Accounts.User
    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :description, :assigned, :timeSpent, :completed, :user_id])
    |> validate_required([:title, :description, :assigned, :timeSpent, :completed, :user_id])
  end
end
