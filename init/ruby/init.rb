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

html_file = File.new("#{input_folder}/data.txt", "w")
data = ([(["abc"] * 20).join(" ")] * rand(500)).join("\n")
html_file.syswrite(data)
