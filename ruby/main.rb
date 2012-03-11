require "zip/zip"

working_folder = "/home/tyler/Documents"
input_folder = "#{working_folder}/input"
output_folder = "#{working_folder}/output"

temp_folder = "#{working_folder}/temp"
if !Dir.exists?(temp_folder)
    Dir.mkdir(temp_folder)
end

count = 0
Dir.glob("#{input_folder}/**/*.zip").each do |zip_file| #for every zip file from input folder
    Zip::ZipFile.open(zip_file) do |zip_file| 
        zip_file.each do |entry| #for every data file in the zip file
            entry.extract("#{temp_folder}/#{count}.txt") #unzip
            count += 1
        end        
    end
end

count = 0
zip_file = Zip::ZipFile.open("#{output_folder}/#{count}.zip", true)
Dir.glob("#{temp_folder}/*").each do |data_file|
    zip_file.add(File.basename(data_file), data_file)
    zip_file.commit
    File.delete(data_file)
    if File.size("#{output_folder}/#{count}.zip") > 1024 * 480
        count += 1
        zip_file.close
        zip_file = Zip::ZipFile.open("#{output_folder}/#{count}.zip", true)
    end
end
zip_file.close
