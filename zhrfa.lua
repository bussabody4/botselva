function zhrfa(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(Fast.."Name:Bot") or "سيلفا") 
text = msg.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text) or Redis:get(Fast.."All:Get:Reides:Commands:Group"..text)
if neww then
text = neww or text
end
end
if text == "تعطيل الزخرفه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if Redis:get(Fast..'zhrfa'..msg.chat_id)  then
send(msg_chat_id,msg_id, '• تم تعطيل امر الزخرفه مسبقا\n ✓',"md")
else
Redis:set(Fast.."zhrfa"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '• تم تعطيل امر الزخرفه\n ✓',"md")
end
end
if text == "تفعيل الزخرفه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if not Redis:get(Fast..'zhrfa'..msg.chat_id)  then
send(msg_chat_id,msg_id, '• تم تفعيل امر الزخرفه مسبقا\n ✓',"md")
else
Redis:del(Fast.."zhrfa"..msg.chat_id)
send(msg_chat_id,msg_id, '• تم تفعيل امر الزخرفه\n ✓',"md")
end
end
-- zk
if text == "زخرفه" or text == "زخرفة" then
local ban = bot.getUser(senderr)
local Name = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '↰ زخرفه عادي 🖌️', data = senderr..'/normal_zk'},},
{{text = '↰ زخرفه انلاين 🐣', data = senderr..'/inline_zk'},},
{{text = '↰ زخرفه جاهزه ✒️', data = senderr..'/decor'},},
}
}
return send(msg_chat_id,msg_id,"*مرحبا ⇿* "..Name.." 👋\n* ✧ اختار نوع الزخرفه الان*","md",false ,false ,false ,false ,reply_markup) 
end
-- Anubis zk
if text and Redis:get(Fast..msg_chat_id..msg.sender_id.user_id.."zkrf:") == "zAnubis" then
Redis:del(Fast..msg_chat_id..msg.sender_id.user_id.."zkrf:")
Redis:set(Fast..msg_chat_id..msg.sender_id.user_id.."zkrf:text", text)
local api = io.popen('curl -s "https://anubis.fun/api/zkhrfa-pro.php?text='..URL.escape(text)..'"'):read('*a')
local zkrf = JSON.decode(api)
local anubis = ""
for k,v in pairs(zkrf.Anubis) do
if tonumber(k) < 25 then
anubis = anubis.."📍: `"..v.."`\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = "التالي" , data = msg.sender_id.user_id.."/AnubisZnext"}}}
}
return send(msg_chat_id,msg_id, "• اختࢪ الزخࢪفھـۃ التي تࢪيدها:\n\n"..anubis,"md",true,false,false,false,false,reply_markup)
end
-- z eng
if text and text:match("%a") and Redis:get(Fast..msg_chat_id..msg.sender_id.user_id.."zkrf:") == "zeng" then
  Redis:del(Fast..msg_chat_id..msg.sender_id.user_id.."zkrf:")
  Redis:set(Fast..msg_chat_id..msg.sender_id.user_id.."zkrf:text", text)
  local api = io.popen('curl -s "https://anubis.fun/api/zkhrfa.php?text='..URL.escape(text)..'"'):read('*a')
  print(api)
  local zkrf = JSON.decode(api)
  local inline_anubis = {data = {}}
