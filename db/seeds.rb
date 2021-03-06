require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'media_seeds.csv'))

csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  w = Work.new
  w.title = row['title']
  w.category = row['category']
  w.created_by = row['creator']
  w.description = row['description']
  w.published = row['publication_year']
  w.save

puts "Added: #{w.title} by #{w.created_by}!"
end

puts "There are now #{Work.count} rows in the table."
