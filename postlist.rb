#!/usr/bin/ruby
# encoding: utf-8

f_name = Dir.glob("*.txt")

puts "File name : ","#{f_name}"

posting_list = Hash.new()

for i in f_name
    print i,": \n"
    txt = File.open(i)
    text = txt.read().downcase.gsub(/[^a-z\s]/i, '').split(' ')
    text.uniq!

    puts "#{text}"

    for j in text
        if posting_list.has_key?(j)
            posting_list [j] << i
        else
            posting_list [j] = [i]
        end
    end
    print "\n"
end

target = File.open("output.txt", 'w')

posting_list.each do |k, v|
    target.write("#{k} =>")
    v.each do |w|
        target.write(" #{w}")
    end
    target.write("\n")
end

target.close()
puts "OK!"