for k,v in pairs(zkrf.anubis) do
  inline_anubis[k] = {{text = v , data = msg.sender_id.user_id.."/az"..k}}
  end
  local reply_markup = bot.replyMarkup{
      type = 'inline',
      data = inline_anubis
      }
    return send(msg_chat_id,msg_id, "• اختࢪ الزخࢪفھـۃ التي تࢪيدها\n ▽ "..#zkrf['anubis'],"md",true,false,false,false,false,reply_markup)
end
-- z ar 
if text and not text:match("%a") and Redis:get(Fast..msg_chat_id..msg.sender_id.user_id.."zkrf:") == "zar" then
  Redis:del(Fast..msg_chat_id..msg.sender_id.user_id.."zkrf:")
  Redis:set(Fast..msg_chat_id..msg.sender_id.user_id.."zkrf:text", text)
  local api = io.popen('curl -s "https://anubis.fun/api/zkhrfa.php?text='..URL.escape(text)..'"'):read('*a')
  local zkrf = JSON.decode(api)
  local inline_anubis = {data = {}}
  for k,v in pairs(zkrf.anubis) do
    inline_anubis[k] = {{text = v , data = msg.sender_id.user_id.."/az"..k}}
    end
    local reply_markup = bot.replyMarkup{
        type = 'inline',
        data = inline_anubis
        }
    return send(msg_chat_id,msg_id, "• اختࢪ الزخࢪفھـۃ التي تࢪيدها\n ▽","md",true,false,false,false,false,reply_markup)
end
if text == "استيراد زخرفه السورس" then 
if not msg.The_Controller then
return send(msg_chat_id,msg_id,'\n*•︙هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)
end
if Redis:get(Fast.."zk_deffult") then
return send(msg_chat_id,msg_id,'•︙تم استيراد قائمه الزخرفه مسبقا',"md",true)
end
local zk_list = {
    "###",
    "𓂄𓆩###𓆪𓂁",
    "𓆩⸤###⸥𓆪",
    "𓆩###𓆪",
    "ꔷ ### ’♥", 
    "ꔷ ### ˝♥›.", 
    "➹ ### 𓂄𓆩♥𓆪‌‌𓂁", 
    "★⃝▷ ### ꗛ", 
    "⋆⃟▷ ### ꕸ",
    "⸢ ### ⸥",
    "ꞏ ### ｢♥｣",
    "⋆ ### ’🧸💕›",
    " ᯓ 𓆩 ˹ ### ˼ 𓆪 𓆃",
    "𓆩 ###ｌ➝ ˛⁽♥₎ 𓆪",
    "𒅒 !! ###  ᵛ͢ᵎᵖ 𒅒",
    "˚₊· ͟͟͞͞➳❥❬ ### ❭°",
    "ᥫ᭡ 𖥻 ### ۰ ໋࣭ヾ",
    "- َ### 𓍲 🎀.",
    "#;ُِ ### .𓇼",
  }
for i = 1 , #zk_list , 1 do
Redis:sadd(Fast.."zk_list:", zk_list[i])
end
Redis:set(Fast.."zk_deffult", true)
return send(msg_chat_id,msg_id,"•︙تم استيراد جميع الزخارف","md",true)  
end

local EmojeS = {
' •🌱💚﴿ֆ ❥',
'🍿﴿ֆ ❥',
'• 🌸💸 ❥˓  ',
'🖤🌞﴿ֆ',
' • 🐼🌿﴾ֆ',
' •🙊💙﴿ֆ ❥', 
'-💁🏼‍♂️✨﴿ֆ ❥ ', 
'•|• 〄💖‘',
' ⚡️?? •|•℡', 
'- ⁽🙆‍♂️✨₎ֆ', 
'❥┇💁🏼‍♂️🔥“', 
'💜💭℡ֆ', 
'-┆💙🙋🏼‍♂️♕', 
'- ⁽🙆🏻🍿₎ֆ',
'“̯ 🐼💗 |℡',
'⁞ 🐝🍷',
'┋⁽❥̚͢₎ 🐣💗', 
'•|• ✨🌸‘',
'  ֆ 💭💔ۦ',
'ֆ 💛💭ۦ', 
'ֆ ⚡️🔱ۦ',
'℡ᴖ̈💜✨⋮', 
'⋮⁽🌔☄️₎ۦ˛',
'⁞❉💥┋♩',
' ⁞✦⁽☻🔥₎“ٰۦ',
'℡ ̇₎ ✨??⇣✦',
'⁞♩⁽🌞🌩₎⇣✿',
'ۦٰ‏┋❥ ͢˓🦁💛ۦ‏',
'⚡️♛ֆ₎',
'♛⇣🐰☄️₎✦',
'⁾⇣✿💖┊❥',
' ₎✿💥😈 ⁞“❥', 
'😴🌸✿⇣',
'❥┊⁽ ℡🦁🌸'
}

local Emoje = {
'║👹💥ᵛ͢ᵎᵖ ⌯﴾❥',
'₎??🍥۶ֆ',
'♩┊💎🌸❥ ₎',
'₎•😻🌸⇣',
'┊🏻“👄🌺) ℡',
'❥ֆ☄⚡️ ᴗ̈',
'❥•َ⚡️ْ🦇️͢ֆ⸽',
'♜🌸🐝 ⁞',
'║♜💛⚡️͢₎⇣✿ ⁞',
'⌯⇣✿💙☄ ⁞﴾❥',
'¦⇣👽♜͢ ⁞',
'❥•َْ👻⚡️͢⸽۶ֆ',
'ֆ⸽♜👹🔥͢₎⇣',
'⌯⇣✿💙☄ ⁞﴾❥',
'♛⌗👽ᵛ🚀﴾⌯',
' ❀🎼🌸℡³¹³',
' ⁞ 🐝🍷',
'• 🐼🌿﴾ֆ',
'🐳🍥۶',
'┊•🏎️‘’💛',
'❥┊⁽ ℡🦁??',
'😴🌸✿⇣',
'₎•😻🌸⇣',
'💁🏼‍♂️✨﴿ֆ ❥',
'┆💙🙋🏼‍♂️♕',
'➤🙇🏼ֆ﴾',
'˛⁽💆🏻‍♂🌙₎⇣✿',
'ཻ ☫ٰ⇣🐼💙ֆ℠',
'℡ 🌞🔥‎‏ ⁾┊',
'┊💎🌸❥ ₎',
'∬💛✨ֆ',
'🌸💸 ❥˓',
' ⁽࿑♚꫶😼ֆ﴾',
'❥•َ⚡️🦇️ֆ⸽',
'🍿﴿ֆ ❥',
'ᵛ͢ᵎᵖ📯💛﴾'
}
if Redis:get(Fast..":ZhrfNow:ar"..msg.sender_id.user_id) then
Redis:del(Fast..":ZhrfNow:ar"..msg.sender_id.user_id)
if string.len(text) > 300 then
return send(msg_chat_id,msg_id,"• لا يمكنك زخرفه اكثر من 20 حرف \n• ارسل امر زخرفه وحاول مجددا بحروف اقل","md",true)      
elseif text:match("\n") then
return send(msg_chat_id,msg_id,"• لا يمكن زخرفه نص يحتوي على اكثر من سطر .","md",true)  
end
local Zh_Ar13 = text:gsub('ض', 'ضِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('ص', 'صِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('ث', 'ثِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('ق', 'قِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('ف', 'فِٰ͒ــ')
Zh_Ar13 = Zh_Ar13:gsub('غ', 'غِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('ع', 'عِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('خ', 'خِٰ̐ــ')
Zh_Ar13 = Zh_Ar13:gsub('ح', 'حِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('ج', 'جِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('ش', 'شِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('س', 'سِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('ي', 'يِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('ب', 'بِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('ل', 'لِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('ا', 'آ')
Zh_Ar13 = Zh_Ar13:gsub('ت', 'تِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('ن', 'نِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('م', 'مِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('ك', 'ڪِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('ط', 'طِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('ظ', 'ظِٰــ')
Zh_Ar13 = Zh_Ar13:gsub('ء', 'ء')
Zh_Ar13 = Zh_Ar13:gsub('ؤ', 'ؤ')
Zh_Ar13 = Zh_Ar13:gsub('ر', 'ر')
Zh_Ar13 = Zh_Ar13:gsub('ى', 'ى')
Zh_Ar13 = Zh_Ar13:gsub('ز', 'ز')
Zh_Ar13 = Zh_Ar13:gsub('و', 'ﯛ̲୭')
Zh_Ar13 = Zh_Ar13:gsub("ه", "໋۠هہؚ")
local Zh_Ar12 = text:gsub('ا','آ')
Zh_Ar12 = Zh_Ar12:gsub("ب","بّہ")
Zh_Ar12 = Zh_Ar12:gsub("ت","تَہَٰ")
Zh_Ar12 = Zh_Ar12:gsub("ح","حہٰٰ")
Zh_Ar12 = Zh_Ar12:gsub("ج","جْۧ")
Zh_Ar12 = Zh_Ar12:gsub("خ","خٰ̐ہ")
Zh_Ar12 = Zh_Ar12:gsub("د","د")
Zh_Ar12 = Zh_Ar12:gsub("ذ","ذِ")
Zh_Ar12 = Zh_Ar12:gsub("ر","ر")
Zh_Ar12 = Zh_Ar12:gsub("ز","زَ")
Zh_Ar12 = Zh_Ar12:gsub("س","سٰٰٓ")
Zh_Ar12 = Zh_Ar12:gsub("ش","شِٰہٰٰ")
Zh_Ar12 = Zh_Ar12:gsub("ص","صۛہٰٰ")
Zh_Ar12 = Zh_Ar12:gsub("ض","ضۜہٰٰ")
Zh_Ar12 = Zh_Ar12:gsub("ظ","ظۗہٰٰ")
Zh_Ar12 = Zh_Ar12:gsub("غ","غہٰٰ")
Zh_Ar12 = Zh_Ar12:gsub("ف","ف͒ہٰٰ")
Zh_Ar12 = Zh_Ar12:gsub("ق","قྀ̲ہٰٰٰ")
Zh_Ar12 = Zh_Ar12:gsub("ك","ڪٰྀہٰٰٖ")
Zh_Ar12 = Zh_Ar12:gsub("ل","ل")
Zh_Ar12 = Zh_Ar12:gsub("ن","نَِٰہٰ")
Zh_Ar12 = Zh_Ar12:gsub("ه","ھہ")
Zh_Ar12 = Zh_Ar12:gsub("و","وِ")
Zh_Ar12 = Zh_Ar12:gsub("طۨہٰٰ","ط")
Zh_Ar12 = Zh_Ar12:gsub("ث","ثہٰٰ")
Zh_Ar12 = Zh_Ar12:gsub("ي","يِٰہ")
Zh_Ar12 = Zh_Ar12:gsub("ع","؏ۤـہٰٰ")
local Zh_Ar11 = text:gsub('ض', 'ضُ͠')
Zh_Ar11 = Zh_Ar11:gsub('ص', 'صّ͠')
Zh_Ar11 = Zh_Ar11:gsub('ث', 'ثُ͠')
Zh_Ar11 = Zh_Ar11:gsub('ق', 'ق͠')
Zh_Ar11 = Zh_Ar11:gsub('ف', 'ف͠')
Zh_Ar11 = Zh_Ar11:gsub('غ', 'غ͠')
Zh_Ar11 = Zh_Ar11:gsub('ع', 'ع͠')
Zh_Ar11 = Zh_Ar11:gsub('خ', 'ٌخ͠')
Zh_Ar11 = Zh_Ar11:gsub('ح', 'حُ͠')
Zh_Ar11 = Zh_Ar11:gsub('ج', 'جْ͠')
Zh_Ar11 = Zh_Ar11:gsub('ش', 'شِ͠')
Zh_Ar11 = Zh_Ar11:gsub('س', 'سِ͠')
Zh_Ar11 = Zh_Ar11:gsub('ي', 'ي͠')
Zh_Ar11 = Zh_Ar11:gsub('ب', 'بّ͠')
Zh_Ar11 = Zh_Ar11:gsub('ل', 'ل͠')
Zh_Ar11 = Zh_Ar11:gsub('ا', 'ا')
Zh_Ar11 = Zh_Ar11:gsub('ت', 'تْ͠')
Zh_Ar11 = Zh_Ar11:gsub('ن', 'ن͠')
Zh_Ar11 = Zh_Ar11:gsub('م', 'م͠')
Zh_Ar11 = Zh_Ar11:gsub('ك', 'گ͠')
Zh_Ar11 = Zh_Ar11:gsub('طِ', 'ط͠')
Zh_Ar11 = Zh_Ar11:gsub('ظ', 'ظٌ͠')
Zh_Ar11 = Zh_Ar11:gsub('ء', '͠ء')
Zh_Ar11 = Zh_Ar11:gsub('وَ', 'و͠')
Zh_Ar11 = Zh_Ar11:gsub('ر', 'ر͠')
Zh_Ar11 = Zh_Ar11:gsub('ى', '͠ى')
Zh_Ar11 = Zh_Ar11:gsub('ز', 'ز͠')
Zh_Ar11 = Zh_Ar11:gsub('ض','ض͠')
Zh_Ar11 = Zh_Ar11:gsub('و', 'وَ͠')
Zh_Ar11 = Zh_Ar11:gsub("ه", "ه͠")
local Zh_Ar10 = text:gsub('ض', 'ضِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('ص', 'صِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('ث', 'ثِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('ق', 'قِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('ف', 'فِ͒ـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('غ', 'غِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('ع', 'عِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('خ', 'خِ̐ـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('ح', 'حِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('ج', 'جِـٰٚـِِـٰٚـِْ')
Zh_Ar10 = Zh_Ar10:gsub('ش', 'شِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('س', 'سِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('ي', 'يِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('ب', 'بِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('ل', 'لِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('ا', 'آ')
Zh_Ar10 = Zh_Ar10:gsub('ت', 'تِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('ن', 'نِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('م', 'مِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('ك', 'ڪِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('ط', 'طِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('ذ', 'ذِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('ظ', 'ظِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('ء', 'ء')
Zh_Ar10 = Zh_Ar10:gsub('ؤ', 'ؤ')
Zh_Ar10 = Zh_Ar10:gsub('ر', 'ر')
Zh_Ar10 = Zh_Ar10:gsub('ى', 'ى')
Zh_Ar10 = Zh_Ar10:gsub('ز', 'ز')
Zh_Ar10 = Zh_Ar10:gsub('ظ', 'ظِـٰٚـ')
Zh_Ar10 = Zh_Ar10:gsub('و', 'ﯛ̲୭')
Zh_Ar10 = Zh_Ar10:gsub("ه", "ۿۿہ")
local Zh_Ar9  = text:gsub('ض', 'ض')
Zh_Ar9 = Zh_Ar9:gsub('ص', 'صہٰ')
Zh_Ar9 = Zh_Ar9:gsub('ث', 'ثہٰـ')
Zh_Ar9 = Zh_Ar9:gsub('ق', 'قہٰ')
Zh_Ar9 = Zh_Ar9:gsub('ف', 'فہٰ')
Zh_Ar9 = Zh_Ar9:gsub('غ', 'غـْ')
Zh_Ar9 = Zh_Ar9:gsub('ع', 'ع')
Zh_Ar9 = Zh_Ar9:gsub('ه', 'هٰہٰٖ')
Zh_Ar9 = Zh_Ar9:gsub('خ', 'خخَـ')
Zh_Ar9 = Zh_Ar9:gsub('ح', 'حہٰ')
Zh_Ar9 = Zh_Ar9:gsub('ج', 'ججہٰ')
Zh_Ar9 = Zh_Ar9:gsub('د', 'دَ')
Zh_Ar9 = Zh_Ar9:gsub('ذ', 'ذّ')
Zh_Ar9 = Zh_Ar9:gsub('ش', 'ششہٰ')
Zh_Ar9 = Zh_Ar9:gsub('س', 'سہٰ')
Zh_Ar9 = Zh_Ar9:gsub('ي', 'يٰ')
Zh_Ar9 = Zh_Ar9:gsub('ب', 'بٰٰ')
Zh_Ar9 = Zh_Ar9:gsub('ل', 'لہٰ')
Zh_Ar9 = Zh_Ar9:gsub('ا', 'آ')
Zh_Ar9 = Zh_Ar9:gsub('ت', 'تہٰ')
Zh_Ar9 = Zh_Ar9:gsub('ن', 'نہٰ')
Zh_Ar9 = Zh_Ar9:gsub('م', 'مہٰ')
Zh_Ar9 = Zh_Ar9:gsub('ك', 'ككہٰ')
Zh_Ar9 = Zh_Ar9:gsub('ط', 'طہٰ')
Zh_Ar9 = Zh_Ar9:gsub('ئ', ' ْئٰ')
Zh_Ar9 = Zh_Ar9:gsub('ء', 'ء')
Zh_Ar9 = Zh_Ar9:gsub('ؤ', 'ؤؤَ')
Zh_Ar9 = Zh_Ar9:gsub('ر', 'رَ')
Zh_Ar9 = Zh_Ar9:gsub('لا', 'لہٰا')
Zh_Ar9 = Zh_Ar9:gsub('ى', 'ىہٰ')
Zh_Ar9 = Zh_Ar9:gsub('ة', 'ة')
Zh_Ar9 = Zh_Ar9:gsub('و', 'ہٰو')
Zh_Ar9 = Zh_Ar9:gsub('ز', 'ز')
Zh_Ar9 = Zh_Ar9:gsub('ظ', 'ظہٰ')
local Zh_Ar8  = text:gsub('ض', 'ضہ')
Zh_Ar8 = Zh_Ar8:gsub('ص', 'صہ')
Zh_Ar8 = Zh_Ar8:gsub('ث', 'ثہ')
Zh_Ar8 = Zh_Ar8:gsub('ق', 'قہ')
Zh_Ar8 = Zh_Ar8:gsub('ف', 'فہ')
Zh_Ar8 = Zh_Ar8:gsub('غ', 'غہ')
Zh_Ar8 = Zh_Ar8:gsub('ع', 'عہ')
Zh_Ar8 = Zh_Ar8:gsub('خ', 'خہ')
Zh_Ar8 = Zh_Ar8:gsub('ح', 'حہ')
Zh_Ar8 = Zh_Ar8:gsub('ج', 'جہ')
Zh_Ar8 = Zh_Ar8:gsub('ش', 'شہ')
Zh_Ar8 = Zh_Ar8:gsub('س', 'سہ')
Zh_Ar8 = Zh_Ar8:gsub('ي', 'يہ')
Zh_Ar8 = Zh_Ar8:gsub('ب', 'بہ')
Zh_Ar8 = Zh_Ar8:gsub('ل', 'ل')
Zh_Ar8 = Zh_Ar8:gsub('ا', 'آ')
Zh_Ar8 = Zh_Ar8:gsub('ت', 'تہ')
Zh_Ar8 = Zh_Ar8:gsub('ن', 'نہ')
Zh_Ar8 = Zh_Ar8:gsub('م', 'مہ')
Zh_Ar8 = Zh_Ar8:gsub('ك', 'كہ')
Zh_Ar8 = Zh_Ar8:gsub('ط', 'طہ')
Zh_Ar8 = Zh_Ar8:gsub('ظ', 'ظہ')
Zh_Ar8 = Zh_Ar8:gsub('ء', 'ء')
Zh_Ar8 = Zh_Ar8:gsub('ؤ', 'ؤ')
Zh_Ar8 = Zh_Ar8:gsub('ر', 'ر')
Zh_Ar8 = Zh_Ar8:gsub('ى', 'ى')
Zh_Ar8 = Zh_Ar8:gsub('ز', 'ز')
Zh_Ar8 = Zh_Ar8:gsub('و', 'ﯛ̲୭')
Zh_Ar8 = Zh_Ar8:gsub("ه", "ۿۿہ")
local Zh_Ar7  = text:gsub('ض', 'ﺿ̭͠')
Zh_Ar7 = Zh_Ar7:gsub('ص', 'ﺻ͡')
Zh_Ar7 = Zh_Ar7:gsub('ث', 'ﺜ̲')
Zh_Ar7 = Zh_Ar7:gsub('ق', 'ﭰ')
Zh_Ar7 = Zh_Ar7:gsub('ف', 'ﻓ̲')
Zh_Ar7 = Zh_Ar7:gsub('غ', 'ﻏ̲')
Zh_Ar7 = Zh_Ar7:gsub('ع', 'ﻌ̲')
Zh_Ar7 = Zh_Ar7:gsub('ه', 'ﮬ̲̌')
Zh_Ar7 = Zh_Ar7:gsub('خ', 'خٌ')
Zh_Ar7 = Zh_Ar7:gsub('ح', 'ﺣ̅')
Zh_Ar7 = Zh_Ar7:gsub('ج', 'جُ')
Zh_Ar7 = Zh_Ar7:gsub('د', 'ډ̝')
Zh_Ar7 = Zh_Ar7:gsub('ذ', 'ذً')
Zh_Ar7 = Zh_Ar7:gsub('ش', 'ﺷ̲')
Zh_Ar7 = Zh_Ar7:gsub('س', 'ﺳ̉')
Zh_Ar7 = Zh_Ar7:gsub('ي', 'ﯾ̃̐')
Zh_Ar7 = Zh_Ar7:gsub('ب', 'ﺑ̲')
Zh_Ar7 = Zh_Ar7:gsub('ل', 'ا̄ﻟ')
Zh_Ar7 = Zh_Ar7:gsub('ا', 'ﺈ̃')
Zh_Ar7 = Zh_Ar7:gsub('ت', 'ټُ')
Zh_Ar7 = Zh_Ar7:gsub('ن', 'ﻧ̲')
Zh_Ar7 = Zh_Ar7:gsub('م', 'ﻣ̲̉')
Zh_Ar7 = Zh_Ar7:gsub('ك', 'گ')
Zh_Ar7 = Zh_Ar7:gsub('ط', 'ﻁ̲')
Zh_Ar7 = Zh_Ar7:gsub('ئ', ' ْٰئ')
Zh_Ar7 = Zh_Ar7:gsub('ء', 'ء')
Zh_Ar7 = Zh_Ar7:gsub('ؤ', 'ؤ')
Zh_Ar7 = Zh_Ar7:gsub('ر', 'ہڕ')
Zh_Ar7 = Zh_Ar7:gsub('لا', 'ﻟ̲ﺂ̲')
Zh_Ar7 = Zh_Ar7:gsub('ى', 'ى')
Zh_Ar7 = Zh_Ar7:gsub('ة', 'ة')
Zh_Ar7 = Zh_Ar7:gsub('و', 'ۇۈۉ')
Zh_Ar7 = Zh_Ar7:gsub('ز', 'زُ')
Zh_Ar7 = Zh_Ar7:gsub('ظ', 'ﻇ̲')
local Zh_Ar6  = text:gsub('ض', 'ض͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('ص', 'ص͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('ث', 'ث͜ـ͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('ق', 'ق͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('ف', 'ف͒͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('غ', 'غ͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('ع', 'ع͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('خ', 'خ̐͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('ح', 'ح͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('ج', 'ج͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('ش', 'ش͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('س', 'س͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('ي', 'ي͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('ب', 'ب͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('ل', 'ل͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('ا', 'آ')
Zh_Ar6 = Zh_Ar6:gsub('ت', 'ت͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('ن', 'ن͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('م', 'م͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('ك', 'ڪ͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('ط', 'ط͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('ظ', 'ظ͜ـ')
Zh_Ar6 = Zh_Ar6:gsub('ء', 'ء')
Zh_Ar6 = Zh_Ar6:gsub('ؤ', 'ؤ')
Zh_Ar6 = Zh_Ar6:gsub('ر', 'ر')
Zh_Ar6 = Zh_Ar6:gsub('ى', 'ى')
Zh_Ar6 = Zh_Ar6:gsub('ز', 'ز')
Zh_Ar6 = Zh_Ar6:gsub('ظ', 'ظـ')
Zh_Ar6 = Zh_Ar6:gsub('و', 'ﯛ̲୭')
Zh_Ar6 = Zh_Ar6:gsub("ه", "ۿۿہ")
local Zh_Ar5  = text:gsub('ض', 'ضۜہٰٰ')
Zh_Ar5 = Zh_Ar5:gsub('ص', 'ضۜہٰٰ')
Zh_Ar5 = Zh_Ar5:gsub('ث', 'ثہٰٰ')
Zh_Ar5 = Zh_Ar5:gsub('ق', 'قྀ̲ہٰٰ')
Zh_Ar5 = Zh_Ar5:gsub('ف', 'ف͒ہٰٰ')
Zh_Ar5 = Zh_Ar5:gsub('غ', 'غہٰٰ')
Zh_Ar5 = Zh_Ar5:gsub('ع', 'عہٰٰ')
Zh_Ar5 = Zh_Ar5:gsub('ه', 'هٰہٰٖ')
Zh_Ar5 = Zh_Ar5:gsub('خ', 'خٰ̐ہ ')
Zh_Ar5 = Zh_Ar5:gsub('ح', 'حہٰٰ')
Zh_Ar5 = Zh_Ar5:gsub('ج', 'جـٰ̲ـہْۧ')
Zh_Ar5 = Zh_Ar5:gsub('د', 'دٰ')
Zh_Ar5 = Zh_Ar5:gsub('ذ', 'ذِٰ')
Zh_Ar5 = Zh_Ar5:gsub('ش', 'شِٰہٰٰ')
Zh_Ar5 = Zh_Ar5:gsub('س', 'سٰٓ')
Zh_Ar5 = Zh_Ar5:gsub('ي', 'يِٰہ')
Zh_Ar5 = Zh_Ar5:gsub('ب', 'بّہ')
Zh_Ar5 = Zh_Ar5:gsub('ل', 'لـٰ̲ـہ')
Zh_Ar5 = Zh_Ar5:gsub('ا', 'آ')
Zh_Ar5 = Zh_Ar5:gsub('ت', 'تَہَٰ')
Zh_Ar5 = Zh_Ar5:gsub('ن', 'نَِہ')
Zh_Ar5 = Zh_Ar5:gsub('م', 'مٰ̲ہ')
Zh_Ar5 = Zh_Ar5:gsub('ك', 'ڪٰྀہٰٰ')
Zh_Ar5 = Zh_Ar5:gsub('ط', 'طۨہٰٰ')
Zh_Ar5 = Zh_Ar5:gsub('ئ', 'ئ ْٰ')
Zh_Ar5 = Zh_Ar5:gsub('ء', 'ء')
Zh_Ar5 = Zh_Ar5:gsub('ؤ', 'ؤ')
Zh_Ar5 = Zh_Ar5:gsub('ر', 'رَ')
Zh_Ar5 = Zh_Ar5:gsub('لا', 'لہا')
Zh_Ar5 = Zh_Ar5:gsub('ى', 'ىْ')
Zh_Ar5 = Zh_Ar5:gsub('ة', 'ة')
Zh_Ar5 = Zh_Ar5:gsub('و', 'وِٰ')
Zh_Ar5 = Zh_Ar5:gsub('ز', 'زَٰ')
Zh_Ar5 = Zh_Ar5:gsub('ظ', 'ظۗہٰٰ')
local Zh_Ar4  = text:gsub('ض', 'ضـٰ̲ـہۜہٰٰ')
Zh_Ar4 = Zh_Ar4:gsub('ص', 'صـٰ̲ـہۛہٰٰ')
Zh_Ar4 = Zh_Ar4:gsub('ث', 'ثـٰ̲ـہہٰٰ')
Zh_Ar4 = Zh_Ar4:gsub('ق', 'قـٰ̲ـہྀ̲ہٰٰ')
Zh_Ar4 = Zh_Ar4:gsub('ف', 'فـٰ̲ـہ͒ہٰٰ')
Zh_Ar4 = Zh_Ar4:gsub('غ', 'غـٰ̲ـہہٰٰ')
Zh_Ar4 = Zh_Ar4:gsub('ع', 'غـٰ̲ـہہٰٰ')
Zh_Ar4 = Zh_Ar4:gsub('ه', 'هٰہٰٖ')
Zh_Ar4 = Zh_Ar4:gsub('خ', 'خـٰ̲ـہٰ̐ہ ')
Zh_Ar4 = Zh_Ar4:gsub('ح', 'حـٰ̲ـہہٰٰ')
Zh_Ar4 = Zh_Ar4:gsub('ج', 'جـٰ̲ـہْۧ')
Zh_Ar4 = Zh_Ar4:gsub('د', 'دٰ')
Zh_Ar4 = Zh_Ar4:gsub('ذ', 'ذِٰ')
Zh_Ar4 = Zh_Ar4:gsub('ش', 'شـٰ̲ـہِٰہٰٰ')
Zh_Ar4 = Zh_Ar4:gsub('س', 'شـٰ̲ـہِٰہٰٰ')
Zh_Ar4 = Zh_Ar4:gsub('ي', 'شـٰ̲ـہِٰہٰٰ')
Zh_Ar4 = Zh_Ar4:gsub('ب', 'بـٰ̲ـہّہ')
Zh_Ar4 = Zh_Ar4:gsub('ل', 'لـٰ̲ـہ')
Zh_Ar4 = Zh_Ar4:gsub('ا', 'آ')
Zh_Ar4 = Zh_Ar4:gsub('ت', 'تـٰ̲ـہَہَٰ')
Zh_Ar4 = Zh_Ar4:gsub('ن', 'نـٰ̲ـہَِہ')
Zh_Ar4 = Zh_Ar4:gsub('م', 'مـٰ̲ـہٰ̲ہ')
Zh_Ar4 = Zh_Ar4:gsub('ك', 'ڪٰྀہٰٰ')
Zh_Ar4 = Zh_Ar4:gsub('ط', 'طـٰ̲ـہۨہٰٰ')
Zh_Ar4 = Zh_Ar4:gsub('ئ', 'ئ ْٰ')
Zh_Ar4 = Zh_Ar4:gsub('ء', 'ء')
Zh_Ar4 = Zh_Ar4:gsub('ؤ', 'ؤ')
Zh_Ar4 = Zh_Ar4:gsub('ر', 'رَ')
Zh_Ar4 = Zh_Ar4:gsub('لا', 'لہا')
Zh_Ar4 = Zh_Ar4:gsub('ى', 'ىْ')
Zh_Ar4 = Zh_Ar4:gsub('ة', 'ة')
Zh_Ar4 = Zh_Ar4:gsub('و', 'وِٰ')
Zh_Ar4 = Zh_Ar4:gsub('ز', 'زَٰ')
Zh_Ar4 = Zh_Ar4:gsub('ظ', 'ظۗہٰٰ')
local Zh_Ar3  = text:gsub('ض', 'ض')
Zh_Ar3 = Zh_Ar3:gsub('ص', 'ص')
Zh_Ar3 = Zh_Ar3:gsub('ث', 'ثہ')
Zh_Ar3 = Zh_Ar3:gsub('ق', 'ق')
Zh_Ar3 = Zh_Ar3:gsub('ف', 'فُہ')
Zh_Ar3 = Zh_Ar3:gsub('غ', 'غہ')
Zh_Ar3 = Zh_Ar3:gsub('ع', 'عہ')
Zh_Ar3 = Zh_Ar3:gsub('ه', 'هٰہٰٖ')
Zh_Ar3 = Zh_Ar3:gsub('خ', 'خہ')
Zh_Ar3 = Zh_Ar3:gsub('ح', 'حہ')
Zh_Ar3 = Zh_Ar3:gsub('ج', 'جہ')
Zh_Ar3 = Zh_Ar3:gsub('د', 'د')
Zh_Ar3 = Zh_Ar3:gsub('ذ', 'ذ')
Zh_Ar3 = Zh_Ar3:gsub('ش', 'شہ')
Zh_Ar3 = Zh_Ar3:gsub('س', 'سہ')
Zh_Ar3 = Zh_Ar3:gsub('ي', 'يہ')
Zh_Ar3 = Zh_Ar3:gsub('ب', 'بّ')
Zh_Ar3 = Zh_Ar3:gsub('ل', 'لہ')
Zh_Ar3 = Zh_Ar3:gsub('ا', 'ا')
Zh_Ar3 = Zh_Ar3:gsub('ت', 'تہ')
Zh_Ar3 = Zh_Ar3:gsub('ن', 'نٰہٰٖ')
Zh_Ar3 = Zh_Ar3:gsub('م', 'مٰہٰٖ')
Zh_Ar3 = Zh_Ar3:gsub('ك', 'كُہ')
Zh_Ar3 = Zh_Ar3:gsub('ط', 'طہ')
Zh_Ar3 = Zh_Ar3:gsub('ئ', 'ئ ْٰ')
Zh_Ar3 = Zh_Ar3:gsub('ء', 'ء')
Zh_Ar3 = Zh_Ar3:gsub('ؤ', 'ؤ')
Zh_Ar3 = Zh_Ar3:gsub('ر', 'رَ')
Zh_Ar3 = Zh_Ar3:gsub('لا', 'لہا')
Zh_Ar3 = Zh_Ar3:gsub('ى', 'ىْ')
Zh_Ar3 = Zh_Ar3:gsub('ة', 'ة')
Zh_Ar3 = Zh_Ar3:gsub('و', 'و')
Zh_Ar3 = Zh_Ar3:gsub('ز', 'ز')
Zh_Ar3 = Zh_Ar3:gsub('ظ', 'ظۗہٰٰ')
local Zh_Ar2  = text:gsub('ض', 'ضَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('ص', 'صَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('ث', 'ثَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('ق', 'قَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('ف', 'فَٰ͒ـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('غ', 'غَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('ع', 'عَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('خ', 'خَٰ̐ـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('ح', 'حَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('ج', 'جَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('ش', 'شَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('س', 'سَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('ي', 'يَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('ب', 'بَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('ل', 'لَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('ا', 'آ')
Zh_Ar2 = Zh_Ar2:gsub('ت', 'تَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('ن', 'نَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('م', 'مَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('ك', 'ڪَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('ط', 'طَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('ظ', 'ظَٰـُـٰٓ')
Zh_Ar2 = Zh_Ar2:gsub('ء', 'ء')
Zh_Ar2 = Zh_Ar2:gsub('ؤ', 'ؤ')
Zh_Ar2 = Zh_Ar2:gsub('ر', 'ر')
Zh_Ar2 = Zh_Ar2:gsub('ى', 'ى')
Zh_Ar2 = Zh_Ar2:gsub('ز', 'ز')
Zh_Ar2 = Zh_Ar2:gsub('و', 'ﯛ̲୭')
Zh_Ar2 = Zh_Ar2:gsub("ه", "ۿۿہ")
local Zh_Ar1  = text:gsub('ض', 'ضِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('ص', 'صِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('ث', 'ثِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('ق', 'قِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('ف', 'فِٰ͒ـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('غ', 'غِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('ع', 'عِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('خ', 'خِٰ̐ـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('ح', 'حِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('ج', 'جِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('ش', 'شِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('س', 'سِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('ي', 'يِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('ب', 'بِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('ل', 'لِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('ا', 'آ')
Zh_Ar1 = Zh_Ar1:gsub('ت', 'تِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('ن', 'نِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('م', 'مِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('ك', 'ڪِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('ط', 'طِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('ظ', 'ظِٰـِۢ')
Zh_Ar1 = Zh_Ar1:gsub('ء', 'ء')
Zh_Ar1 = Zh_Ar1:gsub('ؤ', 'ؤ')
Zh_Ar1 = Zh_Ar1:gsub('ر', 'ر')
Zh_Ar1 = Zh_Ar1:gsub('ى', 'ى')
Zh_Ar1 = Zh_Ar1:gsub('ز', 'ز')
Zh_Ar1 = Zh_Ar1:gsub('و', 'ﯛ̲୭')
Zh_Ar1 = Zh_Ar1:gsub("ه", "ۿۿہ")

Text_Zhrfa = '1 - `'..Zh_Ar1..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n2 - `'..Zh_Ar2..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n3 - `'..Zh_Ar3..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n4 - `'..Zh_Ar4..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n5 - `'..Zh_Ar5..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n6 - `'..Zh_Ar6..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n7 - `'..Zh_Ar7..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n8 - `'..Zh_Ar8..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n9 - `'..Zh_Ar9..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n10 - `'..Zh_Ar10..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n11 - `'..Zh_Ar11..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n12 - `'..Zh_Ar12..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n13 - `'..Zh_Ar13..' '..EmojeS[math.random(#EmojeS)]..'`'
Text_Zhrfa = Text_Zhrfa.."\n• اضغط ع الاسم ليتم النسخ \n✓"
return send(msg_chat_id,msg_id,Text_Zhrfa,"md",true)  
end

if Redis:get(Fast..":ZhrfNow:en"..msg.sender_id.user_id) then
Redis:del(Fast..":ZhrfNow:en"..msg.sender_id.user_id)
if string.len(text) > 300 then
return send(msg_chat_id,msg_id,"• لا يمكنك زخرفه اكثر من 20 حرف \n• ارسل امر زخرفه وحاول مجددا بحروف اقل","md",true)  
elseif text:match("\n") then
return send(msg_chat_id,msg_id,"• لا يمكن زخرفه نص يحتوي على اكثر من سطر .","md",true)  
end
text = text:gsub('A','a')
text = text:gsub('S','s')
text = text:gsub('D','d')
text = text:gsub('F','f')
text = text:gsub('G','g')
text = text:gsub('H','h')
text = text:gsub('J','j')
text = text:gsub('K','k')
text = text:gsub('L','l')
text = text:gsub('Q','q')
text = text:gsub('W','w')
text = text:gsub('E','e')
text = text:gsub('R','r')
text = text:gsub('T','t')
text = text:gsub('Y','y')
text = text:gsub('U','u')
text = text:gsub('I','i')
text = text:gsub('O','o')
text = text:gsub('P','p')
text = text:gsub('Z','z')
text = text:gsub('X','x')
text = text:gsub('C','c')
text = text:gsub('V','v')
text = text:gsub('B','b')
text = text:gsub('N','n')
text = text:gsub('M','m')
local Zh_En1  = text:gsub('q', '𝚀')
Zh_En1 = Zh_En1:gsub('w', '𝚆')
Zh_En1 = Zh_En1:gsub('e', '𝙴')
Zh_En1 = Zh_En1:gsub('r', '𝚁')
Zh_En1 = Zh_En1:gsub('t', '𝚃')
Zh_En1 = Zh_En1:gsub('y', '𝚈')
Zh_En1 = Zh_En1:gsub('u', '𝚄')
Zh_En1 = Zh_En1:gsub('i', '𝙸')
Zh_En1 = Zh_En1:gsub('o', '𝙾')
Zh_En1 = Zh_En1:gsub('p', '𝙿')
Zh_En1 = Zh_En1:gsub('a', '??')
Zh_En1 = Zh_En1:gsub('s', '𝚂')
Zh_En1 = Zh_En1:gsub('d', '𝙳')
Zh_En1 = Zh_En1:gsub('f', '𝙵')
Zh_En1 = Zh_En1:gsub('g', '𝙶')
Zh_En1 = Zh_En1:gsub('h', '𝙷')
Zh_En1 = Zh_En1:gsub('j', '𝙹')
Zh_En1 = Zh_En1:gsub('k', '𝙺')
Zh_En1 = Zh_En1:gsub('I', '𝙻')
Zh_En1 = Zh_En1:gsub('z', '𝚉')
Zh_En1 = Zh_En1:gsub('x', '𝚇')
Zh_En1 = Zh_En1:gsub('c', '𝙲')
Zh_En1 = Zh_En1:gsub('v', '𝚅')
Zh_En1 = Zh_En1:gsub('b', '𝙱')
Zh_En1 = Zh_En1:gsub('n', '𝙽')
Zh_En1 = Zh_En1:gsub('m', '𝙼')
local Zh_En2  = text:gsub('q','𝒒 ')
Zh_En2 = Zh_En2:gsub('w','𝒘')
Zh_En2 = Zh_En2:gsub('e','𝒆')
Zh_En2 = Zh_En2:gsub('r','𝒓')
Zh_En2 = Zh_En2:gsub('t','??')
Zh_En2 = Zh_En2:gsub('y','𝒚')
Zh_En2 = Zh_En2:gsub('u','𝒖')
Zh_En2 = Zh_En2:gsub('i','𝒊')
Zh_En2 = Zh_En2:gsub('o','𝒐')
Zh_En2 = Zh_En2:gsub('p','𝒑')
Zh_En2 = Zh_En2:gsub('a','𝒂')
Zh_En2 = Zh_En2:gsub('s','𝒔')
Zh_En2 = Zh_En2:gsub('d','𝒅')
Zh_En2 = Zh_En2:gsub('f','𝒇')
Zh_En2 = Zh_En2:gsub('g','𝒈')
Zh_En2 = Zh_En2:gsub('h','𝒉')
Zh_En2 = Zh_En2:gsub('j','𝒋')
Zh_En2 = Zh_En2:gsub('k','𝒌')
Zh_En2 = Zh_En2:gsub('l','𝒍')
Zh_En2 = Zh_En2:gsub('m','𝒎')
Zh_En2 = Zh_En2:gsub('n','𝒏')
Zh_En2 = Zh_En2:gsub('b','𝒃')
Zh_En2 = Zh_En2:gsub('v','𝒗')
Zh_En2 = Zh_En2:gsub('c','𝒄')
Zh_En2 = Zh_En2:gsub('x','𝒙')
Zh_En2 = Zh_En2:gsub('z','𝒛 ')
local Zh_En3  = text:gsub('q', '𝑄')
Zh_En3 = Zh_En3:gsub('w', '𝑊')
Zh_En3 = Zh_En3:gsub('e', '𝐸')
Zh_En3 = Zh_En3:gsub('r', '𝑅')
Zh_En3 = Zh_En3:gsub('t', '𝑇')
Zh_En3 = Zh_En3:gsub('y', '𝑌')
Zh_En3 = Zh_En3:gsub('Y', '𝑌')
Zh_En3 = Zh_En3:gsub('u', '𝐔')
Zh_En3 = Zh_En3:gsub('i', '𝐼')
Zh_En3 = Zh_En3:gsub('o', '𝑂')
Zh_En3 = Zh_En3:gsub('p', '𝑃')
Zh_En3 = Zh_En3:gsub('a', '𝐴')
Zh_En3 = Zh_En3:gsub('s', '𝑆')
Zh_En3 = Zh_En3:gsub('d', '𝐷')
Zh_En3 = Zh_En3:gsub('f', '𝐹')
Zh_En3 = Zh_En3:gsub('g', '𝐺')
Zh_En3 = Zh_En3:gsub('h', '𝐻')
Zh_En3 = Zh_En3:gsub('j', '𝐽')
Zh_En3 = Zh_En3:gsub('k', '𝐾')
Zh_En3 = Zh_En3:gsub('I', '𝐿')
Zh_En3 = Zh_En3:gsub('z', '𝑍')
Zh_En3 = Zh_En3:gsub('x', '𝑋')
Zh_En3 = Zh_En3:gsub('c', '𝐶')
Zh_En3 = Zh_En3:gsub('v', '𝑉')
Zh_En3 = Zh_En3:gsub('b', 'b')
Zh_En3 = Zh_En3:gsub('n', '𝑁')
Zh_En3 = Zh_En3:gsub('m', '𝑀')
local Zh_En4  = text:gsub('q', '𝐐')
Zh_En4 = Zh_En4:gsub('w', '𝐖')
Zh_En4 = Zh_En4:gsub('e', '𝐄')
Zh_En4 = Zh_En4:gsub('r', '𝐑')
Zh_En4 = Zh_En4:gsub('t', '𝐓')
Zh_En4 = Zh_En4:gsub('y', '𝐘')
Zh_En4 = Zh_En4:gsub('u', '𝗨')
Zh_En4 = Zh_En4:gsub('i', '𝐈')
Zh_En4 = Zh_En4:gsub('o', '𝐎')
Zh_En4 = Zh_En4:gsub('p', '𝐏')
Zh_En4 = Zh_En4:gsub('a', '𝐀')
Zh_En4 = Zh_En4:gsub('s', '𝐒')
Zh_En4 = Zh_En4:gsub('d', '𝐃')
Zh_En4 = Zh_En4:gsub('f', '𝐅')
Zh_En4 = Zh_En4:gsub('g', '𝐆')
Zh_En4 = Zh_En4:gsub('h', '𝐇')
Zh_En4 = Zh_En4:gsub('j', '𝐉')
Zh_En4 = Zh_En4:gsub('k', '𝐊')
Zh_En4 = Zh_En4:gsub('I', '𝐋')
Zh_En4 = Zh_En4:gsub('z', '𝐙')
Zh_En4 = Zh_En4:gsub('x', '𝐗')
Zh_En4 = Zh_En4:gsub('c', '𝐂')
Zh_En4 = Zh_En4:gsub('v', '𝐕')
Zh_En4 = Zh_En4:gsub('b', '𝐁')
Zh_En4 = Zh_En4:gsub('n', '𝐍')
Zh_En4 = Zh_En4:gsub('m', '𝐌')
local Zh_En5  = text:gsub('a', 'ᴀ')
Zh_En5 = Zh_En5:gsub('b', 'ʙ')
Zh_En5 = Zh_En5:gsub('c', 'ᴄ')
Zh_En5 = Zh_En5:gsub('d', 'ᴅ')
Zh_En5 = Zh_En5:gsub('e', 'ᴇ')
Zh_En5 = Zh_En5:gsub('f', 'ᴈ')
Zh_En5 = Zh_En5:gsub('g', 'ɢ')
Zh_En5 = Zh_En5:gsub('h', 'ʜ')
Zh_En5 = Zh_En5:gsub('i', 'ɪ')
Zh_En5 = Zh_En5:gsub('j', 'ᴊ')
Zh_En5 = Zh_En5:gsub('k', 'ᴋ')
Zh_En5 = Zh_En5:gsub('l', 'ʟ')
Zh_En5 = Zh_En5:gsub('m', 'ᴍ')
Zh_En5 = Zh_En5:gsub('n', 'ɴ')
Zh_En5 = Zh_En5:gsub('o', 'ᴏ')
Zh_En5 = Zh_En5:gsub('p', 'ᴘ')
Zh_En5 = Zh_En5:gsub('q', 'ᴓ')
Zh_En5 = Zh_En5:gsub('r', 'ʀ')
Zh_En5 = Zh_En5:gsub('s', 'ᴤ')
Zh_En5 = Zh_En5:gsub('t', 'ᴛ')
Zh_En5 = Zh_En5:gsub('u', 'ᴜ')
Zh_En5 = Zh_En5:gsub('v', 'ᴠ')
Zh_En5 = Zh_En5:gsub('w', 'ᴡ')
Zh_En5 = Zh_En5:gsub('x', 'ᴥ')
Zh_En5 = Zh_En5:gsub('y', 'ʏ')
Zh_En5 = Zh_En5:gsub('z', 'ᴢ')
local Zh_En6  = text:gsub('q','𝗤 ')
Zh_En6 = Zh_En6:gsub('w','𝗪')
Zh_En6 = Zh_En6:gsub('e','𝗘')
Zh_En6 = Zh_En6:gsub('r','𝗥')
Zh_En6 = Zh_En6:gsub('t','𝗧')
Zh_En6 = Zh_En6:gsub('u','𝗨')
Zh_En6 = Zh_En6:gsub('y','𝗬')
Zh_En6 = Zh_En6:gsub('l','𝗜')
Zh_En6 = Zh_En6:gsub('o','𝗢')
Zh_En6 = Zh_En6:gsub('p','𝗣')
Zh_En6 = Zh_En6:gsub('a','𝗔')
Zh_En6 = Zh_En6:gsub('s','𝗦')
Zh_En6 = Zh_En6:gsub('d','𝗗')
Zh_En6 = Zh_En6:gsub('f','𝗙')
Zh_En6 = Zh_En6:gsub('g','𝗚')
Zh_En6 = Zh_En6:gsub('h','𝗛')
Zh_En6 = Zh_En6:gsub('j','𝗝')
Zh_En6 = Zh_En6:gsub('k','𝗞')
Zh_En6 = Zh_En6:gsub('l','𝗟')
Zh_En6 = Zh_En6:gsub('m','𝗠')
Zh_En6 = Zh_En6:gsub('n','𝗡')
Zh_En6 = Zh_En6:gsub('b','𝗕')
Zh_En6 = Zh_En6:gsub('v','𝗩')
Zh_En6 = Zh_En6:gsub('c','𝗖')
Zh_En6 = Zh_En6:gsub('x','𝗫')
Zh_En6 = Zh_En6:gsub('z','𝗭 ')
local Zh_En7  = text:gsub('q','ǫ ')
Zh_En7 = Zh_En7:gsub('w','ᴡ')
Zh_En7 = Zh_En7:gsub('e','ᴇ')
Zh_En7 = Zh_En7:gsub('r','ʀ')
Zh_En7 = Zh_En7:gsub('t','ᴛ')
Zh_En7 = Zh_En7:gsub('y','ʏ')
Zh_En7 = Zh_En7:gsub('u','𝓾')
Zh_En7 = Zh_En7:gsub('i','ɪ')
Zh_En7 = Zh_En7:gsub('o','ᴏ')
Zh_En7 = Zh_En7:gsub('p','ᴘ')
Zh_En7 = Zh_En7:gsub('a','ᴀ')
Zh_En7 = Zh_En7:gsub('s','ѕ')
Zh_En7 = Zh_En7:gsub('d','ᴅ')
Zh_En7 = Zh_En7:gsub('f','ғ')
Zh_En7 = Zh_En7:gsub('g','ɢ')
Zh_En7 = Zh_En7:gsub('h','ʜ')
Zh_En7 = Zh_En7:gsub('j','ᴊ')
Zh_En7 = Zh_En7:gsub('k','ᴋ')
Zh_En7 = Zh_En7:gsub('l','ʟ')
Zh_En7 = Zh_En7:gsub('m','ᴍ')
Zh_En7 = Zh_En7:gsub('n','ɴ')
Zh_En7 = Zh_En7:gsub('b','ʙ')
Zh_En7 = Zh_En7:gsub('v','ᴠ')
Zh_En7 = Zh_En7:gsub('c','ᴄ')
Zh_En7 = Zh_En7:gsub('x','х')
Zh_En7 = Zh_En7:gsub('z','ᴢ ')
local Zh_En8  = text:gsub('q','𝗾 ')
Zh_En8 = Zh_En8:gsub('w','𝘄')
Zh_En8 = Zh_En8:gsub('e','𝗲')
Zh_En8 = Zh_En8:gsub('r','𝗿')
Zh_En8 = Zh_En8:gsub('t','𝘁')
Zh_En8 = Zh_En8:gsub('u','𝘂')
Zh_En8 = Zh_En8:gsub('y','𝘆')
Zh_En8 = Zh_En8:gsub('i',' 𝗶')
Zh_En8 = Zh_En8:gsub('o','𝗼')
Zh_En8 = Zh_En8:gsub('p','𝗽')
Zh_En8 = Zh_En8:gsub('a','𝗮')
Zh_En8 = Zh_En8:gsub('s','𝘀')
Zh_En8 = Zh_En8:gsub('d','𝗱')
Zh_En8 = Zh_En8:gsub('f','𝗳')
Zh_En8 = Zh_En8:gsub('g','𝗴')
Zh_En8 = Zh_En8:gsub('h','𝗵')
Zh_En8 = Zh_En8:gsub('j','j')
Zh_En8 = Zh_En8:gsub('k','𝗸')
Zh_En8 = Zh_En8:gsub('l','𝗹')
Zh_En8 = Zh_En8:gsub('m','𝗺')
Zh_En8 = Zh_En8:gsub('n','𝗻')
Zh_En8 = Zh_En8:gsub('b','𝗯')
Zh_En8 = Zh_En8:gsub('v','𝘃')
Zh_En8 = Zh_En8:gsub('c','𝗰')
Zh_En8 = Zh_En8:gsub('x','𝘅')
Zh_En8 = Zh_En8:gsub('z','𝘇 ')
local Zh_En9  = text:gsub('q','𝖖 ')
Zh_En9 = Zh_En9:gsub('w','𝖜')
Zh_En9 = Zh_En9:gsub('e','𝖊')
Zh_En9 = Zh_En9:gsub('r','𝖗')
Zh_En9 = Zh_En9:gsub('t','𝖙')
Zh_En9 = Zh_En9:gsub('y','𝖞')
Zh_En9 = Zh_En9:gsub('u','𝖚')
Zh_En9 = Zh_En9:gsub('i',' 𝖎')
Zh_En9 = Zh_En9:gsub('o','𝖔')
Zh_En9 = Zh_En9:gsub('p','𝖕')
Zh_En9 = Zh_En9:gsub('a','??')
Zh_En9 = Zh_En9:gsub('s','𝖘')
Zh_En9 = Zh_En9:gsub('d','𝖉')
Zh_En9 = Zh_En9:gsub('f','𝖋')
Zh_En9 = Zh_En9:gsub('g','𝖌')
Zh_En9 = Zh_En9:gsub('h','𝖍')
Zh_En9 = Zh_En9:gsub('j','𝖏')
Zh_En9 = Zh_En9:gsub('k','𝖐')
Zh_En9 = Zh_En9:gsub('l','𝖑')
Zh_En9 = Zh_En9:gsub('m','𝖒')
Zh_En9 = Zh_En9:gsub('n','𝖓')
Zh_En9 = Zh_En9:gsub('b','𝖇')
Zh_En9 = Zh_En9:gsub('v','𝖛')
Zh_En9 = Zh_En9:gsub('c','𝖈')
Zh_En9 = Zh_En9:gsub('x','𝖝')
Zh_En9 = Zh_En9:gsub('z','𝖟 ')
local Zh_En10 = text:gsub('q','ᵠ ')
Zh_En10 = Zh_En10:gsub('w','ᵂ')
Zh_En10 = Zh_En10:gsub('e','ᴱ')
Zh_En10 = Zh_En10:gsub('r','ᴿ')
Zh_En10 = Zh_En10:gsub('t','ᵀ')
Zh_En10 = Zh_En10:gsub('u','ᵁ')
Zh_En10 = Zh_En10:gsub('y','ʸ')
Zh_En10 = Zh_En10:gsub('i','ᴵ')
Zh_En10 = Zh_En10:gsub('o','ᴼ')
Zh_En10 = Zh_En10:gsub('p','ᴾ')
Zh_En10 = Zh_En10:gsub('a','ᴬ')
Zh_En10 = Zh_En10:gsub('s','ˁ')
Zh_En10 = Zh_En10:gsub('d','ᴰ')
Zh_En10 = Zh_En10:gsub('f','ᶠ')
Zh_En10 = Zh_En10:gsub('g','ᴳ')
Zh_En10 = Zh_En10:gsub('h','ᴴ')
Zh_En10 = Zh_En10:gsub('j','ᴶ')
Zh_En10 = Zh_En10:gsub('k','ᴷ')
Zh_En10 = Zh_En10:gsub('l','ᴸ')
Zh_En10 = Zh_En10:gsub('m','ᴹ')
Zh_En10 = Zh_En10:gsub('n','ᴺ')
Zh_En10 = Zh_En10:gsub('b','ᴮ')
Zh_En10 = Zh_En10:gsub('v','ᵛ')
Zh_En10 = Zh_En10:gsub('c','ᶜ')
Zh_En10 = Zh_En10:gsub('x','ˣ')
Zh_En10 = Zh_En10:gsub('z','ᶻ')
local Zh_En11 = text:gsub('q','ᑫ ')
Zh_En11 = Zh_En11:gsub('w','ᗯ')
Zh_En11 = Zh_En11:gsub('e','E')
Zh_En11 = Zh_En11:gsub('r','ᖇ')
Zh_En11 = Zh_En11:gsub('t',' T')
Zh_En11 = Zh_En11:gsub('u','ᑌ')
Zh_En11 = Zh_En11:gsub('y','Y')
Zh_En11 = Zh_En11:gsub('i','I')
Zh_En11 = Zh_En11:gsub('o','O')
Zh_En11 = Zh_En11:gsub('p','ᑭ')
Zh_En11 = Zh_En11:gsub('a','ᗩ')
Zh_En11 = Zh_En11:gsub('s',' ᔕ')
Zh_En11 = Zh_En11:gsub('d','ᗪ')
Zh_En11 = Zh_En11:gsub('f','f')
Zh_En11 = Zh_En11:gsub('g','G')
Zh_En11 = Zh_En11:gsub('h','ᕼ')
Zh_En11 = Zh_En11:gsub('j','ᒍ')
Zh_En11 = Zh_En11:gsub('k','K')
Zh_En11 = Zh_En11:gsub('l','ᒪ')
Zh_En11 = Zh_En11:gsub('m','ᗰ')
Zh_En11 = Zh_En11:gsub('n','ᑎ')
Zh_En11 = Zh_En11:gsub('b','ᗷ')
Zh_En11 = Zh_En11:gsub('v','ᐯ')
Zh_En11 = Zh_En11:gsub('c','ᑕ')
Zh_En11 = Zh_En11:gsub('x','᙭')
Zh_En11 = Zh_En11:gsub('z','ᘔ')
local Zh_En12 = text:gsub('q','ℚ ')
Zh_En12 = Zh_En12:gsub('w','𝕎')
Zh_En12 = Zh_En12:gsub('e',' 𝔼')
Zh_En12 = Zh_En12:gsub('r','ℝ')
Zh_En12 = Zh_En12:gsub('t','𝕋')
Zh_En12 = Zh_En12:gsub('u','𝕌')
Zh_En12 = Zh_En12:gsub('y',' 𝕐')
Zh_En12 = Zh_En12:gsub('i','𝕀')
Zh_En12 = Zh_En12:gsub('o','𝕆')
Zh_En12 = Zh_En12:gsub('p','ℙ')
Zh_En12 = Zh_En12:gsub('a','𝔸')
Zh_En12 = Zh_En12:gsub('s','𝕊')
Zh_En12 = Zh_En12:gsub('d','𝔻')
Zh_En12 = Zh_En12:gsub('f','𝔽')
Zh_En12 = Zh_En12:gsub('g','𝔾')
Zh_En12 = Zh_En12:gsub('h','ℍ')
Zh_En12 = Zh_En12:gsub('j','𝔾')
Zh_En12 = Zh_En12:gsub('k','𝕂')
Zh_En12 = Zh_En12:gsub('l','𝕃')
Zh_En12 = Zh_En12:gsub('m','𝕄')
Zh_En12 = Zh_En12:gsub('n','ℕ')
Zh_En12 = Zh_En12:gsub('b','𝔹')
Zh_En12 = Zh_En12:gsub('v','𝕍')
Zh_En12 = Zh_En12:gsub('c','ℂ')
Zh_En12 = Zh_En12:gsub('x',' 𝕏')
Zh_En12 = Zh_En12:gsub('z','ℤ')
local Zh_En13 = text:gsub('q','ᵟ ')
Zh_En13 = Zh_En13:gsub('w','ᵂ')
Zh_En13 = Zh_En13:gsub('e','ᴱ')
Zh_En13 = Zh_En13:gsub('r','ᴿ')
Zh_En13 = Zh_En13:gsub('t','ᵀ')
Zh_En13 = Zh_En13:gsub('y','ᵞ')
Zh_En13 = Zh_En13:gsub('u','𝐔')
Zh_En13 = Zh_En13:gsub('i','ᴵ')
Zh_En13 = Zh_En13:gsub('o','ᴼ')
Zh_En13 = Zh_En13:gsub('p','ᴾ')
Zh_En13 = Zh_En13:gsub('a','ᴬ')
Zh_En13 = Zh_En13:gsub('s','ˢ')
Zh_En13 = Zh_En13:gsub('d','ᴰ')
Zh_En13 = Zh_En13:gsub('f','ᶠ')
Zh_En13 = Zh_En13:gsub('g','ᴳ')
Zh_En13 = Zh_En13:gsub('h','ᴴ')
Zh_En13 = Zh_En13:gsub('j','ᴶ')
Zh_En13 = Zh_En13:gsub('k','ᴷ')
Zh_En13 = Zh_En13:gsub('l','ᴸ')
Zh_En13 = Zh_En13:gsub('m','ᴹ')
Zh_En13 = Zh_En13:gsub('n','ᴺ')
Zh_En13 = Zh_En13:gsub('b','ᴮ')
Zh_En13 = Zh_En13:gsub('v','ᵛ')
Zh_En13 = Zh_En13:gsub('c','ᶜ')
Zh_En13 = Zh_En13:gsub('x','ˣ')
Zh_En13 = Zh_En13:gsub('z','ᶻ')

Text_Zhrfa = '1 - `'..Zh_En1..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n2 - `'..Zh_En2..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n3 - `'..Zh_En3..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n4 - `'..Zh_En4..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n5 - `'..Zh_En5..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n6 - `'..Zh_En6..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n7 - `'..Zh_En7..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n8 - `'..Zh_En8..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n9 - `'..Zh_En9..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n10 - `'..Zh_En10..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n11 - `'..Zh_En11..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n12 - `'..Zh_En12..' '..EmojeS[math.random(#EmojeS)]..'`'..
'\n13 - `'..Zh_En13..' '..EmojeS[math.random(#EmojeS)]..'`'
Text_Zhrfa = Text_Zhrfa.."\n• اضغط ع الاسم ليتم النسخ \n✓"
return send(msg_chat_id,msg_id,Text_Zhrfa,"md",true)  
end
--- 

end
return {Fast = zhrfa}