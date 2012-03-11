require "zip/zip"

working_folder = "/home/tyler/Documents"

if !Dir.exists?(working_folder)
    Dir.mkdir(working_folder)
end

input_folder = "#{working_folder}/input"
if !Dir.exists?(input_folder)
    Dir.mkdir(input_folder)
end

output_folder = "#{working_folder}/output"
if !Dir.exists?(output_folder)
    Dir.mkdir(output_folder)
end

10.times do |i|
    sub_folder = "#{input_folder}/folder#{i}"
    if !Dir.exists?(sub_folder)
        Dir.mkdir(sub_folder)
    end
end

data_file = File.new("#{input_folder}/data.txt", "w")
data = ([(["abc"] * 20).join(" ")] * rand(500)).join("\n")
data_file.syswrite(data)

10.times do |i| #for every sub folder in input folder
    sub_folder = "#{input_folder}/folder#{i}"
    rand(100).times do |j| #for each zip file
        zip_file = "#{sub_folder}/#{j}.zip"
        Zip::ZipFile.open(zip_file, Zip::ZipFile::CREATE) do |zip_file|
            rand(1000).times do |k| #for each data file inside a zip file
                zip_file.add("#{k}.txt", data_file) 
            end
        end 
    end
end
