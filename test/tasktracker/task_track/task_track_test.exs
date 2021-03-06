defmodule Tasktracker.TaskTrackTest do
  use Tasktracker.DataCase

  alias Tasktracker.TaskTrack

  describe "tasks" do
    alias Tasktracker.TaskTrack.Task

    @valid_attrs %{assigned: "some assigned", completed: true, description: "some description", timeSpent: "120.5", title: "some title"}
    @update_attrs %{assigned: "some updated assigned", completed: false, description: "some updated description", timeSpent: "456.7", title: "some updated title"}
    @invalid_attrs %{assigned: nil, completed: nil, description: nil, timeSpent: nil, title: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TaskTrack.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert TaskTrack.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert TaskTrack.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = TaskTrack.create_task(@valid_attrs)
      assert task.assigned == "some assigned"
      assert task.completed == true
      assert task.description == "some description"
      assert task.timeSpent == Decimal.new("120.5")
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TaskTrack.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = TaskTrack.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.assigned == "some updated assigned"
      assert task.completed == false
      assert task.description == "some updated description"
      assert task.timeSpent == Decimal.new("456.7")
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = TaskTrack.update_task(task, @invalid_attrs)
      assert task == TaskTrack.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = TaskTrack.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> TaskTrack.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = TaskTrack.change_task(task)
    end
  end
end
