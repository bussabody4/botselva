--[[
لــ تــيــــمو ســيـلــفــا
]] 
function botuser(msg)
text = nil
if msg and msg.content and msg.content.text then
text = msg.content.text.text
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text)
if neww then
text = neww or text
end
end
---------------------------------------------------------------
if text == "تغير اسم البوت" or text == "تغيير اسم البوت •" or text == "ضع اسم للبوت" or text == "اضف اسم البوت" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* • عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* • عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• اسم فقط •', data = senderr..'/Namebot'},
},
{
{text = '• اسم ثاني •', data = senderr..'/botName'},
},
}
}
return send(msg_chat_id, msg_id,"* • برجاء اختيار الاسم المراد\n • يمكنك اضافة اسمين للبوت*","md",false, false, false, false, reply_markup)
end 
if text == "حذف اسم البوت" or text == "مسح اسم البوت" or text == "مسح اسم البوت •" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* • عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* • عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• الاسم الاول •', data = senderr..'/nambot'},
},
{
{text = '• الاسم الثاني •', data = senderr..'/botnam'},
},
}
}
return send(msg_chat_id, msg_id,"* • مرحبا اي اسم تريد الحذف ؟!!\n√*","md",false, false, false, false, reply_markup)
end 
if text == (Redis:get(Fast.."Name:Bot") or "الخالدي") then
local TimoSelva = (Redis:get(Fast.."Name:Bot") or "الخالدي")
local ban = bot.getUser(Fast)
local bain = bot.getUser(senderr)
if bain.username then
banusername = '[@'..bain.username..']'
else
banusername = 'لا يوجد'
end
if bain.first_name then
Text = '*['..bain.first_name..'](tg://user?id='..bain.id..')*'
else
Text = 'لا يوجد'
end
local SELVA = {'• مالك حبيبى 🥺','• مخصماك وبعد عني مش طيقاك 😹','• مبكلمكش 🥺','• ثانيه واحده بتشقط وجى 🙄','• موجود عايز اى بوشك ده 😒','• شبيك لبيك 👻😹','نعم يا قلب '..TimoSelva..' ♥',}
local TIMO = "*• نعم يا ⦉ "..Text.." ⦊ *"
SELVAA = SELVA[math.random(#SELVA)] 
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = SELVAA, url = 't.me/'..UserBot..'?start'},
},
} 
}
return bot.sendText(msg_chat_id,msg_id,TIMO,'md',false, false, false, false, reply_markup)
end 
if text == (Redis:get(Fast.."Bot:Name") or "الخالدي") then
local TimoSelva = (Redis:get(Fast.."Bot:Name") or "الخالدي")
local SELVA = {'• مالك حبيبى 🥺','• مخصماك وبعد عني مش طيقاك 😹','• مبكلمكش 🥺','• ثانيه واحده بتشقط وجى 🙄','• موجود عايز اى بوشك ده 😒','• شبيك لبيك 👻😹','نعم يا قلب '..TimoSelva..' ♥',}
local TIMO = "\n*• نعم حبيبي "..msg.Name_Controller.." 🥺❤️*"
SELVAA = SELVA[math.random(#SELVA)] 
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = SELVAA, url = 't.me/'..UserBot..'?start'},
},
} 
}
return bot.sendText(msg_chat_id,msg_id,TIMO,'md',false, false, false, false, reply_markup)
end 
----
if text == "بوت" or text == "البوت" then
if Redis:get(Fast.."name bot type : ") == "photo" then 
local photo = bot.getUserProfilePhotos(Fast)
local UserInfo = bot.getUser(Fast)
local TimoSelva = (Redis:get(Fast.."Name:Bot") or "الخالدي")
local BOT = { 'اسمي '..TimoSelva..' يا قلبي 🤤💚','اسمي '..TimoSelva..' يا روحي🙈❤️','اسمي '..TimoSelva..' يعمري🌚🌹','اسمي '..TimoSelva..' يا قمر 🐭🤍','اسمي '..TimoSelva..' يامزه 🥺❤️','اسمي الكيوت '..TimoSelva..' 🌝💘','اسمي '..TimoSelva..' ياحياتي🧸♥️',}
Selva = BOT[math.random(#BOT)] 
local TIMO = "*• نعم حبيبي "..msg.Name_Controller.." 🥺❤️*"
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = Selva, url = 't.me/'..UserBot..'?start'},
},
{
{text = 'اضفني لـ مـجموعتك 🧸', url = 't.me/'..UserBot..'?startgroup=new'},
},
}
}
if photo.total_count > 0 then
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,TIMO, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
end
end
local TimoSelva = (Redis:get(Fast.."Name:Bot") or "الخالدي")
local TIMO = "*• اسمي "..TimoSelva.." عزيزي "..msg.Name_Controller.." 🥺❤️\n√*"
send(msg_chat_id,msg_id,TIMO,"md",true) 
end


