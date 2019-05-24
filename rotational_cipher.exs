defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """

  @alphabet  %{ 1=>"a",
  2=>"b",
  3=>"c",
  4=>"d",
  5=>"e",
  6=>"f",
  7=>"g",
  8=>"h",
  9=>"i",
  10=>"j",
  11=>"k",
  12=>"l",
  13=>"m",
  14=>"n",
  15=>"o",
  16=>"p",
  17=>"q",
  18=>"r",
  19=>"s",
  20=>"t",
  21=>"u",
  22=>"v",
  23=>"w",
  24=>"x",
  25=>"y",
  26=>"z",
  27=>"A",
  28=>"B",
  29=>"C",
  30=>"D",
  31=>"E",
  32=>"F",
  33=>"G",
  34=>"H",
  35=>"I",
  36=>"J",
  37=>"K",
  38=>"L",
  39=>"M",
  40=>"N",
  41=>"O",
  42=>"P",
  43=>"Q",
  44=>"R",
  45=>"S",
  46=>"T",
  47=>"U",
  48=>"V",
  49=>"W",
  50=>"X",
  51=>"Y",
  52=>"Z",
  53=>" ",
  54=>".",
  55=>"!",
  56=>"?",
  57=>",",
  58=>"'",
  60=>"0",
  61=>"1",
  62=>"2",
  63=>"3",
  64=>"4",
  65=>"5",
  66=>"6",
  67=>"7",
  68=>"8",
  69=>"9",
  "a"=>1,
  "b"=>2,
  "c"=>3,
  "d"=>4,
  "e"=>5,
  "f"=>6,
  "g"=>7,
  "h"=>8,
  "i"=>9,
  "j"=>10,
  "k"=>11,
  "l"=>12,
  "m"=>13,
  "n"=>14,
  "o"=>15,
  "p"=>16,
  "q"=>17,
  "r"=>18,
  "s"=>19,
  "t"=>20,
  "u"=>21,
  "v"=>22,
  "w"=>23,
  "x"=>24,
  "y"=>25,
  "z"=>26,
  "A"=>27,
  "B"=>28,
  "C"=>29,
  "D"=>30,
  "E"=>31,
  "F"=>32,
  "G"=>33,
  "H"=>34,
  "I"=>35,
  "J"=>36,
  "K"=>37,
  "L"=>38,
  "M"=>39,
  "N"=>40,
  "O"=>41,
  "P"=>42,
  "Q"=>43,
  "R"=>44,
  "S"=>45,
  "T"=>46,
  "U"=>47,
  "V"=>48,
  "W"=>49,
  "X"=>50,
  "Y"=>51,
  "Z"=>52,
  " "=>53,
  "."=>54,
  "!"=>55,
  "?"=>56,
  ","=>57,
  "'"=>58,
  "0"=>60,
  "1"=>61,
  "2"=>62,
  "3"=>63,
  "4"=>64,
  "5"=>65,
  "6"=>66,
  "7"=>67,
  "8"=>68,
  "9"=>69}
  
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    #temp = String.codepoints(text)
    #IO.puts text
    
    numberlist = string_to_list(text) |> Enum.map(fn x -> letter_to_number(x) end) 
    #IO.puts number
    newkeys = Enum.map(numberlist, fn x ->  new_key(x,shift) end)
    
    letterlist=Enum.map(newkeys, fn x -> number_to_letter(x) end)
    List.to_string(letterlist)

    #key = new_key(number, shift)
    #number_to_letter(key)
    # String.codepoints(text) |> Enum.map(fn x -> letter_to_number(x) end) |> new_key(shift) |> number_to_letter
    
    #index = letter_to_number(h)
    #IO.puts index
    #newindex = index + shift
    #IO.puts newindex
    #newtext = number_to_letter(newindex)
  # step through the letters in text and return the current numerical value
  end

  # convert graphemes into a list of text
  def string_to_list(""), do: []
  
  #def string_to_list(x), do: x where String.length(x)=1
  def string_to_list(textstring)   do
  
  if (String.length(textstring) <2) do
    [textstring]
    
    else 
    String.split(textstring, "", include_captures: false, trim: true)  #do this for the entire length of the string, building a list
    end
    

  end
  # retrieve the key for the given text
  def letter_to_number(text) do
    index = @alphabet[text]
    if (index == nil ) do
     text
    else
      index
    end
  end

  # retrieve the letter in text and for the supplied key value 
  def number_to_letter(key) when key>0 do
    text = @alphabet[key]
  end
  def number_to_letter(key) when key<0 do
    IO.puts "invalid key passed to number_to_letter"
    key
  end

  
  # lower case letters 
  def new_key(original_key, shift) when original_key < 27 do
    shift=rem((shift), 26)
    newkey = original_key
    if ((original_key + shift) > 26) do
      newkey = (original_key + shift-26)
    else 
       newkey = (original_key+shift)
    end
    
    
  end
  # capital letters
  def new_key(original_key, shift) when original_key < 53 do
    shift=rem((shift), 26)
    newkey = original_key + shift
    if (newkey > 52) do
     newkey=newkey-26
    else
     newkey
    end
  end
  # punctuation
  def new_key(original_key, shift) when original_key > 52 do
    newkey=original_key
  end

  #def walknumber([]) do
   # []
    #end
  def walknumber([head|[]]) do
    head
  end
  def walknumber([head|tail]) do
    IO.puts head
    
    walknumber(tail)
    head
    
  end

  
end

