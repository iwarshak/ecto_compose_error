defmodule HelloPhoenix.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :string
      add :likes, :integer
      add :author_id, references(:authors)

      timestamps
    end
    create index(:posts, [:author_id])

  end
end
