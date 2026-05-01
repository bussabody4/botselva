--[[
لــ تــيــــمو ســيـلــفــا
]] 
function start(msg)
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
if text == '/start' or text == '• تغير الڪيبورد •' then
local userData = bot.getUser(senderr)
local selva = bot.getUser(Sudo_Id)
local userCount = Redis:scard(Fast..'Num:User:Pv') or 0
Redis:sadd(Fast..'Num:User:Pv', senderr)
if tonumber(senderr) ~= tonumber(Sudo_Id) then
local stickers = {
"https://t.me/stekaaaara/7",
"https://t.me/stekaaaara/6",
"https://t.me/stekaaaara/5",
"https://t.me/stekaaaara/4",
"https://t.me/stekaaaara/3",
"https://t.me/stekaaaara/2",
"https://t.me/stekaaaara/10",
"https://t.me/stekaaaara/9",
"https://t.me/stekaaaara/11",
"https://t.me/stekaaaara/13",
"https://t.me/stekaaaara/8"
}
local randomSticker = stickers[math.random(#stickers)]
https.request("https://api.telegram.org/bot"..Token.."/sendVideo?chat_id="..msg_chat_id.."&video="..randomSticker)
end
if not msg.Asasy then
if not Redis:get(Fast.."Start:Bot") then
local userName = userData.first_name and '*['..userData.first_name..'](tg://user?id='..userData.id..')*' or 'لا يوجد'
local date = os.date("%Y-%m-%d")
local time = os.date("%I:%M:%S %p")
local dayOfWeek = os.date("%A")
local days = {Sunday = "الأحد", Monday = "الاثنين", Tuesday = "الثلاثاء",Wednesday = "الأربعاء", Thursday = "الخميس", Friday = "الجمعة",Saturday = "السبت"}
dayOfWeek = days[dayOfWeek] or dayOfWeek
local Timo = "*ـــــــــــــــــــــــــــــــــــــــــــــ\n👋🏻︙نورت يا  -› ⦉ "..userName.." ⦊\n🤖︙أهلا بك انا بوت اسمي "..(Redis:get(Fast.."Name:Bot") or "سيلفا").."\n🔰︙وظيفتي حماية المجموعات\n🎧︙وتشغيل وتحميل الاغاني\n♻️︙لتفعيل البوت في مجموعتڪ اتبع ألخطؤأت ألتأليه\n➕︙أضِف البوت إلى مجموعتك أو قناتك..\n🦸🏻‍♂️︙ارفعهُ » ادمن مشرف\n☑️︙سيتم تفعيله تلقائيا\n⬆️︙سيتم ترقيتك مالك في البوت\n📆︙اليوم ⋮ ⦉ "..dayOfWeek.." ⦊ الموافق ⋮ ⦉ "..date.." ⦊\n⏰︙الساعه ⋮ ⦉ "..time.." ⦊\nـــــــــــــــــــــــــــــــــــــــــــــ*"
local reply_markup = bot.replyMarkup{type = 'inline', data = {
{{text = 'مـطـور الـبـوت 🧑‍💻', url = "https://t.me/"..selva.username..""}},
{{text = 'اوامر الحمايه 📚', data = senderr.."/alwameer"},{text = 'اوامر الميوزك 📯', data = senderr.."/music"}},
{{text = 'سورس البوت ⚙️', data = senderr.."/Source"},{text = 'ألعاب البوت 🎮', data = senderr.."/games"}},
{{text = 'ڪـيب الاعـضـاء 🫧', data = senderr.."/kayyyp"}},
{{text = 'اضف البوت إلى مجموعتك ➕', url = 't.me/'..UserBot..'?startgroup=new'}}}}
send(msg_chat_id, msg_id, Timo, "md", false, false, false, false, reply_markup)
local reply_markupp = bot.replyMarkup{type = 'inline', data = {
{{text = '𓏺 𝗌𝗈𝗎𝗋𝖼𝖾 .', url = "https://t.me/SO_SELVA"}},}}
bot.sendText(Sudo_Id, 0, "*• انضم شخص جديد الي البوت\n• الاسم ⋮ ⦉ "..userName.." ⦊\n• الايدي ⋮ ⦉ "..senderr.." ⦊\n• اصبحت الان ⋮ ⦉ "..userCount.." ⦊ مستخدم \n• اليوم ⋮ ⦉ "..dayOfWeek.." ⦊\n•️ التاريخ ⋮ ⦉ "..date.." ⦊\n• الوقت ⋮ ⦉ "..time.." ⦊*", "md", false, false, false, false, reply_markupp)
else
local reply_markup = bot.replyMarkup{type = 'inline', data = {
{{text = 'مـطـور الـبـوت 🧑‍💻', url = "https://t.me/"..selva.username..""}},
{{text = 'اوامر الحمايه 📚', data = senderr.."/alwameer"},{text = 'اوامر الميوزك 📯', data = senderr.."/music"}},
{{text = 'سورس البوت ⚙️', data = senderr.."/Source"},{text = 'ألعاب البوت 🎮', data = senderr.."/games"}},
{{text = 'ڪـيب الاعـضـاء 🫧', data = senderr.."/kayyyp"}},
{{text = 'اضف البوت إلى مجموعتك ➕', url = 't.me/'..UserBot..'?startgroup=new'}}}}
return send(msg_chat_id, msg_id, Redis:get(Fast.."Start:Bot"), "md", false, false, false, false, reply_markup)
end
else
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '• قسم المطور الاساسي •', callback_data = msg.sender_id.user_id.."/almotawerr"}},
{{text = '• قـسـم الاحـصـائـيـات •', callback_data = msg.sender_id.user_id.."/ahsa"},{text = '• قسم البوت •', callback_data = msg.sender_id.user_id.."/bbootu"}},
{{text = '• قسم الاذاعه •', callback_data = msg.sender_id.user_id.."/aqqweo"}},
{{text = '• قسم ردود البوت •', callback_data = msg.sender_id.user_id.."/rdooody"},{text = '• قسم رتب البوت •', callback_data = msg.sender_id.user_id.."/rtabe"}},
{{text = '• قسم السورس •', callback_data = msg.sender_id.user_id.."/sooorce"},},
{{text = '• التفعيل و التعطيل •', callback_data = msg.sender_id.user_id.."/taf_tat"},{text = '• الاشتراك الاجباري •', callback_data = msg.sender_id.user_id.."/ashtaerak"}},
{{text = '• قسم الملفات •', callback_data = msg.sender_id.user_id.."/mlfaat"},},}
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
local selva = "*• اهلا بك عزيزي المطور ⦉ "..Text.." ⦊\n\n• يمكنك التحكم في البوت من خلال الازرار\n• لتغير الكيبورد اضغط ⦉ /selva ⦊\n• لترويج الميوزك اضغط ⦉ /music ⦊*"
local m = "https://t.me/UOUSOU/72"
local phho = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendvideo?chat_id="..msg_chat_id.."&caption="..URL.escape(selva).."&video="..m.."&reply_to_message_id="..phho.."&parse_mode=Markdown&reply_markup="..JSON.encode(keyboard)) 
end
end
if text == '/selva' or text == '𓏺 ʙᴀᴄᴋ .' then
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
local txxt = "*• اهلا بك عزيزي المطور ⦉ "..Text.." ⦊\n• يمكنك التحكم في البوت من خلال الازرار*"
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{{text = '• تغير الڪيبورد •',type = 'text'}},
{{text = '• قسم المطور الاساسي •',type = 'text'}},
{{text = '• قـسـم الاحـصـائـيـات •',type = 'text'},{text = '• قسم البوت •', type = 'text'}},
{{text = '• قسم الاذاعه •', type ='text'}},
{{text = ' • قسم ردود البوت •',type = 'text'},{text = '• قسم رتب البوت •', type = 'text'}},
{{text = '• قسم السورس •',type = 'text'}},
{{text = '• التفعيل و التعطيل •',type = 'text'},{text = '• الاشتراك الاجباري •', type ='text'}},
{{text = '• قسم الملفات •',type = 'text'}}}}
return send(msg_chat_id,0,txxt,'md', false, false, false, false, reply_markup)
end

