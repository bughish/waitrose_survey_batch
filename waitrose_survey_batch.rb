require "watir-webdriver"
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

for j in 0..h.count-1 do
@receipt_p1 = h[j][0]
@receipt_p2 = h[j][1]
@receipt_p3 = h[j][2]
@receipt_p4 = h[j][3]
b = Watir::Browser.new
b.goto "http://www.waitrosecares.com/"
b.a(:href, "custsurvey.jsp").click
b.text_field(:id, "txt_field1").set(@receipt_p1)
b.text_field(:id, "txt_field2").set(@receipt_p2)
b.text_field(:id, "txt_field3").set(@receipt_p3)
b.text_field(:id, "txt_field4").set(@receipt_p4)
b.div(:id, "apDiv1").click
b.a(:href, "javascript:next();").click
sleep 1
b.img(:src, "images/calendar.gif").click #calendar
b.a(:class, "current-day-style selected-day-style").click
b.td(:class, "verticalRowEven").click
b.a(:href, "javascript:next();").click #next
sleep 1
b.td(:class => "radioOdd", :index => 4).click #strongly agree1
b.td(:class => "radioEven", :index => 4).click
sleep 1
b.td(:class => "radioOdd", :index => 15).click
b.a(:href, "javascript:next();").click #next
sleep 1
b.td(:class => "radioOdd").click
b.a(:href, "javascript:next();").click #next
sleep 1
#b.text_field(:name, "PARTNER_WOW").set("Everything was special")
#b.text_field(:name, "PARTNER_NAME_DETAIL").set("Can't recall")
b.a(:href, "javascript:next();").click #next
b.a(:href, "javascript:next();").click #next
b.td(:class => "verticalRowEven").click
b.a(:href, "javascript:next();").click#next
sleep 1
b.input(:class => "verticalRadioOdd", :index => 1).click
b.a(:href, "javascript:next();").click #next
sleep 1
b.td(:class => "verticalRowOdd").click
b.input(:class => "verticalRadioOdd", :index => 1).click
b.a(:href, "javascript:next();").click #next
sleep 1
b.td(:class => "radioOdd").click
b.a(:href, "javascript:next();").click #next
sleep 1
b.td(:class => "radioOdd").click
b.td(:class => "radioEven").click
b.td(:class => "radioOdd", :index => 6).click
b.a(:href, "javascript:next();").click #next
sleep 1
b.td(:class => "radioOdd", :index => 4).click
b.td(:class => "radioEven", :index => 4).click
b.td(:class => "radioOdd", :index => 9).click
b.td(:class => "radioEven", :index => 10).click
b.td(:class => "radioOdd", :index => 15).click
b.a(:href, "javascript:next();").click #next
sleep 1
b.td(:class => "radioOdd").click
b.td(:class => "radioEven").click
b.td(:class => "radioOdd", :index => 3).click
b.td(:class => "radioEven", :index => 3).click
b.a(:href, "javascript:next();").click #next
sleep 1
b.td(:class => "radioOdd", :index => 4).click
b.td(:class => "radioEven", :index => 4).click
b.td(:class => "radioOdd", :index => 9).click
b.a(:href, "javascript:next();").click #next
sleep 1
b.td(:class => "radioOdd", :index => 4).click
b.td(:class => "radioEven", :index => 4).click
b.td(:class => "radioOdd", :index => 9).click
b.td(:class => "radioEven", :index => 9).click
b.td(:class => "radioOdd", :index => 12).click
b.a(:href, "javascript:next();").click #next
sleep 1
b.td(:class => "verticalRowOdd", :index => 2).click
b.a(:href, "javascript:next();").click #next
sleep 1
b.td(:class => "radioOdd", :index => 2).click
b.td(:class => "radioEven", :index => 2).click
b.td(:class => "verticalRowEven", :index => 8).click
b.a(:href, "javascript:next();").click #next
sleep 1
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
sleep 1
b.td(:class => "radioOdd", :index => 1).click
b.a(:href, "javascript:next();").click #next
sleep 1
b.td(:class => "radioOdd", :index => 4).click
b.a(:href, "javascript:finish();").click #last
sleep 1
b.img(:src, "images/button_no.jpg").click #no
sleep 2
#b.img(:src, "images/button_yes.jpg").click #yes
b.close
end
