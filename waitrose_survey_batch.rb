require "watir-webdriver"
#b = Watir::Browser.new :chrome #Google Chrome !
b = Watir::Browser.new #firefox

@name = File.read("waitrose_userdata.txt").split(/\n/)[0].strip.to_s
@lastname = File.read("waitrose_userdata.txt").split(/\n/)[1].strip.to_s
@street = File.read("waitrose_userdata.txt").split(/\n/)[2].strip.to_s
@town = File.read("waitrose_userdata.txt").split(/\n/)[3].strip.to_s
@postcode = File.read("waitrose_userdata.txt").split(/\n/)[4].strip.to_s
@email = File.read("waitrose_userdata.txt").split(/\n/)[5].strip.to_s
@phone = File.read("waitrose_userdata.txt").split(/\n/)[6].strip.to_s

arr = File.read("waitrose_receipts.txt").split(/\n/)
h = Hash.new
for i in 0..arr.count-1 do 
h[i] = arr[i].split(" ")
end

k = h.count-1
for j in 0..k do
@receipt_p1 = h[j][0]
@receipt_p2 = h[j][1]
@receipt_p3 = h[j][2]
@receipt_p4 = h[j][3]

@cycle = j+1
@cycles = k+1

puts ":: Cycle "+@cycle.to_s+" of "+@cycles.to_s
puts "Receipt ID "+@cycle.to_s+" is: "+h[j].to_s

b.goto "http://www.waitrosecares.com/"
b.a(:href, "custsurvey.jsp").click
b.text_field(:id, "txt_field1").set(@receipt_p1)
b.text_field(:id, "txt_field2").set(@receipt_p2)
b.text_field(:id, "txt_field3").set(@receipt_p3)
b.text_field(:id, "txt_field4").set(@receipt_p4)
b.div(:id, "apDiv1").click
b.a(:href, "javascript:next();").click

sleep 1 until b.img(:src, "images/calendar.gif").exists?
puts "#1 "+b.span(:class, "surveyInstruction").text.to_s
b.img(:src, "images/calendar.gif").click #calendar
b.a(:class, "current-day-style selected-day-style").click
b.td(:class, "verticalRowEven").click
b.a(:href, "javascript:next();").click #next

sleep 1 until b.td(:class => "radioOdd", :index => 4).exists?
puts "#2 "+b.span(:class, "surveyInstruction").text.to_s
if b.text.include? "shopping"
b.td(:class => "radioOdd", :index => 4).click 
b.td(:class => "radioEven", :index => 4).click
b.td(:class => "radioOdd", :index => 9).click
b.td(:class => "radioEven", :index => 14).click
else
b.td(:class => "radioOdd", :index => 4).click 
b.td(:class => "radioEven", :index => 4).click
b.td(:class => "radioOdd", :index => 17).click
end
b.a(:href, "javascript:next();").click #next

sleep 1 until b.td(:class => "radioOdd").exists?
puts "#3 "+b.span(:class, "surveyInstruction").text.to_s
b.td(:class => "radioOdd").click
b.a(:href, "javascript:next();").click #next


puts "#4 "+b.span(:class, "surveyInstruction").text.to_s
#uncomment to add some text feedback in set brackets
#b.text_field(:name, "PARTNER_WOW").set("Tell them a bit more about what partners did that it was special..")
#b.text_field(:name, "PARTNER_NAME_DETAIL").set("Partners name")
b.a(:href, "javascript:next();").click #next

puts "#5 "+b.span(:class, "surveyInstruction").text.to_s
#uncomment to add some text feedback in set brackets
#b.text_field(:name, "OV_SAT_POS").set("Reasons that made my experience memorable")
b.a(:href, "javascript:next();").click #next

sleep 1 until b.td(:class => "verticalRowEven").exists?
puts "#6 "+b.span(:class, "surveyInstruction").text.to_s
b.td(:class => "verticalRowEven").click
b.a(:href, "javascript:next();").click #next

sleep 1 until b.input(:class => "verticalRadioOdd", :index => 1).exists?
puts "#7 "+b.span(:class, "surveyInstruction").text.to_s
g =  b.inputs(:class => "verticalRadioOdd").length
b.input(:class => "verticalRadioOdd", :index =>  g-1).click
b.a(:href, "javascript:next();").click #next