local questions = {
"قول عنوانك:",
"قول دراستك أو تخصصك:",
"قول رقم تليفونك:",
"قول خبراتك السابقة:",
"قول مهاراتك:",
"هل تحب تضيف شيء آخر؟"
}
local user_id = msg.sender_id.user_id
local chat_id = msg.chat_id
local step = Redis:get("cv_step:"..user_id)
if text == "عمل سي في" then
Redis:set("cv_step:"..user_id, 1)
Redis:del("cv_name:"..user_id)
Redis:del("cv_age:"..user_id)
Redis:del("cv_status:"..user_id)
Redis:del("cv_answers:"..user_id)
return send(chat_id, msg.id, "<pre>قول اسمك:</pre>", "html", true)
end
if step == "1" then
Redis:set("cv_name:"..user_id, text)
Redis:set("cv_step:"..user_id, 2)
return send(chat_id, msg.id, "<pre>قول عمرك:</pre>", "html", true)
elseif step == "2" then
Redis:set("cv_age:"..user_id, text)
Redis:set("cv_step:"..user_id, 3)
return send(chat_id, msg.id, "<pre>قول حالتك الاجتماعية:</pre>", "html", true)
elseif step == "3" then
Redis:set("cv_status:"..user_id, text)
Redis:set("cv_step:"..user_id, 4)
return send(chat_id, msg.id, "<pre>"..questions[1].."</pre>", "html", true)
else
local step_num = tonumber(step)
if step_num and step_num >= 4 and step_num < 4 + #questions then
local prev_answers = Redis:get("cv_answers:"..user_id) or ""
prev_answers = prev_answers .. questions[step_num - 3] .. "\n" .. text .. "\n\n"
Redis:set("cv_answers:"..user_id, prev_answers)
step_num = step_num + 1
Redis:set("cv_step:"..user_id, step_num)
if step_num < 4 + #questions then
return send(chat_id, msg.id, "<pre>"..questions[step_num - 3].."</pre>", "html", true)
else
Redis:del("cv_step:"..user_id)
local name = Redis:get("cv_name:"..user_id) or "غير معروف"
local age = Redis:get("cv_age:"..user_id) or "غير معروف"
local status = Redis:get("cv_status:"..user_id) or "غير معروف"
local answers = Redis:get("cv_answers:"..user_id) or ""
Redis:del("cv_name:"..user_id)
Redis:del("cv_age:"..user_id)
Redis:del("cv_status:"..user_id)
Redis:del("cv_answers:"..user_id)
local cv_text = "# السيرة الذاتية\n\n" ..
"الاسم: " .. name .. "\n\n" ..
"العمر: " .. age .. "\n\n" ..
"الحالة الاجتماعية: " .. status .. "\n\n" ..
answers ..
"---\n" ..
"تم الانشاء بواسطه بوت السيره الذاتيه"
local file_path = "./cv_" .. user_id .. ".txt"
local file = io.open(file_path, "w")
if not file then
return send(chat_id, msg.id, "خطأ في إنشاء ملف السيرة الذاتية.")
end
file:write(cv_text)
file:close()
send(chat_id, msg.id, "<pre>تم إنشاء الملف بنجاح، جارٍ الإرسال...</pre>", "html", true)
return bot.sendDocument(chat_id, msg.id, file_path, "دي سيرتك الذاتية كاملة!")
end
end
end

