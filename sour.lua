--[[
]] 
function sour(msg)
text = nil
if msg and msg.content and msg.content.text then
text = msg.content.text.text
end
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text)
if neww then
text = neww or text
end
end
if text == "تلاوات" or text == "تلاوه" then 
Abs = math.random(2,140); 
local Text ='*〈 اليك تلاوات يروحي 🥺♥ 〉*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'قناة السورس',url="t.me/Sudanese_56"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/ALMORTAGELRSK/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
---------
if text then
if text:match("(.*)(نمله)(.*)") then
local t = '*• اضغط علي النمله بالاسفل 🔰*'
local m = "https://t.me/DEV_JABWA/228" 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '🐜', callback_data=senderr..'/antit'},
},
{
{text = 'اضف البوت الي مجموعتك ✅', url = 't.me/'..UserBot..'?startgroup=new'},
}
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&photo="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown&reply_markup="..JSON.encode(keyboard))
end
end

if text == "شبيهتي" then
Abs = math.random(2,140)
local Text ='*الصراحه اتفق هذي شبيهتك .*'
keyboard = {inline_keyboard = {{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url = 'http://t.me/'..chsource}}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo=https://t.me/VVVYVV4/"..Abs.."&caption="..URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if text == "شبيهي" then
Abs = math.random(2,140)
local Text ='*الصراحه اتفق هذا شبيهك .*'
keyboard = {inline_keyboard = {{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url = 'http://t.me/'..chsource}}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo=https://t.me/VVVVBV1V/"..Abs.."&caption="..URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if text == "استوري" then
Abs = math.random(4,50)
local Text ='*• احـلي استوري ليك يـقـمـر 🌚❤️.*'
keyboard = {inline_keyboard = {{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url = "t.me/Sudanese_56"}}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendaudio?chat_id="..msg.chat_id.."&audio=https://t.me/eatoryy/"..Abs.."&caption="..URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end


if text == "جداريات" then
Abs = math.random(2,140)
local Text = '*• تم اختيار جداريات*'
keyboard = {inline_keyboard = {{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url = "https://t.me/Sudanese_56"}}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo=https://t.me/usjeijw/"..Abs.."&caption="..URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if text == "هيدرات" then
Abs = math.random(2,140)
local Text = '*• تم اختيار هيدرات*'
keyboard = {inline_keyboard = {{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url = "https://t.me/Sudanese_56"}}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo=https://t.me/flflfldld/"..Abs.."&caption="..URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if text == "رمزيات بنات" then
Abs = math.random(2,140)
local Text = '*• تم اختيار افتار بنات*'
keyboard = {inline_keyboard = {{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url = "https://t.me/Sudanese_56"}}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo=https://t.me/LoreBots2/"..Abs.."&caption="..URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if text == "رمزيات رسم" then
Abs = math.random(2,140)
local Text = '*• تم اختيار افتار رسم*'
keyboard = {inline_keyboard = {{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url = "https://t.me/Sudanese_56"}}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo=https://t.me/LoreBots5/"..Abs.."&caption="..URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if text == "رمزيات فكتوري" then
Abs = math.random(2,140)
local Text = '*• تم اختيار افتار فكتوري*'
keyboard = {inline_keyboard = {{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url = "https://t.me/Sudanese_56"}}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo=https://t.me/LoreBots6/"..Abs.."&caption="..URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if text == "رمزيات سينمائيه" then
Abs = math.random(2,140)
local Text = '*• تم اختيار افتار السينمائي*'
keyboard = {inline_keyboard = {{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url = "https://t.me/Sudanese_56"}}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo=https://t.me/LoreBots1/"..Abs.."&caption="..URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if text == "رمزيات اقتباس" then
Abs = math.random(2,140)
local Text = '*• تم اختيار اقتباس*'
keyboard = {inline_keyboard = {{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url = "https://t.me/Sudanese_56"}}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo=https://t.me/LoreBots8/"..Abs.."&caption="..URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if text == "رمزيات كرتون" then
Abs = math.random(2,140)
local Text = '*• تم اختيار افتار انمي*'
keyboard = {inline_keyboard = {{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url = "https://t.me/Sudanese_56"}}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo=https://t.me/LoreBots7/"..Abs.."&caption="..URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if text == "رمزيات عبارات" then
Abs = math.random(2,140)
local Text = '*• تم اختيار عباره*'
keyboard = {inline_keyboard = {{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url = "https://t.me/Sudanese_56"}}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo=https://t.me/LoreBots9/"..Abs.."&caption="..URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if text == "رمزيات فنانين عرب" then
Abs = math.random(2,140)
local Text = '*• تم اختيار افتار فنانين*'
keyboard = {inline_keyboard = {{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url = "https://t.me/Sudanese_56"}}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo=https://t.me/FPPPH/"..Abs.."&caption="..URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if text == "هل تعلم" or text == "هل تعلم بالصوره" then
Timo = math.random(3,30); 
local Text ='*• مرحبا اليك هل تعلم بالصوره 💡*'
local keyboardd = {} keyboardd.inline_keyboard = {{{text = 'هل تعلم آخري 💡', callback_data=senderr.."/Learn"},},}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/JABWAI/'..Timo..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboardd)) 
end

if text == "لو خيروك بالصوره" or text == "لو خيروك بالصورة" then
Timo = math.random(2,27); 
local Text ='*• مرحبا اليك لو خيروك بالصوره 🍁*'
local keyboardd = {} keyboardd.inline_keyboard = {{{text = 'لو خيروك آخري 🍁', callback_data=senderr.."/Tellme"},},}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/SourceFast/'..Timo..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboardd)) 
end

if text == "بوستات بالصور" or text == "بوستات" or text == "افتار بوستات" then
Timo = math.random(3,21); 
local Text ='*تـم اخـتيار هـذه الـصوره لـك 🌼❤️*'
local keyboardd = {} keyboardd.inline_keyboard = {{{text = 'بوستات آخري 🌼', callback_data=senderr.."/Post"},},}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/JABWA4/'..Timo..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboardd)) 
end

if text == "مستقبلي" or text == "المستقبل" then
Timo = math.random(2,11); 
local Text ='*• حظك زي شكلك 👻😹*'
local keyboardd = {} keyboardd.inline_keyboard = {{{text = 'اضف البـوت الـي مجموعتك 🎀', url = 't.me/'..UserBot..'?startgroup=new'},},}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/mstapu/'..Timo..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboardd)) 
end

if text == "رمزيات ولاد" or text == "رمزيات شباب" or text == "افتار ولاد" then
Timo = math.random(4,581); 
local Text ='*تـم اخـتيار هـذه الـصوره لـك 🌼❤️*'
local keyboardd = {} keyboardd.inline_keyboard = {{{text = 'رمزيات آخري 👼', callback_data=senderr.."/euyilp"},},}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/Boys_app/'..Timo..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboardd)) 
end

if text == "تويت بالصوره" or text == "تويت بالصور" or text == "اتويت بالصورة" then
Timo = math.random(4,42); 
local Text ='*مرحبا إليك تويت بالصور 🌼❤️*'
local keyboardd = {} keyboardd.inline_keyboard = {{{text = 'تويت آخري 🌼', callback_data=senderr.."/tweet"},},}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/wffhvv/'..Timo..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboardd)) 
end

if text == "غنيلي" then
local t = "*اليك اغنيه عشوائيه 🎙.*"
Num = math.random(8,83)
Mhm = math.random(108,143)
Mhhm = math.random(166,179)
Mmhm = math.random(198,216)
Mhmm = math.random(257,626)
local Texting = {Num,Mhm,Mhhm,Mmhm,Mhmm}
local Rrr = Texting[math.random(#Texting)]
local m = "https://t.me/mmsst13/"..Rrr..""
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'غنيلي اخـري ​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​​🔁', callback_data=msg.sender_id.user_id.."/songg"},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendaudio?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&audio="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown&reply_markup="..JSON.encode(keyboard))
end

end

return {Fast = sour}