sleep 1 until b.td(:class => "verticalRowOdd").exists?
puts "#8 "+b.span(:class, "surveyInstruction").text.to_s
g =  b.inputs(:class => "verticalRadioOdd").length
b.input(:class => "verticalRadioOdd", :index =>  g-1).click
b.a(:href, "javascript:next();").click #next

sleep 1 until b.td(:class => "radioOdd").exists?
puts "#9 "+b.span(:class, "surveyInstruction").text.to_s
b.td(:class => "radioOdd").click
b.a(:href, "javascript:next();").click #next

sleep 1 until b.td(:class => "radioOdd").exists?
puts "#10 "+b.span(:class, "surveyInstruction").text.to_s

if b.text.include? "shelves"
b.td(:class => "radioOdd").click
b.td(:class => "radioEven").click
b.td(:class => "radioOdd", :index => 6).click
b.td(:class => "radioEven", :index => 6).click
b.td(:class => "radioOdd", :index => 11).click
else
b.td(:class => "radioOdd").click
b.td(:class => "radioEven").click
b.td(:class => "radioOdd", :index => 6).click
end
b.a(:href, "javascript:next();").click #next
 
sleep 1 until b.td(:class => "radioOdd").exists?
puts "#11 "+b.span(:class, "surveyInstruction").text.to_s
b.td(:class => "radioOdd", :index => 4).click
b.td(:class => "radioEven", :index => 4).click
b.td(:class => "radioOdd", :index => 9).click
b.a(:href, "javascript:next();").click #next

sleep 1 until b.td(:class => "radioOdd").exists?
puts "#12 "+b.span(:class, "surveyInstruction").text.split(/\n/)[0]
b.td(:class => "radioOdd", :index => 4).click
b.td(:class => "radioEven", :index => 4).click
b.td(:class => "radioOdd", :index => 9).click
b.td(:class => "radioEven", :index => 9).click
b.td(:class => "radioOdd", :index => 12).click
b.a(:href, "javascript:next();").click #next

sleep 1 until b.td(:class, "verticalRowOdd").exists?
puts "#13 "+b.span(:class, "surveyInstruction").text.split(/\n/)[0]
b.td(:class => "verticalRowOdd", :index => 2).click
b.a(:href, "javascript:next();").click #next

sleep 1 until b.td(:class => "radioOdd").exists?
puts "#14 "+b.span(:class, "surveyInstruction").text.to_s
b.td(:class => "radioOdd").click
b.td(:class => "radioEven", :index => 3).click #AGE!!!
g =  b.tds(:class => "verticalRowEven").length
b.td(:class => "verticalRowEven", :index => g-2).click
b.a(:href, "javascript:next();").click #next

sleep 1 until b.input(:name, "FIRST_NAME").exists?
puts "#15 "+b.span(:class, "surveyInstruction").text.to_s
b.input(:name, "FIRST_NAME").send_keys @name.to_s
b.input(:name, "LAST_NAME").send_keys @lastname.to_s
b.input(:name, "ADDRESS_1").send_keys @street.to_s
b.input(:name, "ADDRESS_2").send_keys @town.to_s
b.input(:name, "POSTCODE").send_keys @postcode.to_s
b.input(:name, "EMAIL_ADDRESS").send_keys @email.to_s
b.input(:name, "TELEPHONE_NUMBER").send_keys @phone.to_s
b.td(:class => "radioEven", :index => 5).click
b.td(:class => "radioOdd", :index => 1).click
b.td(:class => "radioEven", :index => 7).click
b.td(:class => "radioOdd", :index => 3).click
b.a(:href, "javascript:next();").click #next

sleep 1 until b.td(:class => "radioOdd", :index => 1).exists?
puts "#16 "+b.span(:class, "surveyInstruction").text.to_s
b.td(:class => "radioOdd", :index => 1).click
b.a(:href, "javascript:next();").click #next

#sleep 1 until b.td(:class => "radioOdd", :index => 4).exists?
#puts "#17 "+b.span(:class, "surveyInstruction").text.to_s
#b.td(:class => "radioOdd", :index => 4).click
#b.a(:href, "javascript:finish();").click #last

#18 Finish
#sleep 1 until b.img(:src, "images/button_no.jpg").exists?
#b.img(:src, "images/button_no.jpg").click #no
#b.img(:src, "images/button_yes.jpg").click #yes
end
b.close