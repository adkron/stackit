defmodule Stackit do
  defmodule Node do
    defstruct value: nil, next: nil
  end
  defstruct head: nil

  def empty?(%Stackit{head: nil}), do: true
  def empty?(%Stackit{head: head}), do: false

  def push(%Stackit{head: nil}, value) do
    n = %Node{value: value}
    %Stackit{head: n}
  end

  def push(%Stackit{head: head}, value) do
    n = %Node{value: value, next: head}
    %Stackit{head: n}
  end

  def peek(%Stackit{head: head}), do: head.value

  def pop(%Stackit{head: %Node{next: nil, value: value}}) do
    {%Stackit{head: nil}, value}
  end

  def pop(%Stackit{head: head}) do
    {%Stackit{head: head.next}, head.value}
  end
end