if text == "بيقول اي" and tonumber(msg.reply_to_message_id) > 0 then
local rep_msg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if rep_msg.content and rep_msg.content.voice_note then
local voice = rep_msg.content.voice_note.voice.remote.id
local get_file = https.request("https://api.telegram.org/bot"..Token.."/getFile?file_id="..voice)
local file_data = JSON.decode(get_file)
local file_path = file_data.result.file_path
local voice_url = "https://api.telegram.org/file/bot"..Token.."/"..file_path
os.execute("wget '"..voice_url.."' -O voice.ogg")
os.execute("whisper voice.ogg --language Arabic --fp16 False --model tiny --output_format txt")
local file = io.open("voice.txt", "r")
if not file then
return send(msg.chat_id, msg.id, "• حصل خطأ أثناء قراءة التفريغ.", "md", true)
end
local result = file:read("*all")
file:close()
if result and result:len() > 5 then
return send(msg.chat_id, msg.id, "*"..result.."*", "md", true)
else
return send(msg.chat_id, msg.id, "• تعذر التعرف على الصوت، حاول تسجيله بوضوح.", "md", true)
end
end
end




if text == "تنسيق كود" then
    Redis:set(Fast.."clean_code:"..senderr, true)
    return send(msg_chat_id, msg_id, "• ابعت الكود اللي عايز أرتبهولك.", "md", true)
end


if Redis:get(Fast.."clean_code:"..senderr) then
    Redis:del(Fast.."clean_code:"..senderr)

    local cleaned_code = {}
    for line in text:gmatch("[^\r\n]+") do
        local trimmed = line:gsub("^%s+", "") -- شيل المسافات في أول السطر
        if trimmed ~= "" then -- تجاهل السطور الفاضية
            table.insert(cleaned_code, trimmed)
        end
    end

    local result = table.concat(cleaned_code, "\n")

    return send(msg_chat_id, msg_id, "• الكود بعد التنسيق:\n```"..result.."```", "md", true)
end



if text == "سوره" or text == "سورة" then
Redis:set(Fast.."qraaan:selva"..msg.sender_id.user_id, true)
return send(msg_chat_id, msg.id, "• من فضلك اكتب اسم السورة التي تريد سماعها.")
end
if Redis:get(Fast.."qraaan:selva"..msg.sender_id.user_id) then
local elobaha = text
Redis:del(Fast.."qraaan:selva"..msg.sender_id.user_id)
local timoo = {
  ["الفاتحه"] = "2",
  ["البقره"] = "3",
  ["العمران"] = "4",
  ["النساء"] = "5",
  ["المائده"] = "6",
  ["الانعام"] = "7",
  ["الاعراف"] = "8",
  ["الانفال"] = "9",
  ["التوبه"] = "10",
  ["يونس"] = "11",
  ["هود"] = "12",
  ["يوسف"] = "13",
  ["الرعد"] = "14",
  ["ابراهيم"] = "15",
  ["الحجر"] = "16",
  ["النحل"] = "17",
  ["الاسراء"] = "18",
  ["الكهف"] = "19",
  ["مريم"] = "20",
  ["طه"] = "21",
  ["الانبيا"] = "22",
  ["الحج"] = "23",
  ["المؤمنون"] = "24",
  ["النور"] = "25",
  ["الفرقان"] = "26",
  ["الشعراء"] = "27",
  ["النمل"] = "28",
  ["القصص"] = "29",
  ["العنكبوت"] = "30",
  ["الروم"] = "31",
  ["لقمان"] = "32",
  ["السجده"] = "33",
  ["الاحزاب"] = "34",
  ["سبا"] = "35",
  ["فاطر"] = "36",
  ["يس"] = "37",
  ["الصافات"] = "38",
  ["ص"] = "39",
  ["الزمر"] = "40",
  ["غافر"] = "41",
  ["فصلت"] = "42",
  ["الشوري"] = "43",
  ["الزخرف"] = "44",
  ["الدخان"] = "45",
  ["الجاثيه"] = "46",
  ["الاحقاف"] = "47",
  ["محمد"] = "48",
  ["الفتح"] = "49",
  ["الحجرات"] = "50",
  ["ق"] = "51",
  ["الذاريات"] = "52",
  ["الطور"] = "53",
  ["النجم"] = "54",
  ["القمر"] = "55",
  ["الرحمن"] = "56",
  ["الواقعه"] = "57",
  ["الحديد"] = "58",
  ["المجادله"] = "59",
  ["الحشر"] = "60",
  ["الممتحنه"] = "61",
  ["الصف"] = "62",
  ["الجمعه"] = "63",
  ["المنافقون"] = "64",
  ["التغابن"] = "65",
  ["الطلاق"] = "66",
  ["التحريم"] = "67",
  ["الملك"] = "68",
  ["القلم"] = "69",
  ["الحاقه"] = "70",
  ["المعارج"] = "71",
  ["نوح"] = "72",
  ["الجن"] = "73",
  ["المزمّل"] = "74",
  ["المدّثر"] = "75",
  ["القيامه"] = "76",
  ["الانسان"] = "77",
  ["المرسلات"] = "78",
  ["النبأ"] = "79",
  ["النازعات"] = "80",
  ["عبس"] = "81",
  ["التكوير"] = "82",
  ["الانفطار"] = "83",
  ["المطفّفين"] = "84",
  ["الانشقاق"] = "85",
  ["البروج"] = "86",
  ["الطارق"] = "87",
  ["الاعلي"] = "88",
  ["الغاشيه"] = "89",
  ["الفجر"] = "90",
  ["البلد"] = "91",
  ["الشمس"] = "92",
  ["الليل"] = "93",
  ["الضحى"] = "94",
  ["الشرح"] = "95",
  ["التين"] = "96",
  ["العلق"] = "97",
  ["القدر"] = "98",
  ["البينه"] = "99",
  ["الزلزله"] = "100",
  ["العاديات"] = "101",
  ["القارعه"] = "102",
  ["التكاثر"] = "103",
  ["العصر"] = "104",
  ["الهمزه"] = "105",
  ["الفيل"] = "106",
  ["قريش"] = "107",
  ["الماعون"] = "108",
  ["الكوثر"] = "109",
  ["الكافرون"] = "110",
  ["النصر"] = "111",
  ["المسد"] = "112",
  ["الاخلاص"] = "113",
  ["الفلق"] = "114",
  ["الناس"] = "115"
}
local Timo_Selva = timoo[elobaha]
if msg_id then
local bain = bot.getUser(senderr)
if bain.first_name then
Text = '*['..bain.first_name..'](tg://user?id='..bain.id..')*'
else
Text = 'لا يوجد'
end
local Timo = "https://t.me/selva_qraan/"..Timo_Selva
bot.sendAudio(msg.chat_id, msg.id,Timo,"*• اليك سوره "..elobaha.." يا \n ⦉ "..Text.." ⦊*","md", true)
else
return send(msg_chat_id, msg.id, "• السورة غير موجودة، تأكد من كتابتها بشكل صحيح.")
end
end


