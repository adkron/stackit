defmodule StackitTest do
  use ExUnit.Case
  doctest Stackit

  test "an empty stack is empty" do
    assert Stackit.empty?(%Stackit{})
  end

  test "adding an element to a stack increases its size by one" do
    subject = %Stackit{}
    subject = Stackit.push(subject, :element)
    refute Stackit.empty?(subject)
  end

  test "peeking a stack with one element returns that element" do
    subject = %Stackit{}
    subject = Stackit.push(subject, :element)
    assert Stackit.peek(subject) == :element
  end

  test "popping a stack with one element returns that element" do
    subject = %Stackit{}
    subject = Stackit.push(subject, :element)
    {_, expected_element} = Stackit.pop(subject)
    assert expected_element == :element
  end

  test "popping a stack with one element returns an empty stack" do
    subject = %Stackit{}
    subject = Stackit.push(subject, :element)
    {empty_stack, _} = Stackit.pop(subject)
    assert Stackit.empty?(empty_stack)
  end

  test "popping a stack that has two elements returns the second element pushed" do
    subject = %Stackit{}
    subject = Stackit.push(subject, :first)
    subject = Stackit.push(subject, :second)
    {_, expected_element} = Stackit.pop(subject)
    assert expected_element == :second
  end

  test "popping twice a stack that has two elements returns the first element pushed" do
    {subject, _} = %Stackit{}
              |> Stackit.push(:first)
              |> Stackit.push(:second)
              |> Stackit.pop
    {_, expected_element} = Stackit.pop(subject)
    assert expected_element == :first
  end
end
