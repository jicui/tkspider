require_relative 'csv_reader'
reader=CsvReader.new
ARGV.each{|csv_file|
STDERR.puts "Processing #{csv_file}"
reader.read_in_csv_data csv_file
}

puts "Total value=#{reader.total_value_in_stock}"