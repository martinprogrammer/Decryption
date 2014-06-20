require 'socket'

def reverse(the_word)
	the_word.to_s.downcase.reverse
end

#puts reverse('Martin')

def advance_by_one(the_word)

	char_array = []

	the_word.split('').to_a.each do |char| 
			
		unless char.downcase.sum==122 
			char_array.push((char.downcase.sum+1).chr)
		else
			char_array.push(97.chr)
		end
	end

	return char_array.to_s

end


def even_odd(the_word)

	char_array=[]

	the_word.split('').each_with_index{|let, ind| char_array.push(let) if ind%2 == 0}
	the_word.split('').each_with_index{|let, ind| char_array.push(let) if ind%2 != 0}
	
	return char_array.to_s
end

def match_sentance?(the_sentance)

	the_word_array = the_sentance.split(" ")

	dictionary = ['and', 'the', 'to', 'of']

	the_word_array.each do |word| 
		dictionary.each{|dict| return true if dict.to_s == word.to_s}
	end

	return false

end


def the_feed()
	server = TCPSocket.open("10.112.145.210", 8000)
		
		the_sentance = []

  		while line = server.gets
    		puts("Ruby")
    		puts("MartinWilliam")
    		yield line.chop.to_s

  		end
  		s.close

  		
  
  end



  def decrypt_message()
  	the_feed() do |sentance|
  		#puts sentance

  	reverse_array = []
  	advance_by_one_array =[]
  	even_odd_array=[]

  	sentance.split(" ").each do |word|
  		reverse_array.push(reverse(word))
  		advance_by_one_array.push(advance_by_one(word))
  		even_odd_array.push(even_odd(word))
  	end

  	puts sentance
  	puts reverse_array.inspect
  	puts advance_by_one_array.inspect
  	puts even_odd_array.inspect
  end
end


# puts advance_by_one('zsssdfs').inspect
puts match_sentance?('a cat is in a stable')
decrypt_message()

#puts even_odd('house')
