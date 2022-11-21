row_1 = ["_","_","_","_","_","_","_"]
row_2 = ["_","_","_","_","_","_","_"]
row_3 = ["_","_","_","_","_","_","_"]
row_4 = ["_","_","_","_","_","_","_"]
row_5 = ["_","_","_","_","_","_","_"]
row_6 = ["_","_","_","_","_","_","_"]
row_7 = ["_","_","_","_","_","_","_"]

rows = [row_1, row_2, row_3, row_4, row_5, row_6, row_7]

def print_board(row_array)
  puts ""
  headers = "ABCDEFG"
  split_headers = headers.split("")
  joined_headers = split_headers.join(" ")
  puts joined_headers
  row_array.each do |row|
    puts row.join(" ")
  end
  puts ""
end

def choose_column
  puts "Choose your column"
  column = gets.chomp
  column = column.upcase
  while column =~ /[^A-G]/
    puts "Choose your column"
    column = gets.chomp
    column = column.upcase    
  end
  return column
end

def check_diagonal(start, rows)
   diagonal_array = []    
  (start..6).collect { |i| diagonal_array.push(rows[i][i-start]) }
  p diagonal_array
  diagonal_array.each_cons(4) do |item|
    if item.all?("X")
      puts "4 in a row!"
    end  
  end
end

def check_for_win(rows)
  
  rows.each do |row|
    row.each_cons(4) do |item|
      if item.all?("X")
        puts "4 in a row!"
      end
    end
  end
  
  
  rows_transposed = rows.transpose
  rows_transposed.each do |row|
    row.each_cons(4) do |item|
      if item.all?("X")
        puts "4 in a row!"
      end
    end      
  end 

  check_diagonal(0, rows)
  check_diagonal(1, rows)
  check_diagonal(2, rows)
  check_diagonal(3, rows) 
end

def add_piece(rows, column)
  case column
  when "A" 
    rows.reverse_each do |row|      
      if row[0] == "_"
        row[0] = "X"  
        check_for_win(rows)
        break
      end    
    end  
  when "B"
    rows.reverse_each do |row|
      if row[1] == "_"
        row[1] = "X"
        check_for_win(rows)
        break
      end    
    end  
  when "C"
    rows.reverse_each do |row|
      if row[2] == "_"
        row[2] = "X"
        check_for_win(rows)
        break
      end    
    end  
  when "D"
    rows.reverse_each do |row|
      if row[3] == "_"
        row[3] = "X"
        check_for_win(rows)
        break
      end
    end  
  when "E"
    rows.reverse_each do |row|
      if row[4] == "_"
        row[4] = "X"
        check_for_win(rows)
        break
      end    
    end  
  when "F"
    rows.reverse_each do |row|
      if row[5] == "_"
        row[5] = "X"
        check_for_win(rows)
        break
      end    
    end  
  when "G"
    rows.reverse_each do |row|
      if row[6] == "_"
        row[6] = "X"
        check_for_win(rows)
        break
      end    
    end  
  end  
end

12.times do

  print_board(rows)
  add_piece(rows, choose_column)
end