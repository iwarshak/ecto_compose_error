defmodule HelloPhoenix.Comment do
  use HelloPhoenix.Web, :model
  import Ecto.Query

  schema "comments" do
    field :title, :string
    field :body, :string
    field :likes, :integer
    belongs_to :author, HelloPhoenix.Author
    belongs_to :post, HelloPhoenix.Post

    timestamps
  end

  @required_fields ~w(title body likes)
  @optional_fields ~w()

  def with_popular_post(query) do
    query
    |> join(:inner, [comment], p in assoc(comment, :post))
    |> where([comment, p],  p.likes == 4)
  end
  
  def with_popular_post2(query) do
    from c in query, join: p in assoc(c, :post), where: p.likes == 4
  end

  def for_author(query, author) do
    query
    |> join(:inner, [comment], a in assoc(comment, :author))
    |> where([comment, a],  a.id == ^author.id)
  end

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
