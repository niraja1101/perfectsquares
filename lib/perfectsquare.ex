import :math
defmodule Perfectsquare do

   """

  The module main is responsible for parsing the input valus of n and k
  from the command line and spawning actors based on the input size

  """
  def main do
      newlist=Enum.map(System.argv, fn x -> String.to_integer(x) end)
      n = Enum.at(newlist,0)
      k = Enum.at(newlist,1)


      if is_integer(n)==false do
        IO.puts "Retry with a integer value for N"
        exit(:shutdown)
      end
      if is_integer(k)==false do
        IO.puts "Retry with a integer value for k"
        exit(:shutdown)
      end


      numact=div(n,500)+1
      ppid = self()

 """

  This part will divide the problem into sub problems for individual actors

  """

      range = div(n,numact)
      for b <- 0..(numact-1) do
        if b==(numact-1) do
        spawn(Perfectsquare,:name,[range*b+1,n,k,ppid])
      else
        spawn(Perfectsquare,:name,[range*b+1,range*(b+1),k,ppid])
      end
    end
    recv(numact)
  end

 """

  The recieve function will be called as many times as the number of spawned actor
  and it will ensure that the main process will not exit until all the spawned actors
  have not sent their termination message

  """

  def recv(numact) when numact==1 do
   receive do
         {:ok}->nil
   end
  end

  def recv(numact) do
   receive do
         {:ok}->nil
   end
  recv(numact-1)
  end
"""

This block only checks if the assigned input sum of square of a sequence
is a perfect square

"""
  def name(start,finish,k,ppid) do
      numloop = finish-start+1
      ifsquare(start-1,start+k-1,numloop,ppid)
  end

"""

This block calculates all the math behind the problem and outputs if we find
the perfect square and on the last input will send the message to the main process
that this actor is exiting

"""
    def ifsquare(a,b,numloop,ppid) when numloop == 1 do
        sa = div(a*(a+1)*(2*a+1),6)
        sb = div(b*(b+1)*(2*b+1),6)
        sq_sum = :math.sqrt(sb-sa)
        diff = sq_sum - floor(sq_sum)
        if diff==0 do
          IO.puts "#{a+1}"
        end
        send(ppid,{:ok})
    end


    def ifsquare(a,b,numloop,ppid)  do
      sa = div(a*(a+1)*(2*a+1),6)
      sb = div(b*(b+1)*(2*b+1),6)
      sq_sum = :math.sqrt(sb-sa)
      diff = sq_sum - floor(sq_sum)
      if diff==0 do
        IO.puts "#{a+1}"
      end
      ifsquare(a+1,b+1,numloop-1,ppid)
  end
  end