---------------------------------------------------------------
if msg.Asasy then 
if text == '• قسم المطور الاساسي •' then
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{{text = '• تغيير المطور الاساسي',type = 'text'},},
{{text = "ضع صوره للترحيب •",type = 'text'},},
{{text = "• معلومات التنصيب •",type = 'text'},},
{{text = '• تغير اونلاين •',type = 'text'},},
{{text = 'الغاء الامر •',type = 'text'},},
{{text = '𓏺 ʙᴀᴄᴋ .',type = 'text'},},}}
return send(msg_chat_id,msg_id,'• اهلا بك عزيزي المطور الاساسي • \n• إليك قسم ( *المطور الاساسي* ) اختر الان • ', 'md', false, false, false, false, reply_markup)
elseif text == '• قسم البوت •' then
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{{text = 'تفعيل البوت بصوره •',type = 'text'},{text = 'تعطيل البوت بصوره •', type = 'text'},},
{{text = 'تغيير كليشه ستارت •',type = 'text'},{text = 'مسح كليشه ستارت •', type = 'text'},},
{{text = 'تغيير اسم البوت •',type = 'text'},{text = 'مسح اسم البوت •', type = 'text'},},
{{text = 'الغاء',type = 'text'},},
{{text = '𓏺 ʙᴀᴄᴋ .',type = 'text'},},}}
return send(msg_chat_id,msg_id,'• اهلا بك عزيزي المطور الاساسي • \n• إليك قسم ( *البوت* ) اختر الان • ', 'md', false, false, false, false, reply_markup)
elseif text == '• قـسـم الاحـصـائـيـات •' then
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{{text = 'الاحصائيات •',type = 'text'},},
{{text = 'مجموعات',type = 'text'},{text = 'المشتركين', type = 'text'},},
{{text = '• ترند الجروبات •',type = 'text'},},
{{text = 'تنظيف المجموعات •',type = 'text'},{text = 'تنظيف المشتركين •', type = 'text'},},
{{text = 'جلب الردود العامه',type = 'text'},{text = 'جلب نسخه الردود', type = 'text'},},
{{text = 'جلب النسخه الاحتياطيه •',type = 'text'},},
{{text = '𓏺 ʙᴀᴄᴋ .',type = 'text'},},}}
return send(msg_chat_id,msg_id,'• اهلا بك عزيزي المطور الاساسي • \n• إليك قسم ( *احصائيات وتعداد* ) البوت • ', 'md', false, false, false, false, reply_markup)
elseif text == '• قسم رتب البوت •' then
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{{text = 'المطورين الاساسيين',type = 'text'},},
{{text = 'المطورين الثانويين',type = 'text'},{text = 'المطورين', type = 'text'},},
{{text = 'المدراء',type = 'text'},{text = 'المالكين', type = 'text'},},
{{text = 'المنشئين',type = 'text'},{text = 'المنشئين الاساسيين', type = 'text'},},
{{text = 'المكـتومين عام',type = 'text'},{text = 'المحظورين عام', type = 'text'},},
{{text = 'المميزين',type = 'text'},{text = 'الادمنيه', type = 'text'},},
{{text = 'قسم حذف ( الرتب ) اون لاين',type = 'text'},},
{{text = '𓏺 ʙᴀᴄᴋ .',type = 'text'},},}}
return send(msg_chat_id,msg_id,'• اهلا بك عزيزي المطور الاساسي • \n• إليك قسم ( *الرتب وحذفها* ) اختر الان • ', 'md', false, false, false, false, reply_markup)
elseif text == '• قسم ردود البوت •' then
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{{text = 'اضف رد عام •',type = 'text'},{text = 'مسح رد عام •', type = 'text'},},
{{text = 'الردود العامه •',type = 'text'},{text = 'مسح الردود العامه •', type = 'text'},},
{{text = '𓏺 ʙᴀᴄᴋ .',type = 'text'},},}}
return send(msg_chat_id,msg_id,'• اهلا بك عزيزي المطور الاساسي • \n• إليك قسم ( *الردود الخاصه* ) بالبوت • ', 'md', false, false, false, false, reply_markup)
elseif text == '• التفعيل و التعطيل •' then
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{{text = 'تفعيل التواصل •',type = 'text'},{text = 'تعطيل التواصل •', type = 'text'},},
{{text = 'تفعيل البوت الخدمي •',type = 'text'},{text = 'تعطيل البوت الخدمي •', type = 'text'},},
{{text = '• تفعيل جلب النسخه التلقائي •',type = 'text'},},
{{text = '• تعطيل جلب النسخه التلقائي •', type = 'text'},},
{{text = '𓏺 ʙᴀᴄᴋ .',type = 'text'},},}}
return send(msg_chat_id,msg_id,'• اهلا بك عزيزي المطور الاساسي • \n• إليك قسم ( *التفعيل والتعطيل* ) اختر الأن • ', 'md', false, false, false, false, reply_markup)
elseif text == '• الاشتراك الاجباري •' then
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{{text = 'الاشتراك الاجباري •',type = 'text'},{text = 'تغيير الاشتراك الاجباري •',type = 'text'},},
{{text = 'تفعيل الاشتراك الاجباري •',type = 'text'},{text = 'تعطيل الاشتراك الاجباري •',type = 'text'},},
{{text = 'تفعيل وضع اشتراك الاعضاء',type = 'text'},{text = 'تعطيل وضع اشتراك الاعضاء',type = 'text'},},
{{text = 'الغاء',type = 'text'},},
{{text = '𓏺 ʙᴀᴄᴋ .',type = 'text'},},}}
return send(msg_chat_id,msg_id,'• اهلا بك عزيزي المطور الاساسي • \n• إليك قسم ( *الاشتراك الاجباري* ) للبوت • ', 'md', false, false, false, false, reply_markup)
elseif text == '• قسم السورس •' then
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{{text = 'تعيين قناه السورس •',type = 'text'},{text = 'تعيين مطور السورس •', type = 'text'},},
{{text = 'تعيين رمز السورس •',type = 'text'},{text = 'حذف رمز السورس •',type = 'text'},},
{{text = 'سورس',type = 'text'},},
{{text = 'قناه السورس',type = 'text'},{text = 'مبرمج السورس', type = 'text'},},
{{text = 'الغاء الامر •',type = 'text'},},
{{text = '𓏺 ʙᴀᴄᴋ .',type = 'text'},},}}
return send(msg_chat_id,msg_id,'• اهلا بك عزيزي المطور الاساسي • \n• إليك قسم ( *الخاص بالسورس* ) اختر الان • ', 'md', false, false, false, false, reply_markup)
elseif text == '• قسم الملفات •' then
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{{text = 'الملفات',type = 'text'},},
{{text = 'تحديث الملفات •',type = 'text'},{text = 'تحديث السورس •', type = 'text'},},
{{text = 'تعطيل ملف all.lua',type = 'text'},{text = 'تفعيل ملف all.lua', type = 'text'},},
{{text = 'تعطيل ملف bank.lua',type = 'text'},{text = 'تفعيل ملف bank.lua', type = 'text'},},
{{text = 'تعطيل ملف games.lua',type = 'text'},{text = 'تفعيل ملف games.lua', type = 'text'},},
{{text = 'تعطيل ملف gif.lua',type = 'text'},{text = 'تفعيل ملف gif.lua', type = 'text'},},
{{text = 'تعطيل ملف rdod.lua',type = 'text'},{text = 'تفعيل ملف rdod.lua', type = 'text'},},
{{text = ' تعطيل ملف Reply.lua',type = 'text'},{text = 'تفعيل ملف Reply.lua', type = 'text'},},
{{text = 'تعطيل ملف zhrfa.lua',type = 'text'},{text = 'تفعيل ملف zhrfa.lua', type = 'text'},},
{{text = 'تعطيل ملف zwag.lua',type = 'text'},{text = 'تفعيل ملف zwag.lua', type = 'text'},},
{{text = ' تعطيل ملف smsm.lua',type = 'text'},{text = 'تفعيل ملف smsm.lua', type = 'text'},},
{{text = 'تعطيل ملف convert.lua',type = 'text'},{text = 'تفعيل ملف convert.lua', type = 'text'},},
{{text = 'تعطيل ملف auto_lock.lua',type = 'text'},{text = 'تفعيل ملف auto_lock.lua', type = 'text'},},
{{text = 'تعطيل ملف youtube.lua',type = 'text'},{text = 'تفعيل ملف youtube.lua', type = 'text'},},
{{text = 'تعطيل ملف commands.lua',type = 'text'},{text = 'تفعيل ملف commands.lua', type = 'text'},},
{{text = 'تعطيل ملف change_name.lua',type = 'text'},{text = 'تفعيل ملف change_name.lua', type = 'text'},},
{{text = '𓏺 ʙᴀᴄᴋ .',type = 'text'},},}}
return send(msg_chat_id,msg_id,'• اهلا بك عزيزي المطور الاساسي • \n• إليك قسم ( *الملفات* ) اختر الان • ', 'md', false, false, false, false, reply_markup)
end
end

end
return {Fast = start}