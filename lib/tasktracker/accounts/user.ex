defmodule Tasktracker.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasktracker.Accounts.User


  schema "users" do
    field :email, :string
    field :name, :string
    has_many :task, Tasktracker.TaskTrack.Task, on_delete: :nilify_all, foreign_key: :user_id
    has_many :task1, Tasktracker.TaskTrack.Task, on_delete: :nilify_all, foreign_key: :assigned
    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :name])
    |> validate_required([:email, :name])
    |> unique_constraint(:email)
  end
end