if text == "qr" or text == "QR" or text == "كود" or text == "code" then
Redis:set("qr_step:"..msg.sender_id.user_id, "await_option")
return send(msg.chat_id, msg.id, "*• اختر نوع QR:\n1 - رابط\n2 - واي فاي\n3 - رقم واتساب*", "md")
end
local step = Redis:get("qr_step:"..msg.sender_id.user_id)
if step == "await_option" then
if text == "1" then
Redis:set("qr_step:"..msg.sender_id.user_id, "await_link")
return send(msg.chat_id, msg.id, "*• أرسل الرابط الآن*", "md")
elseif text == "2" then
Redis:set("qr_step:"..msg.sender_id.user_id, "await_ssid")
return send(msg.chat_id, msg.id, "*• أرسل اسم شبكة الواي فاي (SSID)*", "md")
elseif text == "3" then
Redis:set("qr_step:"..msg.sender_id.user_id, "await_whatsapp")
return send(msg.chat_id, msg.id, "*• أرسل رقم الواتساب مع كود الدولة (بدون +)*", "md")
else
return send(msg.chat_id, msg.id, "*• الرجاء اختيار رقم صحيح (1 أو 2 أو 3)*", "md")
end
elseif step == "await_link" then
local encoded = URL.escape(text)
local qr_link = "https://quickchart.io/qr?text=" .. encoded .. "&size=200&ecLevel=L&quietZone=2&backgroundColor=white&color=000000"
Redis:del("qr_step:"..msg.sender_id.user_id)
return bot.sendPhoto(msg.chat_id, msg.id, qr_link, "*• هذا هو كود QR للرابط*", "md")
elseif step == "await_whatsapp" then
local link = "https://wa.me/"..text
local encoded = URL.escape(link)
local qr_link = "https://quickchart.io/qr?text=" .. encoded .. "&size=200&ecLevel=L&quietZone=2&backgroundColor=white&color=000000"
Redis:del("qr_step:"..msg.sender_id.user_id)
return bot.sendPhoto(msg.chat_id, msg.id, qr_link, "*• هذا هو كود QR لرقم الواتساب*", "md")
elseif step == "await_ssid" then
Redis:set("wifi_ssid:"..msg.sender_id.user_id, text)
Redis:set("qr_step:"..msg.sender_id.user_id, "await_password")
return send(msg.chat_id, msg.id, "*• أرسل كلمة مرور الشبكة..*", "md")
elseif step == "await_password" then
Redis:set("wifi_password:"..msg.sender_id.user_id, text)
Redis:set("qr_step:"..msg.sender_id.user_id, "await_type")
return send(msg.chat_id, msg.id, "*• اختار نوع تشفير الشبكه ⋮\n• ⦉ 1 ⦊ - WPA/WPA2\n• ⦉ 2 ⦊ - WEP\n• ⦉ 3 ⦊ - لا يوجد*", "md")
elseif step == "await_type" then
local types = {
["1"] = "WPA",
["2"] = "WEP",
["3"] = "nopass"
}
local encryption = types[text]
if not encryption then
return send(msg.chat_id, msg.id, "*• الرجاء اختيار رقم صحيح (1 أو 2 أو 3)*", "md")
end
local ssid = Redis:get("wifi_ssid:"..msg.sender_id.user_id)
local password = Redis:get("wifi_password:"..msg.sender_id.user_id)
local qr_data = "WIFI:T:"..encryption..";S:"..ssid..";P:"..password..";H:false;;"
local encoded = URL.escape(qr_data)
local qr_link = "https://quickchart.io/qr?text=" .. encoded .. "&size=200&ecLevel=L&quietZone=2&backgroundColor=white&color=000000"
Redis:del("qr_step:"..msg.sender_id.user_id)
Redis:del("wifi_ssid:"..msg.sender_id.user_id)
Redis:del("wifi_password:"..msg.sender_id.user_id)
return bot.sendPhoto(msg.chat_id, msg.id, qr_link, "*• هذا هو كود QR لشبكة الواي فاي*", "md")
end

