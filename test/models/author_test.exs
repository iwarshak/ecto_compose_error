defmodule HelloPhoenix.AuthorTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.Author
  alias HelloPhoenix.Comment
  alias HelloPhoenix.Repo
  alias HelloPhoenix.Post

  # test "composing works" do
  #
  #   author = %Author{name: "ian"} |> Repo.insert!
  #   post = %Post{title: "hi", body: "a post", likes: 4, author_id: author.id} |> Repo.insert!
  #   comment = %Comment{title: "a comment", body: "hi", likes: 10, post_id: post.id, author_id: author.id} |> Repo.insert!
  #   assert (Author |> Author.popular_comment |> Author.for_post(post)  |> Repo.all) == [author]
  #
  #   # just switching the order around of the queries
  #
  #   assert (Author |> Author.for_post(post) |> Author.popular_comment |> Repo.all) == [author]
  # end
end
