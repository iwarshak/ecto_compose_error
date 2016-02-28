defmodule HelloPhoenix.Author do
  use HelloPhoenix.Web, :model
  import Ecto.Query

  schema "authors" do
    field :name, :string
    has_many :posts, HelloPhoenix.Post
    has_many :comments, HelloPhoenix.Comment
    timestamps
  end


  def for_post(query, post) do
    query
    |> join(:inner, [author], p in assoc(author, :posts))
    |> where([author, posts],  posts.id == ^post.id)
  end

  def popular_comment(query) do
    query
    |> join(:inner, [author], p in assoc(author, :comments))
    |> where([author, comments],  comments.likes == 10)
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
