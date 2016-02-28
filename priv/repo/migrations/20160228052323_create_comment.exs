defmodule HelloPhoenix.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :title, :string
      add :body, :string
      add :likes, :integer
      add :author_id, references(:authors)
      add :post_id, references(:posts)

      timestamps
    end
    create index(:comments, [:author_id])

  end
end
