# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HelloPhoenix.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias HelloPhoenix.Repo
alias HelloPhoenix.Author
alias HelloPhoenix.Post
alias HelloPhoenix.Comment

author = %Author{name: "ian"} |> Repo.insert!
post = %Post{title: "hi", body: "a post", likes: 4, author_id: author.id} |> Repo.insert!
comment = %Comment{title: "a comment", body: "hi", likes: 10, post_id: post.id, author_id: author.id} |> Repo.insert!