if text and text:match("^/qr (.+)$") then
local data = text:match("^/qr (.+)$")
local qr_link = "https://freeqr.com/api/v1/?size=300x300&color=ff0000&bgcolor=ffffff&data="..URL.escape(data)
return bot.sendPhoto(msg.chat_id, msg.id, qr_link, "• *هذا هو QR الملون الخاص بمحتواك*", "md")
end

if text and text:match("^ترجم (.+)$") then
local query = text:match("^ترجم (.+)$")
local url = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=en&dt=t&q=" .. URL.escape(query)
local response = https.request(url)
if response then
local success, result = pcall(function() return JSON.decode(response) end)
if not success or type(result) ~= "table" then
return send(msg.chat_id, msg.id, "*• فشل استخراج الترجمة*", "md")
end
local detected_lang = nil
if result[3] then
detected_lang = result[3]
elseif result[2] then
detected_lang = result[2]
end
if not detected_lang then
return send(msg.chat_id, msg.id, "*• فشل التعرف على لغة النص*", "md")
end
local target_lang = detected_lang == "ar" and "en" or "ar"
local url_translate = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=" .. target_lang .. "&dt=t&q=" .. URL.escape(query)
local final_response = https.request(url_translate)
if final_response then
local ok, final_result = pcall(function() return JSON.decode(final_response) end)
if ok and final_result and final_result[1] and final_result[1][1] and final_result[1][1][1] then
local final_text = final_result[1][1][1]
return send(msg.chat_id, msg.id, "*• الترجمة\n• ⦉ " .. final_text.." ⦊*", "md")
else
return send(msg.chat_id, msg.id, "*• فشل استخراج الترجمة*", "md")
end
else
return send(msg.chat_id, msg.id, "*• حصل خطأ أثناء الترجمة*", "md")
end
else
return send(msg.chat_id, msg.id, "*• لم يتم الحصول على استجابة من الترجمة*", "md")
end
end 


end
return {Fast = botuser}