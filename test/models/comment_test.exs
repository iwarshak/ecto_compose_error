defmodule HelloPhoenix.CommentTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.Comment
  alias HelloPhoenix.Repo
  alias HelloPhoenix.Author
  alias HelloPhoenix.Post

  test "composing queries works one way" do
    author = %Author{name: "ian"} |> Repo.insert!
    post = %Post{title: "hi", body: "a post", likes: 4, author_id: author.id} |> Repo.insert!
    comment = %Comment{title: "a comment", body: "hi", likes: 10, post_id: post.id, author_id: author.id} |> Repo.insert!
    assert (Comment |> Comment.with_popular_post |> Comment.for_author(author) |> Repo.all) == [comment] # works
  end

  test "composing fails when switching order" do
    author = %Author{name: "ian"} |> Repo.insert!
    post = %Post{title: "hi", body: "a post", likes: 4, author_id: author.id} |> Repo.insert!
    comment = %Comment{title: "a comment", body: "hi", likes: 10, post_id: post.id, author_id: author.id} |> Repo.insert!
    assert (Comment |> Comment.for_author(author) |> Comment.with_popular_post() |> Repo.all) == [comment] # fails
  end
  
  test "composing works when using keyword syntax" do
    author = %Author{name: "ian"} |> Repo.insert!
    post = %Post{title: "hi", body: "a post", likes: 4, author_id: author.id} |> Repo.insert!
    comment = %Comment{title: "a comment", body: "hi", likes: 10, post_id: post.id, author_id: author.id} |> Repo.insert!
    assert (Comment |> Comment.for_author(author) |> Comment.with_popular_post2() |> Repo.all) == [comment] # fails
  end 
end
