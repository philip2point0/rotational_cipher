defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """

  @lower  ?a..?z 
  @upper  ?A..?Z

  
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    to_charlist(text) |> Enum.map(fn x -> new_key(x,shift) end) |> List.to_string
  end
  
  # lower case letters 
  def new_key(original_key, shift) when original_key in @lower do
    shift=rem((shift), Enum.count(@lower))
    _first..last = @lower
    if ((original_key + shift) > last) do
      original_key + shift-Enum.count(@lower)
    else 
       original_key+shift
    end
    
    
  end
  # capital letters
  def new_key(original_key, shift) when original_key in @upper do
    shift=rem((shift), Enum.count(@upper))
    _first..last = @upper
    newkey = original_key + shift
    if (newkey > last) do
     newkey-Enum.count(@upper)
    else
     newkey
    end
  end
  # punctuation & numbers
  def new_key(original_key, _shift) when original_key not in @lower and original_key not in @upper do
    original_key
  end

  
end

