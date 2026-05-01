--[[
]] 
function games(msg)
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
if Redis:get(Fast.."Game:Smile"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Smile"..msg.chat_id) then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(Fast.."Game:Smile"..msg.chat_id)
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مره اخره وارسل - سمايل او سمايلات","md",true)  
end
end 
if Redis:get(Fast..msg.chat_id.."answers:photo") then
if text == Redis:get(Fast..msg.chat_id.."answers:photo") then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(Fast..msg.chat_id.."answers:photo")
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مره اخره وارسل - صور","md",true)  
end
end 
if Redis:get(Fast.."Game:Monotonous"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Monotonous"..msg.chat_id) then
Redis:del(Fast.."Game:Monotonous"..msg.chat_id)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مره اخره وارسل - الاسرع او ترتيب","md",true)  
end
end 
if Redis:get(Fast.."Game:Riddles"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Riddles"..msg.chat_id) then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(Fast.."Game:Riddles"..msg.chat_id)
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مره اخره وارسل - حزوره","md",true)  
end
end
if Redis:get(Fast.."Game:Meaningof"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Meaningof"..msg.chat_id) then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(Fast.."Game:Meaningof"..msg.chat_id)
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مره اخره وارسل - معاني","md",true)  
end
end
if Redis:get(Fast.."Game:Reflection"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Reflection"..msg.chat_id) then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(Fast.."Game:Reflection"..msg.chat_id)
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مره اخره وارسل - العكس","md",true)  
end
end
if Redis:get(Fast.."Game:Alam"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Alam"..msg.chat_id) then
Redis:del(Fast.."Game:Alam"..msg.chat_id)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
return bot.sendText(msg_chat_id,msg_id,"\n • لقد فزت في اللعبه \n • اللعب مره اخره وارسل - اعلام او الاعلام","md",true)  
else
Redis:del(Fast.."Game:Alam"..msg.chat_id)
return bot.sendText(msg_chat_id,msg_id,"\n • لقد خسرت حضا اوفر في المره القادمه\n • اللعب مره اخره وارسل - اعلام او الاعلام","md",true)  
end
end 
if Redis:get(Fast.."Game:Estimate"..msg.chat_id..msg.sender_id.user_id) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
return send(msg.chat_id,msg.id,"• عذرآ لا يمكنك تخمين عدد اكبر من ال { 20 } خمن رقم ما بين ال{ 1 و 20 }\n","md",true)  
end 
local GETNUM = Redis:get(Fast.."Game:Estimate"..msg.chat_id..msg.sender_id.user_id)
if tonumber(NUM) == tonumber(GETNUM) then
Redis:del(Fast.."SADD:NUM"..msg.chat_id..msg.sender_id.user_id)
Redis:del(Fast.."Game:Estimate"..msg.chat_id..msg.sender_id.user_id)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id,5)  
return send(msg.chat_id,msg.id,"• مبروك فزت ويانه وخمنت الرقم الصحيح\n🚸︙تم اضافة { 5 } من النقاط \n","md",true)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
Redis:incrby(Fast.."SADD:NUM"..msg.chat_id..msg.sender_id.user_id,1)
if tonumber(Redis:get(Fast.."SADD:NUM"..msg.chat_id..msg.sender_id.user_id)) >= 3 then
Redis:del(Fast.."SADD:NUM"..msg.chat_id..msg.sender_id.user_id)
Redis:del(Fast.."Game:Estimate"..msg.chat_id..msg.sender_id.user_id)
return send(msg.chat_id,msg.id,"• اوبس لقد خسرت في اللعبه \n• حظآ اوفر في المره القادمه \n• كان الرقم الذي تم تخمينه { "..GETNUM.." }","md",true)  
else
return send(msg.chat_id,msg.id,"• اوبس تخمينك غلط \n• ارسل رقم تخمنه مره اخرى ","md",true)  
end
end
end
end
if Redis:get(Fast.."Game:Difference"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Difference"..msg.chat_id) then 
Redis:del(Fast.."Game:Difference"..msg.chat_id)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مره اخره وارسل - المختلف","md",true)  
end
end
if Redis:get(Fast.."Game:Example"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Example"..msg.chat_id) then 
Redis:del(Fast.."Game:Example"..msg.chat_id)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مره اخره وارسل - امثله","md",true)  
end
end
if Redis:get(Fast.."fakok:game"..msg.chat_id) then
if text == Redis:get(Fast.."fakok:game"..msg.chat_id) then
Redis:del(Fast.."fakok:game"..msg.chat_id)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مره اخره وارسل - تفكيك أو فك","md",true)  
end
end 
if text == "حجره" or text == "حجرة" then
local textPrompt = "🎮 *لعبة حجر - ورقة - مقص*\n\nاختر أحد الخيارات من الأزرار أدناه 👇"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '🪨 حجر', data = senderr..'/hagra'}},
{{text = '📄 ورقة', data = senderr..'/orka'}},
{{text = '✂️ مقص', data = senderr..'/mks'}}
}
}
return send(msg_chat_id, msg_id, textPrompt, "md", false, false, false, false, reply_markup)
end
if text == 'تفكيك' then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return bot.sendText(msg.chat_id,msg.id,"* • الالعاب معطلة من قبل المشرفين *","md",true)
end
katu = {'ا ح ب ك','ذ ئ ب','ب ع ي ر','ط ي ر','و ر د ه','ج م ي ل ','ح ل و','ب ط ر ي ق','ط م ا ط م','م و ز','س ي ا ر ة','ت ح ر ي ك','ف ل و س','ب و ت','ث ق ة','ح ل ز و ن','م ك ي ف','م ر و ح ه'
};
name = katu[math.random(#katu)]
Redis:set(Fast.."fakok:game"..msg.chat_id,name)
name = string.gsub(name,'ا ح ب ك','احبك')
name = string.gsub(name,'ا ك ر ه ك','اكرهك')
name = string.gsub(name,'ذ ئ ب','ذئب')
name = string.gsub(name,'ب ع ي ر','بعير')
name = string.gsub(name,'ط ي ر','طير')
name = string.gsub(name,'و ر د ه','ورده')
name = string.gsub(name,'ج م ي ل','جميل')
name = string.gsub(name,'ح ل و','حلو')
name = string.gsub(name,'ب ط ر ي ق','بطريق')
name = string.gsub(name,'ط م ا ط م','طماطم')
name = string.gsub(name,'م و ز','موز')
name = string.gsub(name,'س ي ا ر ة','سيارة')
name = string.gsub(name,'ت ح ر ي ك','تحريك')
name = string.gsub(name,'ف ل و س','فلوس')
name = string.gsub(name,'ب و ت','بوت')
name = string.gsub(name,'ث ق ة','ثقة')
name = string.gsub(name,'ح ل ز و ن','حلزون')
name = string.gsub(name,'م ك ي ف','مكيف')
name = string.gsub(name,'م ر و ح ه','مروحه')
return bot.sendText(msg.chat_id,msg.id,"* • اسرع واحد يفكك ⇿ "..name.." *","md",true)
end
if text == 'تركيب' then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return bot.sendText(msg.chat_id,msg.id,"* • الالعاب معطلة من قبل المشرفين *","md",true)
end
katu = {'احبك','ذئب','بعير','طير','ورده','جميل ','حلو','بطريق','طماطم','موز','سيارة','تحريك','فلوس','بوت','ثقة','حلزون','مكيف','مروحه'
};
name = katu[math.random(#katu)]
Redis:set(Fast..'Set_trkib'..msg.chat_id,name)
name = string.gsub(name,'احبك','ا ح ب ك')
name = string.gsub(name,'ذئب','ذ ئ ب')
name = string.gsub(name,'بعير','ب ع ي ر')
name = string.gsub(name,'طير','ط ي ر')
name = string.gsub(name,'ورده','و ر د ه')
name = string.gsub(name,'جميل','ج م ي ل')
name = string.gsub(name,'حلو','ح ل و')
name = string.gsub(name,'بطريق','ب ط ر ي ق')
name = string.gsub(name,'طماطم','ط م ا ط م')
name = string.gsub(name,'موز','م و ز')
name = string.gsub(name,'سيارة','س ي ا ر ة')
name = string.gsub(name,'تحريك','ت ح ر ي ك')
name = string.gsub(name,'فلوس','ف ل و س')
name = string.gsub(name,'بوت','ب و ت')
name = string.gsub(name,'ثقة','ث ق ة')
name = string.gsub(name,'حلزون','ح ل ز و ن')
name = string.gsub(name,'مكيف','م ك ي ف')
name = string.gsub(name,'مروحه','م ر و ح ه')
return bot.sendText(msg.chat_id,msg.id,"* • اسرع واحد يركب ⇿ "..name.." *","md",true)
end

if text == 'عقاب' then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
bot.sendText(msg.chat_id,msg.id,"* • الالعاب معطلة من قبل المشرفين *","md",true)
end
Redis:del(Fast..'List_Ahkamm'..msg.chat_id)
Redis:set(Fast.."raeahkamm"..msg.chat_id,senderr)
Redis:sadd(Fast..'List_Ahkamm'..msg.chat_id,senderr)
Redis:setex(Fast.."Start_Ahkamm"..msg.chat_id,3600,true)
bot.sendText(msg.chat_id,msg.id,"*• تم بدء اللعبة وتم تسجيلك \n• اللي بيلعب يرسل ( انا ) *","md",true)
end
if text == 'نعم' and Redis:get(Fast.."Witting_StartGamehh"..msg.chat_id) then
rarahkam = Redis:get(Fast.."raeahkamm"..msg.chat_id)
if tonumber(rarahkam) == senderr then
local list = Redis:smembers(Fast..'List_Ahkamm'..msg.chat_id) 
if #list == 1 then 
bot.sendText(msg.chat_id,msg.id,"*• عذراً لم يشارك اي لاعب *","md",true)
end 
local UserName = list[math.random(#list)]
local UserId_Info = bot.getUser(UserName)
if UserId_Info.username and UserId_Info.username ~= "" then
ls = '@['..UserId_Info.username..']'
else
ls = '['..UserId_Info.first_name..'](tg://user?id='..UserName..')'
end
Redis:incrby(Fast..'Num:Add:Games'..msg.chat_id..UserId_Info.id,5)
Redis:del(Fast..'raeahkamm'..msg.chat_id) 
Redis:del(Fast..'List_Ahkamm'..msg.chat_id) 
Redis:del(Fast.."Witting_StartGamehh"..msg.chat_id)
Redis:del(Fast.."Start_Ahkamm"..msg.chat_id)
katu = {
"*صورة وجهك او رجلك او خشمك او يدك*.",
"*اصدر اي صوت يطلبه منك الاعبين*.",
"*سكر خشمك و قول كلمة من اختيار الاعبين الي معك*.",
"*روح الى اي قروب عندك في الواتس اب و اكتب اي شيء يطلبه منك الاعبينالحد الاقصى 3 رسائل*.",
"*قول نكتة ولازم احد الاعبين يضحك اذا ضحك يعطونك ميوت الى ان يجي دورك مرة ثانية*.",
"*سمعنا صوتك و غن اي اغنية من اختيار الاعبين الي معك*.",
"*ذي المرة لك لا تعيدها*.",
"*ارمي جوالك على الارض بقوة و اذا انكسر صور الجوال و ارسله في الشات العام*.",
"*صور اي شيء يطلبه منك الاعبين*.",
"*اتصل على ابوك و قول له انك رحت مع بنت و احين هي حامل....*.",
"*سكر خشمك و قول كلمة من اختيار الاعبين الي معك*.",
"*اعطي اي احد جنبك كف اذا مافيه احد جنبك اعطي نفسك و نبي نسمع صوته*.",
"*ارمي جوالك على الارض بقوة و اذا انكسر صور الجوال و ارسله في الشات العام*.",
"*روح عند اي احد بالخاص و قول له انك تحبه و الخ*.",
"*اكتب في الشات اي شيء يطلبه منك الاعبين في الخاص*.",
"*قول نكتة اذا و لازم احد الاعبين يضحك اذا محد ضحك يعطونك ميوت الى ان يجي دورك مرة ثانية*.",
"*سامحتك خلاص مافيه عقاب لك *.",
"*اتصل على احد من اخوياكخوياتك , و اطلب منهم مبلغ على اساس انك صدمت بسيارتك*.",
"*غير اسمك الى اسم من اختيار الاعبين الي معك*.",
"*اتصل على امك و قول لها انك تحبها *.",
"*لا يوجد سؤال لك سامحتك *.",
"*قل لواحد ماتعرفه عطني كف*.",
"*منشن الجميع وقل انا اكرهكم*.",
"*اتصل لاخوك و قول له انك سويت حادث و الخ....*.",
"*روح المطبخ و اكسر صحن *.",
"*اعطي اي احد جنبك كف اذا مافيه احد جنبك اعطي نفسك و نبي نسمع صوت الكف*.",
"*قول لاي بنت موجود في الروم كلمة حلوه*.",
"*تكلم باللغة الانجليزية الين يجي دورك مرة ثانية لازم تتكلم اذا ما تكلمت تنفذ عقاب ثاني*.",
"*لا تتكلم ولا كلمة الين يجي دورك مرة ثانية و اذا تكلمت يجيك باند لمدة يوم كامل من السيرفر*.",
"*قول قصيدة *.",
"*تكلم باللهجة السودانية الين يجي دورك مرة ثانية*.",
"*اتصل على احد من اخوياكخوياتك , و اطلب منهم مبلغ على اساس انك صدمت بسيارتك*.",
"*اول واحد تشوفه عطه كف*.",
"*سو مشهد تمثيلي عن اي شيء يطلبه منك الاعبين*.",
"*سامحتك خلاص مافيه عقاب لك *.",
"*اتصل على ابوك و قول له انك رحت مع بنت و احين هي حامل....*.",
"*روح اكل ملح + ليمون اذا مافيه اكل اي شيء من اختيار الي معك*.",
"*تاخذ عقابين*.",
"*قول اسم امك افتخر بأسم امك*.",
"*ارمي اي شيء قدامك على اي احد موجود او على نفسك*.",
"*اذا انت ولد اكسر اغلى او احسن عطور عندك اذا انتي بنت اكسري الروج حقك او الميك اب حقك*.",
"*اذهب الى واحد ماتعرفه وقل له انا كيوت وابي بوسه*.",
"*تتصل على الوالدهو تقول لها خطفت شخص*.",
"* تتصل على الوالدهو تقول لها تزوجت با سر*.",
"*اتصل على الوالدهو تقول لهااحب وحده*.",
"*تتصل على شرطي تقول له عندكم مطافي*.",
"*خلاص سامحتك*.",
"* تصيح في الشارع انامجنوون*.",
"* تروح عند شخص وقول له احبك*."
}
name = katu[math.random(#katu)]
bot.sendText(msg.chat_id,msg.id,'*• تم اختيار* ('..ls..') *لمعاقبته\n• العقوبة هي ( '..name..' ) *',"md",true)
end
end
if text == 'احكام' then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return bot.sendText(msg.chat_id,msg.id,"*• الالعاب معطلة من قبل المشرفين*","md",true)
end
Redis:del(Fast..'List_Jabwa'..msg.chat_id)  
Redis:set(Fast.."raeJabwa"..msg.chat_id,senderr)
Redis:sadd(Fast..'List_Jabwa'..msg.chat_id,senderr)
Redis:setex(Fast.."Start_Jabwa"..msg.chat_id,3600,true)
bot.sendText(msg.chat_id,msg.id,"*• تم بدء اللعبة وتم تسجيلك \n• اللي بيلعب يرسل ( انا ) *","md",true)
end
if text == 'نعم' and Redis:get(Fast.."Witting_StartGameh"..msg.chat_id) then
rarJabwa = Redis:get(Fast.."raeJabwa"..msg.chat_id)
if tonumber(rarJabwa) == senderr then
local list = Redis:smembers(Fast..'List_Jabwa'..msg.chat_id) 
if #list == 1 then 
bot.sendText(msg.chat_id,msg.id,"*• عذراً لم يشارك اي لاعب*","md",true)  
end 
local UserName = list[math.random(#list)]
local UserId_Info = bot.getUser(UserName)
if UserId_Info.username and UserId_Info.username ~= "" then
ls = '@['..UserId_Info.username..']'
else
ls = '['..UserId_Info.first_name..'](tg://user?id='..UserName..')'
end
Redis:incrby(Fast..'Num:Add:Games'..msg.chat_id..UserId_Info.id,5)
Redis:del(Fast..'raeJabwa'..msg.chat_id) 
Redis:del(Fast..'List_Jabwa'..msg.chat_id) 
Redis:del(Fast.."Witting_StartGameh"..msg.chat_id)
Redis:del(Fast.."Start_Jabwa"..msg.chat_id)
bot.sendText(msg.chat_id,msg.id,'*• تم اختيار* ('..ls..') *للحكم عليه*',"md",true)
end
end
if text and Redis:get(Fast.."photo:test"..msg.sender_id.user_id) then
local phid = Redis:get(Fast.."photo:test"..msg.sender_id.user_id)
Redis:set(Fast.."get:photo:answer"..phid,text)
send(msg.chat_id,msg.id,"• تم حفظ جواب الصوره بنجاح")
Redis:del(Fast.."photo:test"..msg.sender_id.user_id)
end
if Redis:get(Fast.."add:photo"..msg.sender_id.user_id..":"..msg.chat_id) then
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
phid = msg.content.photo.sizes[1].photo.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
phid = msg.content.photo.sizes[2].photo.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
phid = msg.content.photo.sizes[3].photo.id
end
Redis:del(Fast.."add:photo"..msg.sender_id.user_id..":"..msg.chat_id)
Redis:sadd(Fast.."photos:game",phid)
Redis:set(Fast.."get:photo"..phid,idPhoto)
Redis:set(Fast.."photo:test"..msg.sender_id.user_id,phid)
send(msg.chat_id,msg.id,"• تم حفظ الصوره ارسل الان جواب الصوره")
end
end
if text == "صور" then
local list = Redis:smembers(Fast.."photos:game")
if #list == 0 then
return send(msg.chat_id,msg.id,"• لا توجد صور مضافه")
end
local phid = list[math.random(#list)]
local getPhoto = Redis:get(Fast.."get:photo"..phid)
local getAnswer = Redis:get(Fast.."get:photo:answer"..phid)
Redis:set(Fast..msg.chat_id.."answers:photo",getAnswer)
bot.sendPhoto(msg.chat_id, msg.id, getPhoto,"• اسرع واحد يرسل اسم من في الصوره")
end
if text == "اضف صور" or text == "اضف صوره" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."add:photo"..msg.sender_id.user_id..":"..msg.chat_id,true)
return send(msg.chat_id,msg.id,"• ارسل الصوره الان ")
end
if text == "مسح الصور" then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."photos:game")
if #list == 0 then
return send(msg.chat_id,msg.id,"• لا توجد صور مضافه")
end
for k,v in pairs(list) do
Redis:del(Fast.."get:photo:answer"..v)
Redis:del(Fast.."get:photo"..v)
end
Redis:del(Fast.."photos:game")
send(msg.chat_id,msg.id,"• تم مسح الصور المضافه")
end
if text == "مسح صوره" and  tonumber(msg.reply_to_message_id) > 0 then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local data = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if data.content.photo then
if data.content.photo.sizes[1].photo.remote.id then
phid = data.content.photo.sizes[1].photo.id
elseif data.content.photo.sizes[2].photo.remote.id then
phid = data.content.photo.sizes[2].photo.id
elseif data.content.photo.sizes[3].photo.remote.id then
phid = data.content.photo.sizes[3].photo.id
end
local getAnswer = Redis:get(Fast.."get:photo:answer"..phid)
Redis:srem(Fast.."photos:game",phid)
send(msg_chat_id,msg_id,'• تم حذف *['..getAnswer..']* من الصور بنجاح',"md")
Redis:del(Fast.."get:photo"..phid)
Redis:del(Fast.."get:photo:answer"..phid)
end
end
if text== "اضف سؤال كت" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."gamebot:Set:Manager:rd"..msg.sender_id.user_id..":"..msg.chat_id,true)
return send(msg.chat_id,msg.id,"ارسل السؤال الان ")
end
if text== "مسح سؤال كت" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."gamebot:Set:Manager:rdd"..msg.sender_id.user_id..":"..msg.chat_id,true)
return send(msg.chat_id,msg.id,"ارسل السؤال ")
end
if text == 'اسئله كت' then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return false
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."gamebot:List:Manager")
t = "• الاسئله المضافه : \n"
for k,v in pairs(list) do
t = t..""..k.."- (["..v.."])\n"
end
if #list == 0 then
t = "• لا يوجد اسئله"
end
return send(msg_chat_id,msg_id,t,'md')
end

if text == 'مسح اسئله كت' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."gamebot:List:Manager")
if #list == 0 then
send(msg_chat_id,msg_id,"• لا يوجد اسئله")
end
Redis:del(Fast.."gamebot:List:Manager")
send(msg_chat_id,msg_id,'تم مسح الاسئله')
end

if text== 'كت تويت' or text== 'كت' or text == "تويت" or text == "هه" then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."gamebot:List:Manager")
if #list ~= 0 then
local quschen = list[math.random(#list)]
return send(msg.chat_id,msg.id,"*• السؤال هو ⋮\n"..quschen.."*","md",true)
end
end
end
if text == 'تفعيل كت' or text == 'تفعيل اسئله كت' then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = {

' ما هو الشيء الذي تكرهه بشدة؟ ولماذا؟',
'  هل من الممكن نسيان شخص ظلمك؟',
'  هل تقبل الزواج بشخص غني لكنه متعدد العلاقات؟',
'  شهر من أشهر العام له ذكرى جميلة معك؟',
'  لو خيروك بين البقاء ليوم كامل في بيت مهجور أو في غابة موحشة.',
'  ما هي الصفة التي تود تغييرها في الشخص الآخر؟ وهل حاولت ذلك من قبل؟ وما النتيجة التي حصلت عليها؟',
'  هل وقعت في حب شخص من مواقع التواصل الإجتماعي؟',
'  هل تملك صديق كأخ؟ أو هل تملك أخ كالصديق؟ وهل يعرف جميع أسرارك؟',
'  ما هو الشخص الذي لا تستطيع أن ترفض له أي طلب؟',
'  هل تشعر أن هنالك مَن يُحبك؟',
'  هل يمكنك أن تتولى أمر الأعمال المنزلية أم أنك سوف تفشل في ذلك؟',
'  هل كذبت على أحد والديك؟',
'  هل يمكنك أن تكون صريح تمامًا اتجاه حبيبك / حبيبتك؟ أم لا بد من الكثير من المجاملات؟',
'  متى اخر مره حدث خلاف بينكما؟ وعلى ماذا كان هذا الخلاف؟ وهل تم حله بشكل تام؟',
'  هل تُؤمن بضرب الأطفال في التربية؟',
'  هل تعتقد أن حبيبتك / حبيبك يفكر بك الآن؟ أم هل تظن أنه منشغل بأمر آخر  .ام انك سنكل؟',
'  كيف تُعبر عن فرحتك عندما تكون لوحدك؟',
'  إذا خيروك أن تُعيد تسمية نفسك فهل تقبل باسمك أم تقوم بتغييره؟',
'  هل حاربت من أجل شخص ما من قبل؟',
'  ما هي هوايتك في الحياة؟',
'  هل تقبل الارتباط بشخص فقير لكنه شديد الجمال؟',
'  كم من الوقت تستغرق قبل الخروج من المنزل ؟',
'  من هو الشخص الذي يُمثل نقطة ضعفك؟',
'  لماذا انتهت أول قصة حب في حياتك؟',
'  ‏ ماذا ستختار من الكلمات لتعبر لنا عن حياتك التي عشتها الى الآن؟',
'  متى كانت المرة الأخيرة التي كذبت فيها؟',
'  ما هي أجمل سنة عشتها بحياتك؟',
'  كنت السبب في أذى شخص ما؟',
'  هل رأي الآخرين مهم بالنسبة لك؟',
'  هل تملك صديق يتقن الغناء؟',
'  ما هي اللعبة المفضلة لديك؟',
'  ما هي مواصفات شريك حياتك؟',
'  هل يُمكن أن تكذب كذبة كبيرة للخروج من مأزق؟',
'  إذا جاء شريك حياتك وطلب الانفصال، فماذا يكون ردك وقتها؟',
'  هل أنت شخص غيور؟',
'  هل انت تدرس؟',
'  ‏ماذا ستختار من الكلمات لتعبر لنا عن حياتك التي عشتها الى الآن؟',
'  هل ما زلت تعتقد ان هنالك حب حقيقي؟',
'  هل أنت من الأشخاص المحظوظين أم أن سوء الحظ يرافقك؟',
"هل أنت محبوب من زملائك في العمل؟",
"هل يمكن لك التخلي عن حبك أمام كرامتك؟",
"إذا وجدت ورقة بيضاء فماذا ترسم لتعبر عن حالتك النفسية؟",
"لو تم وضعك أما ثلاث خيارات ( المال، الصحة، الرضا) أيهما تختار؟",
"هل شعرتي بالندم من قبل بسبب ثقتك في أحد الأشخاص؟",
"هل أنت مع الخطبة عن حب أم مع الخطبة عن طريق الأهل؟",
"من وجهة نظرك هل يأتي الحب بعد الزواج؟",
"ماذا لو كنت ستختار بين رحلة إلى الغابات والجبال أو رحلة إلى البحر؟",
"هل يمكنك الوقوع في الحب عبر الإنترنت؟,",
"هل سبق ورسبت في المدرسة؟ وكم عدد المرات؟",
"هل لديك فوبيا من شيء معين؟",
"إذا دخلت مُسابقة وكسبت 5 مليون دولار ماذا تفعل بهم؟",
"هل يمكن أن تكره شخص كنت تحبه؟ أو تحب شخص كنت تكرهه؟",
"من هم أصدقائك المقربين منك؟",
"كم ساعة تنام في اليوم؟",
"لماذا تتمنى أن يعود الزمن؟ هل تفتقد أي شيء أو أي شخص هناك؟",
"هل يمكن لكي أن تكتفي قبل النزول من المنزل بغسيل الوجه فقط دون وضع الميكاب؟",
"هل كنت تخفي المعلومات المهمة عن زملائك في الدراسة؟",
"هل تستطيع أن تعيش بدون أصدقاء؟",
"ماذا تختار حبيبك أم صديقك؟",
"من هو الشخص الذي تستطيع أن تحكي له أي مشكلة بدون خجل؟",
"إذا تركك من تحب، هل تعود إليه مرة أخرى أم تتركهُ وتنتظر وقت عودته؟",
"هل سبق وأن تعرضت للسرقة من أحد قريب لك؟",
"هل من الممكن أن تضر شخصاً لمجرد أنك تكرهه؟",
"ما هو الحيوان الذي تحب العناية به؟,",
"اسم اغنية قريبة على قلبك؟",
"هل تستطيع اخبارنا معلومة هامة عنك لم يعرفها أحد من المتواجدين هنا؟",
"هل تستطيع التنازل عن شيء تفضله من أجل إسعاد الآخرين؟",
"أغمض عينيك ما هو المكان الذي تخيلت نفسك فيه؟",
"هل من الممكن أن ترتكب جريمة ضد شخص حتى لا يكشف سرك؟",
"هل يمكنك التخلي عن هدفك في سبيل شخص؟",
"ما هو البرج الخاص بك؟",
"لو كان هناك أمامك اختيارين أحدهما الزواج والإستقرار معي هنا والآخر السفر والعمل بالخارج، أيهما تختار؟",
"هل سبق وضربت أحدهم؟ ولماذا فعلت ذلك؟"
}
for k,v in pairs(list) do
Redis:sadd(Fast.."gamebot:List:Manager",v)
end
return send(msg_chat_id,msg_id,'\n*• تم اضافه اسئله كت* ',"md",true)  
end
if text == "سمايلات" or text == "سمايل" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Random = {"🍎","🍐","??","🍋","🍉","??","🍓","🍈","🍒","🍑","🍍","🥥","🥝","🍅","🍆","🥑","🥦","🥒","🌶","🌽","🥕","🥔","🥖","🥐","🍞","🥨","🍟","??","🥚","🍳","🥓","🥩","🍗","🍖","🌭","🍔","🍠","🍕","🥪","🥙","☕️","🥤","🍶","🍺","🍻","🏀","⚽️","🏈","⚾️","🎾","🏐","🏉","🎱","🏓","🏸","🥅","🎰","🎮","🎳","🎯","🎲","🎻","🎸","🎺","🥁","🎹","🎼","🎧","🎤","🎬","🎨","🎭","🎪","🎟","🎫","🎗","🏵","🎖","🏆","🥌","🛷","🚗","🚌","🏎","🚓","🚑","🚚","🚛","🚜","⚔","🛡","🔮","🌡","💣","• ","📍","📓","📗","📂","📅","📪","??","• ","📭","⏰","??","🎚","☎️","📡"}
SM = Random[math.random(#Random)]
Redis:set(Fast.."Game:Smile"..msg.chat_id,SM)
return send(msg.chat_id,msg.id,"• اسرع واحد يدز هذا السمايل ? ~ {`"..SM.."`}","md",true)  
end
end

if text == "الاسرع" or text == "ترتيب" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
KlamSpeed = {"سحور","سياره","استقبال","قنفه","ايفون","بزونه","مطبخ","كرستيانو","دجاجه","مدرسه","الوان","غرفه","ثلاجه","كهوه","سفينه","العراق","محطه","طياره","رادار","منزل","مستشفى","كهرباء","تفاحه","اخطبوط","سلمون","فرنسا","برتقاله","تفاح","مطرقه","بتيته","لهانه","شباك","باص","سمكه","ذباب","تلفاز","حاسوب","انترنيت","ساحه","جسر"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(Fast.."Game:Monotonous"..msg.chat_id,name)
name = string.gsub(name,"سحور","س ر و ح")
name = string.gsub(name,"سياره","ه ر س ي ا")
name = string.gsub(name,"استقبال","ل ب ا ت ق س ا")
name = string.gsub(name,"قنفه","ه ق ن ف")
name = string.gsub(name,"ايفون","و ن ف ا")
name = string.gsub(name,"بزونه","ز و ه ن")
name = string.gsub(name,"مطبخ","خ ب ط م")
name = string.gsub(name,"كرستيانو","س ت ا ن و ك ر ي")
name = string.gsub(name,"دجاجه","ج ج ا د ه")
name = string.gsub(name,"مدرسه","ه م د ر س")
name = string.gsub(name,"الوان","ن ا و ا ل")
name = string.gsub(name,"غرفه","غ ه ر ف")
name = string.gsub(name,"ثلاجه","ج ه ت ل ا")
name = string.gsub(name,"كهوه","ه ك ه و")
name = string.gsub(name,"سفينه","ه ن ف ي س")
name = string.gsub(name,"العراق","ق ع ا ل ر ا")
name = string.gsub(name,"محطه","ه ط م ح")
name = string.gsub(name,"طياره","ر ا ط ي ه")
name = string.gsub(name,"رادار","ر ا ر ا د")
name = string.gsub(name,"منزل","ن ز م ل")
name = string.gsub(name,"مستشفى","ى ش س ف ت م")
name = string.gsub(name,"كهرباء","ر ب ك ه ا ء")
name = string.gsub(name,"تفاحه","ح ه ا ت ف")
name = string.gsub(name,"اخطبوط","ط ب و ا خ ط")
name = string.gsub(name,"سلمون","ن م و ل س")
name = string.gsub(name,"فرنسا","ن ف ر س ا")
name = string.gsub(name,"برتقاله","ر ت ق ب ا ه ل")
name = string.gsub(name,"تفاح","ح ف ا ت")
name = string.gsub(name,"مطرقه","ه ط م ر ق")
name = string.gsub(name,"بتيته","ب ت ت ي ه")
name = string.gsub(name,"لهانه","ه ن ل ه ل")
name = string.gsub(name,"شباك","ب ش ا ك")
name = string.gsub(name,"باص","ص ا ب")
name = string.gsub(name,"سمكه","ك س م ه")
name = string.gsub(name,"ذباب","ب ا ب ذ")
name = string.gsub(name,"تلفاز","ت ف ل ز ا")
name = string.gsub(name,"حاسوب","س ا ح و ب")
name = string.gsub(name,"انترنيت","ا ت ن ر ن ي ت")
name = string.gsub(name,"ساحه","ح ا ه س")
name = string.gsub(name,"جسر","ر ج س")
return send(msg.chat_id,msg.id,"• اسرع واحد يرتبها ~ {"..name.."}","md",true)  
end
end
if text == "حزوره" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Hzora = {"الجرس","عقرب الساعه","السمك","المطر","5","الكتاب","البسمار","7","الكعبه","بيت الشعر","لهانه","انا","امي","الابره","الساعه","22","غلط","كم الساعه","البيتنجان","البيض","المرايه","الضوء","الهواء","الضل","العمر","القلم","المشط","الحفره","البحر","الثلج","الاسفنج","الصوت","بلم"};
name = Hzora[math.random(#Hzora)]
Redis:set(Fast.."Game:Riddles"..msg.chat_id,name)
name = string.gsub(name,"الجرس","شيئ اذا لمسته صرخ ما هوه ؟")
name = string.gsub(name,"عقرب الساعه","اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟")
name = string.gsub(name,"السمك","ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟")
name = string.gsub(name,"المطر","شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟")
name = string.gsub(name,"5","ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ")
name = string.gsub(name,"الكتاب","ما الشيئ الذي له اوراق وليس له جذور ؟")
name = string.gsub(name,"البسمار","ما هو الشيئ الذي لا يمشي الا بالضرب ؟")
name = string.gsub(name,"7","عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ")
name = string.gsub(name,"الكعبه","ما هو الشيئ الموجود وسط مكة ؟")
name = string.gsub(name,"بيت الشعر","ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ")
name = string.gsub(name,"لهانه","وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ")
name = string.gsub(name,"انا","ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟")
name = string.gsub(name,"امي","اخت خالك وليست خالتك من تكون ؟ ")
name = string.gsub(name,"الابره","ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ")
name = string.gsub(name,"الساعه","ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟")
name = string.gsub(name,"22","كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ")
name = string.gsub(name,"غلط","ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ")
name = string.gsub(name,"كم الساعه","ما هو السؤال الذي تختلف اجابته دائما ؟")
name = string.gsub(name,"البيتنجان","جسم اسود وقلب ابيض وراس اخظر فما هو ؟")
name = string.gsub(name,"البيض","ماهو الشيئ الذي اسمه على لونه ؟")
name = string.gsub(name,"المرايه","ارى كل شيئ من دون عيون من اكون ؟ ")
name = string.gsub(name,"الضوء","ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟")
name = string.gsub(name,"الهواء","ما هو الشيئ الذي يسير امامك ولا تراه ؟")
name = string.gsub(name,"الضل","ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ")
name = string.gsub(name,"العمر","ما هو الشيء الذي كلما طال قصر ؟ ")
name = string.gsub(name,"القلم","ما هو الشيئ الذي يكتب ولا يقرأ ؟")
name = string.gsub(name,"المشط","له أسنان ولا يعض ما هو ؟ ")
name = string.gsub(name,"الحفره","ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟")
name = string.gsub(name,"البحر","ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟")
name = string.gsub(name,"الثلج","انا ابن الماء فان تركوني في الماء مت فمن انا ؟")
name = string.gsub(name,"الاسفنج","كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟")
name = string.gsub(name,"الصوت","اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟")
name = string.gsub(name,"بلم","حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ")
return send(msg.chat_id,msg.id,"• اسرع واحد يحل الحزوره ↓\n {"..name.."}","md",true)  
end
end
if text == "معاني" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Redis:del(Fast.."Set:Maany"..msg.chat_id)
Maany_Rand = {"قرد","دجاجه","بطريق","ضفدع","بومه","نحله","ديك","جمل","بقره","دولفين","تمساح","قرش","نمر","اخطبوط","سمكه","خفاش","اسد","فأر","ذئب","فراشه","عقرب","زرافه","قنفذ","تفاحه","باذنجان"}
name = Maany_Rand[math.random(#Maany_Rand)]
Redis:set(Fast.."Game:Meaningof"..msg.chat_id,name)
name = string.gsub(name,"قرد","🐒")
name = string.gsub(name,"دجاجه","🐔")
name = string.gsub(name,"بطريق","🐧")
name = string.gsub(name,"ضفدع","🐸")
name = string.gsub(name,"بومه","🦉")
name = string.gsub(name,"نحله","🐝")
name = string.gsub(name,"ديك","🐓")
name = string.gsub(name,"جمل","🐫")
name = string.gsub(name,"بقره","🐄")
name = string.gsub(name,"دولفين","🐬")
name = string.gsub(name,"تمساح","🐊")
name = string.gsub(name,"قرش","🦈")
name = string.gsub(name,"نمر","🐅")
name = string.gsub(name,"اخطبوط","🐙")
name = string.gsub(name,"سمكه","🐟")
name = string.gsub(name,"خفاش","🦇")
name = string.gsub(name,"اسد","🦁")
name = string.gsub(name,"فأر","🐭")
name = string.gsub(name,"ذئب","🐺")
name = string.gsub(name,"فراشه","🦋")
name = string.gsub(name,"عقرب","🦂")
name = string.gsub(name,"زرافه","🦒")
name = string.gsub(name,"قنفذ","🦔")
name = string.gsub(name,"تفاحه","🍎")
name = string.gsub(name,"باذنجان","🍆")
return send(msg.chat_id,msg.id,"• اسرع واحد يدز معنى السمايل ~ {"..name.."}","md",true)  
end
end
if text == "العكس" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Redis:del(Fast.."Set:Aks"..msg.chat_id)
katu = {"باي","فهمت","موزين","اسمعك","احبك","موحلو","نضيف","حاره","ناصي","جوه","سريع","ونسه","طويل","سمين","ضعيف","قصير","شجاع","رحت","عدل","نشيط","شبعان","موعطشان","خوش ولد","اني","هادئ"}
name = katu[math.random(#katu)]
Redis:set(Fast.."Game:Reflection"..msg.chat_id,name)
name = string.gsub(name,"باي","هلو")
name = string.gsub(name,"فهمت","مافهمت")
name = string.gsub(name,"موزين","زين")
name = string.gsub(name,"اسمعك","ماسمعك")
name = string.gsub(name,"احبك","ماحبك")
name = string.gsub(name,"موحلو","حلو")
name = string.gsub(name,"نضيف","وصخ")
name = string.gsub(name,"حاره","بارده")
name = string.gsub(name,"ناصي","عالي")
name = string.gsub(name,"جوه","فوك")
name = string.gsub(name,"سريع","بطيء")
name = string.gsub(name,"ونسه","ضوجه")
name = string.gsub(name,"طويل","قزم")
name = string.gsub(name,"سمين","ضعيف")
name = string.gsub(name,"ضعيف","قوي")
name = string.gsub(name,"قصير","طويل")
name = string.gsub(name,"شجاع","جبان")
name = string.gsub(name,"رحت","اجيت")
name = string.gsub(name,"عدل","ميت")
name = string.gsub(name,"نشيط","كسول")
name = string.gsub(name,"شبعان","جوعان")
name = string.gsub(name,"موعطشان","عطشان")
name = string.gsub(name,"خوش ولد","موخوش ولد")
name = string.gsub(name,"اني","مطي")
name = string.gsub(name,"هادئ","عصبي")
return send(msg.chat_id,msg.id,"• اسرع واحد يدز العكس ~ {"..name.."}","md",true)  
end
end
if text == "اذكار" or text == "ازكار" or text == "الاذكار" then 
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
local texting = {"اللَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ , وَشُكْرِكَ , وَحُسْنِ عِبَادَتِكَ🎈💞", 
"االلَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ , وَشُكْرِكَ , وَحُسْنِ عِبَادَتِكَ🎈💞 ",
"من الأدعية النبوية المأثورة:اللهمَّ زَيِّنا بزينة الإيمان",
"اااللهم يا من رويت الأرض مطرا أمطر قلوبنا فرحا 🍂 ",
"اا‏اللَّهُـمَّ لَڪَ الحَمْـدُ مِنْ قَـا؏ِ الفُـؤَادِ إلىٰ ؏َـرشِڪَ المُقـدَّس حَمْـدَاً يُوَافِي نِـ؏ـمَڪ 💙🌸",
"﴿وَاذْكُرِ اسْمَ رَبِّكَ وَتَبَتَّلْ إِلَيْهِ تَبْتِيلًا﴾🌿✨",
"﴿وَمَن يَتَّقِ اللهَ يُكَفِّرْ عَنْهُ سَيِّئَاتِهِ وَيُعْظِمْ لَهُ أَجْرًا﴾",
"«سُبْحَانَ اللهِ ، وَالحَمْدُ للهِ ، وَلَا إلَهَ إلَّا اللهُ ، وَاللهُ أكْبَرُ ، وَلَا حَوْلَ وَلَا قُوَّةَ إلَّا بِاللهِ»🍃",
"وذُنُوبًا شوَّهتْ طُهْرَ قُلوبِنا؛ اغفِرها يا ربّ واعفُ عنَّا ❤️",
"«اللَّهُمَّ اتِ نُفُوسَنَا تَقْوَاهَا ، وَزَكِّهَا أنْتَ خَيْرُ مَنْ زَكَّاهَا ، أنْتَ وَلِيُّهَا وَمَوْلَاهَا»🌹",
"۝‏﷽إن اللَّه وملائكته يُصلُّون على النبي ياأيُّها الذين امنوا صلُّوا عليه وسلِّموا تسليما۝",
"فُسِبًحً بًحًمًدٍ ربًکْ وٌکْنِ مًنِ الَسِاجّدٍيَنِ 🌿✨",
"اأقُمً الَصّلَاةّ لَدٍلَوٌکْ الَشُمًسِ إلَيَ غُسِقُ الَلَيَلَ🥀🌺",
"نِسِتٌغُفُرکْ ربًيَ حًيَتٌ تٌلَهّيَنِا الَدٍنِيَا عٌنِ ذِکْرکْ🥺😢",
"وٌمًنِ أعٌرض عٌنِ ذِکْريَ فُإنِ لَهّ مًعٌيَشُةّ ضنِکْا 😢",
"وٌقُرأنِ الَفُجّر إنِ قُرانِ الَفُجّر کْانِ مًشُهّوٌدٍا🎀🌲",
"اأّذّأّ أّلَدِنِيِّأّ نَِّستّګوِ أّصٌلَګوِ زِّوِروِ أّلَمَقِأّبِر💔",
"حًتٌيَ لَوٌ لَمًتٌتٌقُنِ الَخِفُظُ فُمًصّاحًبًتٌ لَلَقُرانِ تٌجّعٌلَکْ مًنِ اهّلَ الَلَهّ وٌخِاصّتٌهّ❤🌱",
"وٌإذِا رضيَتٌ وٌصّبًرتٌ فُهّوٌ إرتٌقُاء وٌنِعٌمًةّ✨??",
"«ربً اجّعٌلَنِيَ مًقُيَمً الَصّلَاةّ وٌمًنِ ذِريَتٌيَ ربًنِا وٌتٌقُبًلَ دٍعٌاء 🤲",
"ااعٌلَمً انِ رحًلَةّ صّبًرکْ لَهّا نِهّايَهّ عٌظُيَمًهّ مًحًمًلَهّ بًجّوٌائزٍ ربًانِيَهّ مًدٍهّشُهّ🌚☺️",
"اإيَاکْ وٌدٍعٌوٌةّ الَمًظُلَوٌمً فُ إنِهّا تٌصّعٌدٍ الَيَ الَلَهّ کْأنِهّا شُرارهّ مًنِ نِار 🔥🥺",
"االَلَهّمً انِقُذِ صّدٍوٌرنِا مًنِ هّيَمًنِهّ الَقُلَقُ وٌصّبً عٌلَيَهّا فُيَضا مًنِ الَطِمًأنِيَنِهّ✨🌺",
"يَابًنِيَ إنِ صّلَاح الَحًيَاةّ فُ أتٌجّاهّ الَقُبًلَهّ 🥀🌿",
"الَلَهّمً ردٍنِا إلَيَکْ ردٍا جّمًيَلَا💔🥺",
} 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• أذكار أخري •️', data = msg.sender_id.user_id..'/Haiw5'}, },}}
return bot.sendText(msg_chat_id,msg_id, texting[math.random(#texting)],'md', false, false, false, false, reply_markup)
end
end
if text == "كتبات" or text == "حكمه" or text == "قصيده" then 
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
local texting = {"‏من ترك أمرهُ لله، أعطاه الله فوق ما يتمنَّاه💙 ", 
"‏من علامات جمال المرأة .. بختها المايل ! ",
"‏ انك الجميع و كل من احتل قلبي🫀🤍",
"‏ ‏ لقد تْعَمقتُ بكَ كَثيراً والمِيمُ لام .♥️",
"‏ ‏ممكن اكون اختارت غلط بس والله حبيت بجد🖇️",
"‏ علينا إحياء زَمن الرّسائل الورقيّة وسط هذه الفوضى الالكترونية العَارمة. ℘︙ 💜",
"‏ يجي اي الصاروخ الصيني ده جمب الصاروخ المصري لما بيلبس العبايه السوده.🤩♥️",
"‏ كُنت أرقّ من أن أتحمّل كُل تلك القَسوة من عَينيك .🍍",
"‏أَكَان عَلَيَّ أَنْ أغْرَس انيابي فِي قَلْبِك لتشعر بِي ؟.",
"‏ : كُلما أتبع قلبي يدلني إليك .",
"‏ : أيا ليت من تَهواه العينُ تلقاهُ .",
"‏ ‏: رغبتي في مُعانقتك عميقة جداً .??",
"ويُرهقني أنّي مليء بما لا أستطيع قوله.✨",
"‏ من مراتب التعاسه إطالة الندم ع شيء إنتهى. ℘︙ ",
"‏ ‏كل العالم يهون بس الدنيا بينا تصفي 💙",
"‏ بعض الاِعتذارات يجب أن تُرفَضّ.",
"‏ ‏تبدأ حياتك محاولاً فهم كل شيء، وتنهيها محاولاً النجاة من كل ما فهمت.",
"‏ إن الأمر ينتهي بِنا إلى أعتياد أي شيء.",
"‏ هل كانت كل الطرق تؤدي إليكِ، أم أنني كنتُ أجعلها كذلك.",
"‏ ‏هَتفضل تواسيهُم واحد ورا التاني لكن أنتَ هتتنسي ومحدِش هَيواسيك.",
"‏ جَبَرَ الله قلوبِكُم ، وقَلبِي .🍫",
"‏ بس لما أنا ببقى فايق، ببقى أبكم له ودان.💖",
"‏ ‏مقدرش عالنسيان ولو طال الزمن 🖤",
"‏ أنا لستُ لأحد ولا احد لي ، أنا إنسان غريب أساعد من يحتاجني واختفي.",
"‏ ‏أحببتك وأنا منطفئ، فما بالك وأنا في كامل توهجي ؟",
"‏ لا تعودني على دفء شمسك، إذا كان في نيتك الغروب .َ",
"‏ وانتهت صداقة الخمسه سنوات بموقف.",
"‏ ‏لا تحب أحداً لِدرجة أن تتقبّل أذاه.",
"‏ إنعدام الرّغبة أمام الشّيء الّذي أدمنته ، انتصار.",
"‏مش جايز , ده اكيد التأخير وارهاق القلب ده وراه عوضاً عظيماً !?? ",
" مش جايز , ده اكيد التأخير وارهاق القلب ده وراه عوضاً عظيماً !💙",
"فـ بالله صبر  وبالله يسر وبالله عون وبالله كل شيئ ♥️. ",
"أنا بعتز بنفسي جداً كصاحب وشايف اللي بيخسرني ، بيخسر أنضف وأجدع شخص ممكن يشوفه . ",
"فجأه جاتلى قافله ‏خلتنى مستعد أخسر أي حد من غير ما أندم عليه . ",
"‏اللهُم قوني بك حين يقِل صبري... ",
"‏يارب سهِل لنا كُل حاجة شايلين هَمها 💙‏ ",
"انا محتاج ايام حلوه بقي عشان مش نافع كدا ! ",
"المشكله مش اني باخد قررات غلط المشكله اني بفكر كويس فيها قبل ما اخدها .. ",
"تخيل وانت قاعد مخنوق كدا بتفكر فالمزاكره اللي مزكرتهاش تلاقي قرار الغاء الدراسه .. ",
" مكانوش يستحقوا المعافرة بأمانه.",
"‏جمل فترة في حياتي، كانت مع اكثر الناس الذين أذتني نفسيًا. ",
" ‏إحنا ليه مبنتحبش يعني فينا اي وحش!",
"أيام مُمله ومستقبل مجهول ونومٌ غير منتظموالأيامُ تمرُ ولا شيَ يتغير ", 
"عندما تهب ريح المصلحه سوف ياتي الجميع رتكدون تحت قدمك ❤️. ",
"عادي مهما تعادي اختك قد الدنيا ف عادي ❤. ",
"بقيت لوحدي بمعنا اي انا اصلا من زمان لوحدي.❤️ ",
"- ‏تجري حياتنا بما لاتشتهي أحلامنا ! ",
"تحملين كل هذا الجمال، ‏ألا تتعبين؟",
"البدايات للكل ، والثبات للصادقين ",
"مُؤخرًا اقتنعت بالجملة دي جدا : Private life always wins. ",
" الافراط في التسامح بيخللي الناس تستهين بيك🍍",
"مهما كنت كويس فـَ إنت معرض لـِ الاستبدال.. ",
"فخوره بنفسي جدًا رغم اني معملتش حاجه فـ حياتي تستحق الذكر والله . ",
"‏إسمها ليلة القدر لأنها تُغير الأقدار ,اللهُمَّ غير قدري لحالٍ تُحبه وعوضني خير .. ",
"فى احتمال كبير انها ليلة القدر ادعوا لنفسكم كتير وأدعو ربنا يشفى كل مريض. 💙 ",
"أنِر ظُلمتي، وامحُ خطيئتي، واقبل توبتي وأعتِق رقبتي يا اللّٰه. إنكَ عفوٌّ تُحِبُّ العفوَ؛ فاعفُ عني 💛 ",
} 
return bot.sendText(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
end
end
if text == "انصحني" or text == "انصحنى" or text == "انصح" then 
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
local vBandav_Msg = { 
"عامل الناس بأخلاقك ولا بأخلاقهم", 
"الجمال يلفت الأنظار لكن الطيبه تلفت القلوب ", 
"الاعتذار عن الأخطاء لا يجرح كرامتك بل يجعلك كبير في نظر الناس ",
"لا ترجي السماحه من بخيل.. فما في البار لظمان ماء",
"لا تحقرون صغيره إن الجبال من الحصي",
"لا تستحي من إعطاء فإن الحرمان أقل منه ", 
"لا تظلم حتى لا تتظلم ",
"لا تقف قصاد الريح ولا تمشي معها ",
"لا تكسب موده التحكم الا بالتعقل",
"لا تمد عينك في يد غيرك ",
"لا تملح الا لمن يستحقاها ويحافظ عليها",
"لا حياه للإنسان بلا نبات",
"لا حياه في الرزق.. ولا شفاعه في الموت",
"كما تدين تدان",
"لا دين لمن لا عهد له ",
"لا سلطان على الدوق فيما يحب أو بكره",
"لا مروه لمن لادين له ",
"لا يدخل الجنه من لايأمن من جازه بوائقه",
"يسروا ولا تعسروا... ويشورا ولا تنفروا",
"يدهم الصدر ما يبني العقل الواسع ",
"أثقل ما يوضع في الميزان يوم القيامة حسن الخلق ",
"أجهل الناس من ترك يقين ما عنده لظن ما عند الناس ",
"أحياناً.. ويصبح الوهم حقيقه ",
"مينفعش تعاتب حد مبيعملش حساب لزعلك عشان متزعلش مرتين . ",
"السفر ومشاهده اماكن مختلفه وجديده ",
"عدم تضيع الفرص واسثمارها لحظه مجبئها ",
" اعطاء الاخرين اكثر من ما يتوقعون",
"معامله الناس بلطف ولكن عدم السماح لاحد بستغالال ذالك ",
"تكوين صدقات جديده مع الحفظ بلاصدقاء القودامي ",
"تعلم اصول المهنه بدلا من تضيع الوقت ف تعلم حيل المهنه ",
"مدح ع الاقل ثلاث اشخاص يوميا ",
"النظر ف عيون الشخاص عند مخاطبتهم ",
"التحلي بلسماح مع الاخرين او النفس ",
"الاكثار من قول كلمه شكرا ",
" مصافحه الاخرين بثبات وقوة ",
"الابتعاد عن المناطق السيئه السمعه لتجنب الاحداث السئه ",
" ادخار 10٪ع الاقل من الدخل",
" تجنب المخاوف من خلال التعلم من تجارب مختلفه",
" الحفاظ ع السمعه لانها اغلي ما يملك الانسان",
" تحويل الاعداء الي اصدقاء من خلال القيام بعمل جيد",
"لا تصدق كل ما تسمعع. ولا تنفق كل ما تمتلك . ولا تنم قدر ما ترغب ",
" اعتني بسمعتك جيدا فستثبت للك الايام انها اغلي ما تملك",
"حين تقول والدتك ستندم ع فعل ذالك ستندم عليه غالبا.. ",
" لا تخش العقبات الكبيره فخلفها تقع الفرص العظيمه",
"قد لا يتطلب الامر اكثر من شخص واحد لقلب حياتك رأس ع عقب ",
"اختر رفيقه حياتك بحرص فهو قرار سيشكل 90٪من سعادتك او بؤسك ",
" اقلب اداءك الاصدقاء بفعل شي جميل ومفجائ لهم",
"حين تدق الفرصه ع باباك ادعوها للبيت ",
"تعلم القواعد جيدا ثن اكسر بعدها ",
"احكم ع نجاحك من خلال قدرتك ع العطاء وليس الاخذ ",
" لا تتجاهل الشيطان مهما بدل ثيابه",
"ركز ع جعل الاشياء افضل وليس اكبر او اعظم ",
"كن سعيد  بما تمتلك واعمل لامتلاك ما تريد ",
"اعط الناس اكثر من ما يتوقعون ",
" لا تكن منشغل لدرجه عدم التعرف ع اصدقاء جدد",
"استحمه يوم العيد يمعفن🤓",
"مش تحب اي حد يقرب منك ",
" خليك مع البت راجل خليك تقيل🥥",
" انصح نفسك بنفسك بمت😆",
" كنت نصحت نفسي ياخويا😹", 
} 
return bot.sendText(msg_chat_id,msg_id,vBandav_Msg[math.random(#vBandav_Msg)],'md')
end
end
if text == "نكته" or text == "قولي نكته" or text == "عايز اضحك" then 
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
local texting = {" مرة واحد مصري دخل سوبر ماركت في الكويت عشان يشتري ولاعة راح عشان يحاسب بيقوله الولاعة ديه بكام قاله دينار قاله منا عارف ان هي نار بس بكام 😂",
"بنت حبت تشتغل مع رئيس عصابة شغلها في غسيل الأموال 😂",
"واحد بيشتكي لصاحبه بيقوله أنا مافيش حد بيحبني ولا يفتكرني أبدًا، ومش عارف أعمل إيه قاله سهلة استلف من الناس فلوس هيسألوا عليك كل يوم 😂",
"ﻣﺮه واﺣﺪ ﻣﺴﻄﻮل ﻣﺎﺷﻰ ﻓﻰ اﻟﺸﺎرع ﻟﻘﻰ مذﻳﻌﻪ ﺑﺘﻘﻮﻟﻪ ﻟﻮ ﺳﻤﺤﺖ ﻓﻴﻦ اﻟﻘﻤﺮ؟ ﻗﺎﻟﻬﺎ اﻫﻮه ﻗﺎﻟﺘﻠﻮ ﻣﺒﺮوك ﻛﺴﺒﺖ ﻋﺸﺮﻳﻦ ﺟﻨﻴﻪ ﻗﺎﻟﻬﺎ ﻓﻰ واﺣﺪ ﺗﺎﻧﻰ ﻫﻨﺎك اﻫﻮه 😂",
"واحده ست سايقه على الجي بي اي قالها انحرفي قليلًا قلعت الطرحة 😂",
"مرة واحد غبي معاه عربية قديمة جدًا وبيحاول يبيعها وماحدش راضي يشتريها.. راح لصاحبه حكاله المشكلة صاحبه قاله عندي لك فكرة جهنمية هاتخليها تتباع الصبح أنت تجيب علامة مرسيدس وتحطها عليها. بعد أسبوعين صاحبه شافه صدفة قاله بعت العربية ولا لاء؟ قاله انت  مجنون حد يبيع مرسيدس ??",
"مره واحد بلديتنا كان بيدق مسمار فى الحائط فالمسمار وقع منه فقال له :تعالى ف مجاش, فقال له: تعالي ف مجاش. فراح بلديتنا رامي على المسمار شوية مسمامير وقال: هاتوه 😂",
"واحدة عملت حساب وهمي ودخلت تكلم جوزها منه ومبسوطة أوي وبتضحك سألوها بتضحكي على إيه قالت لهم أول مرة يقول لي كلام حلو من ساعة ما اتجوزنا 😂",
"بنت حبت تشتغل مع رئيس عصابة شغلها في غسيل الأموال 😂",
"مره واحد اشترى فراخ علشان يربيها فى قفص صدره 😂",
"مرة واحد من الفيوم مات اهله صوصوا عليه 😂",
"ﻣﺮه واﺣﺪ ﻣﺴﻄﻮل ﻣﺎﺷﻰ ﻓﻰ اﻟﺸﺎرع ﻟﻘﻰ مذﻳﻌﻪ ﺑﺘﻘﻮﻟﻪ ﻟﻮ ﺳﻤﺤﺖ ﻓﻴﻦ اﻟﻘﻤﺮ ﻗﺎﻟﻬﺎ اﻫﻮه ﻗﺎﻟﺘﻠﻮ ﻣﺒﺮوك ﻛﺴﺒﺖ ﻋﺸﺮﻳﻦ ﺟﻨﻴﻪ ﻗﺎﻟﻬﺎ ﻓﻰ واﺣﺪ ﺗﺎﻧﻰ ﻫﻨﺎك اﻫﻮه 😂",
"مره واحد شاط كرة فى المقص اتخرمت. 😂",
"مرة واحد رايح لواحد صاحبهفا البواب وقفه بيقول له انت طالع لمين قاله طالع أسمر شوية لبابايا قاله يا أستاذ طالع لمين في العماره 😂",
} 
return bot.sendText(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
end
end
if text == "تحدي" then 
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
local texting = {
"اتحداك تصور نفسك وانت نايم",
"اتحداك تقول لبنت بحبك ",
"اتحداك تلعب 2000 ضغط دلوقتي 😂",
" اتحداك تقول اسم كراش الطفوله ♥️😹 ↫",
"اتحداك تقول لحد امك رقاصه ↫",
"اتحداك تقطع 10 جنيه دلوقتي 😂♥",
"اتحداك تفتح كام وتقول كبسو كبسو 🤡😹",
"اتحداك تقول انا م راجل 😹🤡",
"اتحداك تدي لبنت بوسه 🥹❤️",
"اتحداك تقول انا مرا 😹❤️",
"اتحداك ترمي فونك علي الارض 😹 ",
"اتحداك تطلع كام ترقص 😹❤️",
"اتحدتك تنط من فوق السطح 😹❤️",
"اتحداك تشتم حد 😹",
"اتحداك تصور رجلك 😹✨",
}  
selva = texting[math.random(#texting)]
return bot.sendText(msg_chat_id,msg_id,"* "..selva.." *","md",true)
end
end
--------------------------------------------------------------
if text == "تفعيل الشخصيه" or text == "تفعيل شخصيتي" then
if not msg.Admin then
send(msg_chat_id,msg_id,'*\n • هذا الامر يخص〘  '..Controller_Num(7)..' 〙*',"md",true)  
end
Redis:del(Fast.."Timo:TI"..msg_chat_id)
send(msg_chat_id,msg_id,'*\n • تم تفعيل شخصيتي *',"md",true)  
end
if text == "تعطيل الشخصيه" or text == "تعطيل شخصيتي" then
if not msg.Admin then
send(msg_chat_id,msg_id,'*\n • هذا الامر يخص〘  '..Controller_Num(7)..' 〙*',"md",true)  
end
Redis:set(Fast.."Timo:TI"..msg_chat_id,"off")
send(msg_chat_id,msg_id,'*\n • تم تعطيل شخصيتي *',"md",true)  
end
if (text == 'شخصيتي' or text == 'حدد شخصيتي' or text == 'الشخصيه') and not Redis:get(Fast.."Timo:TI"..msg_chat_id) then
local texting = {"عنيده", "متردده  ","خبيثة  ", "ايجابية ", "غامضة  ", "ضعيفة ", "كلاسيكية  ", "مسالمة  ", "حماسية ", "قيادية  ", "شكاك  ", "رومنسية  ","محفزة  ","متعاونة  ","اجتماعية  ","عصبية ","نرجسية  ","انطوائية  ","مظلومة  ",} 
zezee = texting[math.random(#texting)]
local Selva = bot.getUser(msg.sender_id.user_id)
local photo = bot.getUserProfilePhotos(msg.sender_id.user_id)
local news = '🥺♥️ شخصيتك ⇿ '..zezee
if photo.total_count > 0 then
data = {} 
data.inline_keyboard = {
{
{text =news,url = "https://t.me/"..Selva.username..""}, 
},
}
local msgg = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg.chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&photo=".. URL.escape(news).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(data))
end
end 
--------------------------------------------------------------
--------------------------------------------------------------
if text == "تفعيل مهنه" or text == "تفعيل مهنتي" then
if not msg.Admin then
send(msg_chat_id,msg_id,'*\n • هذا الامر يخص〘  '..Controller_Num(7)..' 〙*',"md",true)  
end
Redis:del(Fast.."sxnxx"..msg_chat_id)
send(msg_chat_id,msg_id,'*\n • تم تفعيل امر مهنتي *',"md",true)  
end
if text == "تعطيل مهنتي" or text == "تعطيل مهنه" then
if not msg.Admin then
send(msg_chat_id,msg_id,'*\n • هذا الامر يخص〘  '..Controller_Num(7)..' 〙*',"md",true)  
end
Redis:set(Fast.."sxnxx"..msg_chat_id,"off")
send(msg_chat_id,msg_id,'*\n • تم تعطيل امر مهنتي *',"md",true)  
end
if (text == 'مهنتي' or text == 'المهنه' or text == 'المهنة') and not Redis:get(Fast.."sxnxx"..msg_chat_id) then
local FiJABWA = (Redis:get(Fast.."Game:name"..senderr) or "لا يوجد")
local JABWA = FiJABWA:gsub('@','')
local Fixage = (Redis:get(Fast.."Game:Sunni"..senderr) or "لا يوجد")
local Fast = Fixage:gsub('@','')
local texting = {"نقاش", "دكتور","دكتوره", "طيار ", "طياره", "مدرس ", "مدير", "مديره", "محاسب ", "محسابه", "نقاشه", "مدير بنك","مديرة بنك","وزير","وزيره","ظابط ","ظابطه","شيخه","شيخ",} 
zezee = texting[math.random(#texting)]
local Age = {"سنجل", "اعزب","متجوز", "سنجله ", "متجوزه", "ارمل ", "مصلقه", "خاطب", "مخطوبه ", "سعيد", "حزين", "غني","فقير",} 
ageu = Age[math.random(#Age)]
local Jabwa = bot.getUser(senderr)
local photo = bot.getUserProfilePhotos(senderr)
local profession1 = '🎀 اسمك ⇿ '..JABWA
local profession2 = '✨ سنك ⇿ '..Fast
local profession3 = '♥ مهنتك ⇿ '..zezee
local profession4 = '❇️ حالتك ⇿ '..ageu
if photo.total_count > 0 then
data = {} 
data.inline_keyboard = {
{
{text =profession1,url = "https://t.me/"..Jabwa.username..""}, 
},
{
{text =profession2,url = "https://t.me/"..Jabwa.username..""}, 
},
{
{text =profession3,url = "https://t.me/"..Jabwa.username..""}, 
},
{
{text =profession4,url = "https://t.me/"..Jabwa.username..""}, 
},
}
local msgg = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg.chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&photo=".. URL.escape(zezee).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(data))
end 
end
--------------------------------------------------------------
--------------------------------------------------------------
if text == "انا مين" or text == "أنا مين" then
if not Redis:get(Fast.."SOFI:Channe:Vip"..senderr) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="وضع قناتي",data="/ChangeChanneVip:"..senderr}},
{{text="اخفاء",data="/HideChanneVip:"..senderr}},
}
}
bot.sendText(msg_chat_id,msg_id,Reply_Status(senderr,"* • انت لم تقم باضافة قناتك مسبقا\n • قم بارسال ⇿ ضع قناتي + معرف قناتك\n • او قم بالضغط علي وضع قناتي\n • ثم أرسل الامر ⇿ انا مين *").unLock,"md",true, false, false, false, reply_markup)
else
local UserInfo = bot.getUser(senderr)
local bio = getbio(senderr)
local photo = bot.getUserProfilePhotos(senderr)
if photo and photo.total_count and photo.total_count > 0 then
local FiJABWA = (UserInfo.first_name):gsub('#','')
local FixChannel = (Redis:get(Fast.."SOFI:Channe:Vip"..senderr) or "لا يوجد")
local DevSOFI = FixChannel:gsub('@','')
local FixGroupl = (Redis:get(Fast.."SOFI:Group:Vip"..senderr) or "لا يوجد")
local JABWA = FixGroupl:gsub('@','')
local FixBot = (Redis:get(Fast.."SOFI:Bot:Vip"..senderr) or "لا يوجد")
local BOT = FixBot:gsub('@','')
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="قناتك ❇️",url="t.me/"..DevSOFI},{text="⚡ جروبك",url="t.me/"..JABWA}},
{{text="• بوتك 🤖",url="t.me/"..BOT}},
{{text=" "..FiJABWA.." ",url=("t.me/"..UserInfo.username or "t.me/Sudanese_56")}},
}}
bot.sendPhoto(msg_chat_id, msg_id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id, bio, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
return false
else
bot.sendText(msg_chat_id,msg_id,'*لا تمتلك صوره في حسابك*',"md",true)  
end
end
end
--------------------------------------------------------------
if text == "تفعيل نسبه جمالي" or text == "تفعيل جمالي" then
if not msg.Admin then
send(msg_chat_id,msg_id,'*\n • هذا الامر يخص 〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
Redis:del(Fast.."mybuti"..msg_chat_id)
send(msg_chat_id,msg_id,'*\n • تم تفعيل امر جمالي *',"md",true)  
end
if text == "تعطيل جمالي" or text == "تعطيل نسبه جمالي" then
if not msg.Admin then
send(msg_chat_id,msg_id,'*\n • هذا الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
Redis:set(Fast.."mybuti"..msg_chat_id,"off")
send(msg_chat_id,msg_id,'*\n • تم تعطيل امر جمالي *',"md",true)  
end
if text == 'جمالي' or text == 'نسبه جمالي' then
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
local Selva = "*• نسبه جمالي معطله يا "..Text.."\n√*"
if Redis:get(Fast.."mybuti"..msg.chat_id) then
send(msg_chat_id, msg_id, Selva, "md", true) 
else
local Timo = "*• نسبه جمالك يا ⦉ "..Text.." ⦊*"
local photo = bot.getUserProfilePhotos(senderr)
local SelvaGm
if senderr == 6702141393 or senderr == 1490860206 then
SelvaGm = "100"
else
local nspp = {}
for i = 0, 100 do
table.insert(nspp, tostring(i))
end
SelvaGm = nspp[math.random(#nspp)]
end
data = {} 
data.inline_keyboard = {
{
{text = 'نسبه جمالك يا قمر '..SelvaGm..' 🥺♥️', url = "https://t.me/"..bain.username}, 
},
}
local msgg = msg_id / 2097152 / 0.5
if photo.total_count > 0 then
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&reply_to_message_id="..msgg.."&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption="..URL.escape(Timo).."&parse_mode=markdown&disable_web_page_preview=true&has_spoiler=true&reply_markup="..JSON.encode(data))
else
send(msg_chat_id, msg_id,Timo.." *هـي "..SelvaGm.."% 🥺♥️*", "md", true)
end
end
end
--------------------------------------------------------------
--------------------------------------------------------------
if text == "صورتي" then
if Redis:get(Fast.."myphoto"..msg.chat_id) then
send(msg_chat_id,msg_id,'*• الصوره معطله*',"md",true) 
else
local photo = bot.getUserProfilePhotos(senderr)
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
if photo.total_count > 0 then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'صورتك التاليه', callback_data=senderr.."/sorty2"},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&reply_to_message_id="..rep.."&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption="..URL.escape("*• صورتك يا ⦉ "..Text.." ⦊\n• عدد صورك هو ⦉ "..photo.total_count.." ⦊ صوره*").."&parse_mode=markdown&disable_web_page_preview=true&has_spoiler=true&reply_markup="..JSON.encode(keyboard))
else
return send(msg_chat_id,msg_id,'*• لا توجد صوره ف حسابك*',"md",true) 
end
end
end
if text ==("صورته") and msg.reply_to_message_id ~= 0 or text ==("صورتة") and msg.reply_to_message_id ~= 0 then 
if Redis:get(Fast.."myphoto"..msg.chat_id) then
send(msg_chat_id,msg_id,'*• الصوره معطله*',"md",true) 
else
local Message_Reply = bot.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Reply.Fastbots == "error" then
return bot.sendText(msg_chat_id,msg_id,"*\n • عذرا هذا المستخدم غير مدعوم *","md",true)  
end
local photo = bot.getUserProfilePhotos(Message_Reply.sender_id.user_id)
local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
if photo and photo.total_count and photo.total_count > 0 then
local Text = " • عدد صوره هو ⇿ "..photo.total_count.." صوره"
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = ' '..UserInfo.first_name..' ', url = 't.me/'..UserInfo.username}, },{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url = 't.me/Sudanese_56'},},}}
bot.sendPhoto(msg_chat_id, msg_id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id, Text, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
else
return bot.sendText(msg_chat_id,msg_id,'* • لا توجد صوره ف حسابك*',"md",true) 
end
end
end
if text and (text:match('^صورته (%d+)$') or text:match('^صورتة (%d+)$')) then
local UserId = (text:match('^صورته (%d+)$') or text:match('^صورتة (%d+)$'))
if Redis:get(Fast.."myphoto"..msg.chat_id) then
send(msg_chat_id,msg_id,'*• الصوره معطله*',"md",true) 
else
local UserInfo = bot.getUser(UserId)
local photo = bot.getUserProfilePhotos(UserId)
if photo and photo.total_count and photo.total_count > 0 then
local Text = " • عدد صوره هو ⇿ "..photo.total_count.." صوره"
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = ' '..UserInfo.first_name..' ', url = 't.me/'..UserInfo.username}, },{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url = 't.me/Sudanese_56'},},}}
bot.sendPhoto(msg_chat_id, msg_id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id, Text, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
else
return bot.sendText(msg_chat_id,msg_id,'* • لا توجد صوره ف حسابك*',"md",true) 
end
end
end
if text and (text:match('^صورته @(%S+)$') or text:match('^صورتة @(%S+)$')) then
local UserName = (text:match('^صورته @(%S+)$') or text:match('^صورتة @(%S+)$'))
if Redis:get(Fast.."myphoto"..msg.chat_id) then
send(msg_chat_id,msg_id,'*• الصوره معطله*',"md",true) 
else
local UserId_Info = bot.searchPublicChat(UserName)
local photo = bot.getUserProfilePhotos(UserId_Info.id)
local UserInfo = bot.getUser(UserId_Info.id)
if photo and photo.total_count and photo.total_count > 0 then
local Text = " • عدد صوره هو ⇿ "..photo.total_count.." صوره"
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = ' '..UserInfo.first_name..' ', url = 't.me/'..UserInfo.username}, },{{text = '. 𝘀𝗼𝘂𝗿𝗰𝗲 🎀.', url = 't.me/Sudanese_56'},},}}
bot.sendPhoto(msg_chat_id, msg_id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id, Text, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
else
return bot.sendText(msg_chat_id,msg_id,'* • لا توجد صوره ف حسابك*',"md",true) 
end
end
end
--------------------------------------------------------------
--------------------------------------------------------------
if text == "بحبك" then
local Timo = bot.getUser(senderr)
local Name = '['..Timo.first_name..'](tg://user?id='..Timo.id..')' or 'لا يوجد اسم' 
local Timo = "*• وانا كمان بعشقك يا 🥺♥*\n"..Name.."\n*√*"
send(msg_chat_id,msg_id, Timo,"md",true)   
end
--------------------------------------------------------------
if text == "بات" or text == "محيبس" then   
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '➀ » { 👊 }', data = '/Mahibes1'}, {text = '➁ » { 👊 }', data = '/Mahibes2'}, 
},
{
{text = '➂ » { 👊 }', data = '/Mahibes3'}, {text = '➃ » { 👊 }', data = '/Mahibes4'}, 
},
{
{text = '➄ » { 👊 }', data = '/Mahibes5'}, {text = '➅ » { 👊 }', data = '/Mahibes6'}, 
},
}
}
return send(msg.chat_id,msg.id, [[*
• لعبه المحيبس هي لعبة الحظ 
• جرب حظك ويه البوت واتونس 
• كل ما عليك هوا الضغط على اليد في الازرار
*]],"md",false, false, false, false, reply_markup)
end
end
if text == "خمن" or text == "تخمين" then   
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Num = math.random(1,20)
Redis:set(Fast.."Game:Estimate"..msg.chat_id..msg.sender_id.user_id,Num)  
return send(msg.chat_id,msg.id,"\n• اهلا بك عزيزي في لعبة التخمين :\nٴ━━━━━━━━━━\n".."• ملاحظه لديك { 3 } محاولات فقط فكر قبل ارسال تخمينك \n\n".."• سيتم تخمين عدد ما بين ال {1 و 20} اذا تعتقد انك تستطيع الفوز جرب واللعب الان ؟ ","md",true)  
end
end
if text == "اضف نكته" or text == "اضف نكتة" then
if not msg.Dev then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص'..Controller_Num(1)..' * ',"md",true)
end
Redis:set(Fast.."Set:joke"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelamr'},
},
}
}
return send(msg_chat_id,msg_id,"*• ارسل الان النكتة* ","md",false, false, false, false, reply_markup)
end
if text and Redis:get(Fast.."Set:joke"..senderr..":"..msg_chat_id) == "true" then
Redis:del(Fast.."Set:joke"..senderr..":"..msg_chat_id)
Redis:sadd(Fast.."joke:", text)
return send(msg_chat_id,msg_id,"*• تم حفظ النكتة*","md",false, false, false, false, reply_markup)
end
-- joke rm
if text == "حذف نكته" or text == "حذف نكتة" then
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n*• هاذا الامر يخص'..Controller_Num(1)..' * ',"md",true)
end
Redis:set(Fast.."Set:joke"..senderr..":"..msg_chat_id, "rmjoke")
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelamr'},
},
}
}
return send(msg_chat_id,msg_id,"*• ارسل النكتة الذي تريد حذفه الان *","md",false, false, false, false, reply_markup)
end
if text and Redis:get(Fast.."Set:joke"..senderr..":"..msg_chat_id) == "rmjoke" then
Redis:del(Fast.."Set:joke"..senderr..":"..msg_chat_id)
Redis:srem(Fast.."joke:", text)
return send(msg_chat_id,msg_id,"• تم حذف النكته بنجاح ✅","md",false, false, false, false, reply_markup)
end
-- joke rm all
if text == 'مسح قائمه النكته' then
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص'..Controller_Num(1)..' * ',"md",true)
end
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local joke_list = Redis:smembers(Fast.."joke:") 
if #joke_list == 0 then
return send(msg_chat_id,msg_id,"• لا يوجد نكتة مضافه","md",true)
end
Redis:del(Fast.."joke:")
Redis:set(Fast.."joke_defullt:","true")
return send(msg_chat_id,msg_id,"• تم مسح جميع النكت بنجاح","md",true)
end
-- joke tweet
if text == "نكته" or text == "نكتة" then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
local list = Redis:smembers(Fast.."joke:")
randkk = list[math.random(#list)]
return send(msg_chat_id,msg_id,'['..randkk..']','md')
end
if not Redis:get(Fast.."joke:") then
send(msg_chat_id,msg_id,'• لا يوجد نكتة مضافه','md')
end
end
if text == 'اسئله' then   
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
t1 = [[
ماهو اطول نهر في العالم 
1- النيل  
2- الفرات 
3- نهر الكونغو

• ارسل  الجواب الصحيح فقط
]]
t2 = [[
ماعدد عظام الوجه؟
1- 15
2- 13
3- 14 

• ارسل  الجواب الصحيح فقط
]]
t3 =[[
كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون؟

1- الفم 
2- الاذن
3- الثلاجه

• ارسل  الجواب الصحيح فقط
]]
t4 =[[
كم جزء تحتوي مسلسل وادي الذئاب؟

1- 7
2- 15
3- 11

• ارسل  الجواب الصحيح فقط
]]
t5 =[[
كم جزء يحتوي القران الكريم؟

1- 60
2- 70
3- 30 

• ارسل  الجواب الصحيح فقط
]]
t6 =[[
من هوه اغنى رئيس في العالم؟

1- ترامب
2- اوباما
3- بوتين  

• ارسل  الجواب الصحيح فقط
]]

t7 =[[
من هوه مؤسس شركه ابل العالميه 

1-لاري بايج 
2- بيا غايتز
3- ستيف جوبر

• ارسل  الجواب الصحيح فقط
]]
t8 =[[
ماهي عاصمه فرنسا؟

1- باريس 
2- لوين 
3- موسكو 

• ارسل  الجواب الصحيح فقط
]]
t9 =[[
ماعدد دول العربيه التي توجد في افريقيا 

1- 10 
2- 17
3- 9

• ارسل  الجواب الصحيح فقط
]]
t11 =[[
ماهو الحيوان الذي يحمل 50 فوق وزنه؟
1-الفيل
2- النمل  
3- الثور

• ارسل  الجواب الصحيح فقط
]]
t12 =[[
ماذا يوجد بيني وبينك؟  
1- الضل
2- الاخلاق
3-حرف الواو  

• ارسل  الجواب الصحيح فقط
]]
t13 =[[
ماهو الشيء النبات ينبت للانسان بلا بذر؟
1-الاضافر 
2- الاسنان
3- الشعر

• ارسل  الجواب الصحيح فقط
]]
t14 =[[
م̷ـــِْن هو اول الرسول الى الارض؟
1- ادم
2- نوح
3-ابراهيم 

• ارسل  الجواب الصحيح فقط
]]
t15 =[[
ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين؟
1- سحاب
2- بئر
3- نهر

• ارسل  الجواب الصحيح فقط
]]
t16 =[[
ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا؟
1- العمر
2- ساعه
3- الاسم

• ارسل  الجواب الصحيح فقط
]]
t17 =[[
اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم
1- نحاس
2- الماس
3- ذهب

• ارسل  الجواب الصحيح فقط
]]
t18 =[[
في الليل ثلاثة لكنه في النهار واحده فما هو
 1- حرف الباء
 2- حرف الام 
3- حرف الراء

• ارسل  الجواب الصحيح فقط
]]
t19 =[[
على قدر اصل العزم تأتي؟
1- العزائم 
2- المكارم
3- المبائب

• ارسل  الجواب الصحيح فقط
]]

t20 =[[
ماهي جمع كلمه انسه ؟
1- سيدات
2- انسات 
3- قوانص

• ارسل  الجواب الصحيح فقط
]]
t21 =[[
اله اتسعلمت قديما في الحروب؟
1- الصاروخ
2- المسدس
3- المنجنيق 

• ارسل  الجواب الصحيح فقط
]]
t22 =[[
تقع لبنان في قاره؟
1- افريقيا 
2- اسيا  
3- امركيا الشماليه

• ارسل  الجواب الصحيح فقط
]]

t23 =[[
1- ماهو الحيوان الذي يلقب بملك الغابه؟
1-الفيل
2- الاسد 
3- النمر

• ارسل  الجواب الصحيح فقط
]]
t24 =[[
كم صفرا للمليون ؟
1- 4 
2- 3
3-6

• ارسل  الجواب الصحيح فقط
]]
t25 =[[
ما اسم صغير الحصان؟
1- مهر  
2- جرو
3- عجل

• ارسل  الجواب الصحيح فقط
]]
t26 =[[
ما الحيوان الذي ينام واحدى عينه مفتوحه؟

1- القرش
2- الدلفين 
3- الثعلب

• ارسل  الجواب الصحيح فقط
]]
t27 =[[
ماهي القاره التي تلقب بالقاره العجوز؟

1- امريكا الشماليه 
2- امريكا الجنوبيه
3- افريقيا 

• ارسل  الجواب الصحيح فقط
]]
t28 =[[
ما اسم المعدن الموجود فيي الحاله السائله 

1- النحاس 
2- الحديد
3- الزئبق 
 
• ارسل  الجواب الصحيح فقط
]]
t29 =[[
ماهي عاصمه انجلترا؟
1- لندن  
2- لفرسول
3- تركيا

• ارسل  الجواب الصحيح فقط
]]
t30 =[[
ماهو الشئ الذي برأسه سبع فتحات

1- الهاتف
2- التلفاز
3- الانسان 

• ارسل  الجواب الصحيح فقط
]]
t31 =[[
ماهي عاصمه اليابان ؟
1- بانقول
2- نيو دلهي
3- طوكيو 

• ارسل  الجواب الصحيح فقط
]]
t32 =[[
من هي زوجه الرسول الاكبر منه سنآ؟

1- حفضه
2- زينب 
3- خديجه 

• ارسل  الجواب الصحيح فقط
]]
TAHA = {t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,t31,t32,t1,t2,t3,t4,t5,t6,t7,t8,t9,t11,t12,t13,t14,t15}
local SENDTEXT = TAHA[math.random(#TAHA)]
if SENDTEXT:find('النيل') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'النيل') 
elseif SENDTEXT:find('14') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'14') 
elseif SENDTEXT:find('الفم') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الفم') 
elseif SENDTEXT:find('11') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'11') 
elseif SENDTEXT:find('30') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'30') 
elseif SENDTEXT:find('بوتين') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'بوتين') 
elseif SENDTEXT:find('ستيف جوبر') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'ستيف جوبر') 
elseif SENDTEXT:find('باريس') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'باريس') 
elseif SENDTEXT:find('10') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'10') 
elseif SENDTEXT:find('النمل') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'النمل') 
elseif SENDTEXT:find('حرف الواو') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'حرف الواو') 
elseif SENDTEXT:find('الشعر') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الشعر') 
elseif SENDTEXT:find('ابراهيم') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'ابراهيم') 
elseif SENDTEXT:find('سحاب') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'سحاب') 
elseif SENDTEXT:find('الاسم') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الاسم') 
elseif SENDTEXT:find('ذهب') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'ذهب') 
elseif SENDTEXT:find('حرف الام') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'حرف الام') 
elseif SENDTEXT:find('العزائم') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'العزائم') 
elseif SENDTEXT:find('انسات') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'انسات') 
elseif SENDTEXT:find('المنجنيق') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'المنجنيق') 
elseif SENDTEXT:find('اسيا') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'اسيا') 
elseif SENDTEXT:find('الاسد') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الاسد') 
elseif SENDTEXT:find('6') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'6') 
elseif SENDTEXT:find('مهر') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'مهر') 
elseif SENDTEXT:find('الدلفين') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الدلفين') 
elseif SENDTEXT:find('اوروبا') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'اوروبا') 
elseif SENDTEXT:find('الزئبق') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الزئبق') 
elseif SENDTEXT:find('لندن') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'لندن') 
elseif SENDTEXT:find('الانسان') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الانسان') 
elseif SENDTEXT:find('طوكيو') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'طوكيو') 
elseif SENDTEXT:find('خديجه') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'خديجه') 
end
send(msg.chat_id,msg.id,SENDTEXT)     
return false  
end
end
if Redis:get(Fast.."GAME:CHER"..msg.chat_id) and (text == Redis:get(Fast.."GAME:CHER"..msg.chat_id)) then  
if text then
send(msg.chat_id,msg.id,'*• احسنت اجابتك صحيحه ✓*',"md")     
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(Fast.."GAME:CHER"..msg.chat_id)
elseif text == 'الفيل' or text == 'الثور' or text == 'الحصان' or text == '7' or text == '9' or text == '8' or text == 'لوين' or text == 'موسكو' or text == 'مانكو' or text == '20' or text == '30' or text == '28' or text == 'ترامب' or text == 'اوباما' or text == 'كيم جونغ' or text == '50' or text == '70' or text == '40' or text == '7' or text == '3' or text == '10' or text == '4' or text == 'الاذن' or text == 'الثلاجه' or text == 'الغرفه' or text == '15' or text == '17' or text == '25' or text == 'الفرات' or text == 'نهر الكونغو' or text == 'المسيبي' or text == 'بيا بايج' or text == 'لاري بيج' or text == 'بيا مارك زوكيربرج' or text == 'الفيل' or text == 'النمر' or text == 'الفهد' or text == 'بانقول' or text == 'نيو دلهي' or text == 'بيكن' or text == 'الهاتف' or text == 'التلفاز' or text == 'المذياع' or text == 'لفرسول' or text == 'تركيا' or text == 'بغداد' or text == 'النحاس' or text == 'الحديد' or text == 'الفضه' or text == 'امريكا الشماليه' or text == 'امريكا الجنوبيه' or text == 'افريقيا' or text == 'القرش' or text == 'الثعلب' or text == 'الكلب' or text == 'للجرو' or text == 'العجل' or text == 'الحمار' or text == '3' or text == '5' or text == '6' or text == 'اوربا' or text == 'افريقيا' or text == 'امريكا الجنوبيه' or text == 'افريقيا' or text == 'امريكا الشماليه' or text == 'اوربا' or text == 'الصاروخ' or text == 'المسدس' or text == 'الطائرات' or text == 'سيدات' or text == 'قوانص' or text == 'عوانس' or text == 'المكارم' or text == 'المبائم' or text == 'المعازم' or text == 'حرف الغاء' or text == 'حرف الواو' or text == 'حرف النون' or text == 'نحاس' or text == 'الماس' or text == 'حديد' or text == 'العمر' or text == 'ساعه' or text == 'الحذاء' or text == 'بئر' or text == 'نهر' or text == 'شلال' or text == 'ادم' or text == 'نوح' or text == 'عيسئ' or text == 'الاضافر' or text == 'الاسنان' or text == 'الدموع' or text == 'الاخلاق' or text == 'الضل' or text == 'حرف النون'  then
local list = {'10' , 'براسي' , 'النمل' , '32' , 'بوتين' , '30' , '11' , 'الفم' , '14' , 'النيل' , 'ستيف جوبر' , 'خديجه' , 'الاسد' , 'طوكيو' , 'الانسان' , 'لندن' , 'الزئبق' , 'اورباالدولفين' , 'المهر' , '4' , 'اسيا' , 'اسيا' , 'المنجنيق' , 'انسات' , 'العزائم' , 'حرف الام' , 'ذهب' , 'الاسم' , 'سحاب' , 'ابراهيم' , 'الشعر' , 'حرف الواو'}
for k, v in pairs(list) do 
if text ~= v then
Redis:del(Fast.."GAME:CHER"..msg.chat_id)
send(msg.chat_id,msg.id,'• اجابتك خاطئه للاسف ,')     
return false  
end
end
end
end
if text == 'رياضيات' then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
xxx = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = xxx[math.random(#xxx)]

Redis:set(Fast..'bot:bkbk6'..msg.chat_id,name)
name = string.gsub(name,'9','7 + 2 = ?') name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?') name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?') name = string.gsub(name,'4','40 ÷ 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?') name = string.gsub(name,'10','100 ÷ 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?') name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?') name = string.gsub(name,'5','12 + 1 - 8 = ?') name = string.gsub(name,'16','16 + 16 - 16 = ?')
send(msg.chat_id,msg.id,'• اكمل المعادله ،\n - {'..name..'} .')     
end 
end
if text == 'انجليزي' then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
yyy = {'معلومات','قنوات','مجموعات','كتاب','تفاحه','سدني','نقود','اعلم','ذئب','تمساح','ذكي','شاطئ','غبي',};
name = yyy[math.random(#yyy)]
Redis:set(Fast..'bot:bkbk7'..msg.chat_id,name)
name = string.gsub(name,'ذئب','Wolf') name = string.gsub(name,'معلومات','Information')
name = string.gsub(name,'قنوات','Channels') name = string.gsub(name,'مجموعات','Groups')
name = string.gsub(name,'كتاب','Book') name = string.gsub(name,'تفاحه','Apple')
name = string.gsub(name,'نقود','money') name = string.gsub(name,'اعلم','I know')
name = string.gsub(name,'تمساح','crocodile') name = string.gsub(name,'شاطئ','Beach')
name = string.gsub(name,'غبي','Stupid') name = string.gsub(name,'صداقه','Friendchip')
name = string.gsub(name,'ذكي','Smart') 
send(msg.chat_id,msg.id,' •ما معنى كلمه {'..name..'} ، ')     
end
end
if text == 'نعم' and Redis:get(Fast..":Witting_StartGame:"..msg.chat_id..msg.sender_id.user_id) then
local list = Redis:smembers(Fast..':List_Rolet:'..msg.chat_id) 
if #list == 1 then 
return send(msg.chat_id,msg.id,"• لم يكتمل العدد الكلي للاعبين .!؟" )
elseif #list == 0 then 
return send(msg.chat_id,msg.id,"• عذرا لم تقوم باضافه اي لاعب .؟!" )
end 
local UserName = list[math.random(#list)]
local data = bot.searchPublicChat(UserName)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 5)  
Redis:del(Fast..':List_Rolet:'..msg.chat_id) 
Redis:del(Fast..":Witting_StartGame:"..msg.chat_id..msg.sender_id.user_id)
return send(msg.chat_id,msg.id,'• تم اختيار الشخص الاتي\n• صاحب الحظ {'..UserName..'}\n• ربحت معنا 5 نقاط' )
end
if text == 'الاعبين' then
local list = Redis:smembers(Fast..':List_Rolet:'..msg.chat_id) 
local Text = '\n*ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ*\n' 
if #list == 0 then 
return send(msg.chat_id,msg.id, '*• * لا يوجد لاعبين هنا ' )
end 
for k, v in pairs(list) do 
Text = Text..k.."• » [" ..v.."] »\n"  
end 
return Text
end
if text and text:match("^(%d+)$") and Redis:get(Fast..":Start_Rolet:"..msg.chat_id..msg.sender_id.user_id) then  --// استقبال اللعبه الدمبله
if text == "1" then
Text = "*• * لا استطيع بدء اللعبه بلاعب واحد فقط\n"
else
Redis:set(Fast..":Number_Add:"..msg.chat_id..msg.sender_id.user_id,text)  
Text = '• تم بدء تسجيل اللسته \n• يرجى ارسال المعرفات \n• الفائز يحصل على (5) مجوهره\n• عدد الاعبين المطلوبه { *'..text..'* } لاعب \n 🏹'
end
Redis:del(Fast..":Start_Rolet:"..msg.chat_id..msg.sender_id.user_id)  
return send(msg.chat_id,msg.id,Text)    
end
if text and text:match('^(@[%a%d_]+)$') and Redis:get(Fast..":Number_Add:"..msg.chat_id..msg.sender_id.user_id) then    --// استقبال الاسماء
if Redis:sismember(Fast..':List_Rolet:'..msg.chat_id,text) then
return send(msg.chat_id,msg.id,'*• * المعرف {['..text..']} موجود اساسا' ,"md")
end
Redis:sadd(Fast..':List_Rolet:'..msg.chat_id,text)
local CountAdd = Redis:get(Fast..":Number_Add:"..msg.chat_id..msg.sender_id.user_id)
local CountAll = Redis:scard(Fast..':List_Rolet:'..msg.chat_id)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
Redis:del(Fast..":Number_Add:"..msg.chat_id..msg.sender_id.user_id) 
Redis:setex(Fast..":Witting_StartGame:"..msg.chat_id..msg.sender_id.user_id,1400,true)  
return send(msg.chat_id,msg.id,"*• *تم ادخال المعرف { ["..text.."] } \n• **وتم اكتمال العدد الكلي \n• هل انت مستعد ؟ اجب بـ {* نعم *}","md")
end 
return send(msg.chat_id,msg.id,"*• * تم ادخال المعرف { ["..text.."] } \n• تبقى { *"..CountUser.."* } لاعبين ليكتمل العدد\n• ارسل المعرف التالي ",'md')
end
if text == ''..(Redis:get(Fast..'bot:bkbk6'..msg.chat_id) or 'لفاتع')..'' then
send(msg.chat_id,msg.id,'• مبروك لقد ربحت ،\nللعب مره اخرى ارسل رياضيات . ',"md")   
Redis:del(Fast..'bot:bkbk6'..msg.chat_id)  
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
end 
if text == ''..(Redis:get(Fast..'bot:bkbk7'..msg.chat_id) or 'لفاتع')..'' then
send(msg.chat_id,msg.id,'• مبروك لقد ربحت ،\nللعب مره اخرى ارسل انكليزي . ')     
Redis:del(Fast..'bot:bkbk7'..msg.chat_id)  
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
end

if text == "خيرني" or text == "لو خيروك" or text == "خيروك" then 
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
local vBandav_Msg = { 
"لو خيروك |  بين الإبحار لمدة أسبوع كامل أو السفر على متن طائرة لـ 3 أيام متواصلة؟ ",
"لو خيروك |  بين شراء منزل صغير أو استئجار فيلا كبيرة بمبلغ معقول؟ ",
"لو خيروك |  أن تعيش قصة فيلم هل تختار الأكشن أو الكوميديا؟ ",
"لو خيروك |  بين تناول البيتزا وبين الآيس كريم وذلك بشكل دائم؟ ",
"لو خيروك |  بين إمكانية تواجدك في الفضاء وبين إمكانية تواجدك في البحر؟ ",
"لو خيروك |  بين تغيير وظيفتك كل سنة أو البقاء بوظيفة واحدة طوال حياتك؟ ",
"لو خيروك |  أسئلة محرجة أسئلة صراحة ماذا ستختار؟ ",
"لو خيروك |  بين الذهاب إلى الماضي والعيش مع جدك أو بين الذهاب إلى المستقبل والعيش مع أحفادك؟ ",
"لو كنت شخص آخر هل تفضل البقاء معك أم أنك ستبتعد عن نفسك؟ ",
"لو خيروك |  بين الحصول على الأموال في عيد ميلادك أو على الهدايا؟ ",
"لو خيروك |  بين القفز بمظلة من طائرة أو الغوص في أعماق البحر؟ ",
"لو خيروك |  بين الاستماع إلى الأخبار الجيدة أولًا أو الاستماع إلى الأخبار السيئة أولًا؟ ",
"لو خيروك |  بين أن تكون رئيس لشركة فاشلة أو أن تكون موظف في شركة ناجحة؟ ",
"لو خيروك |  بين أن يكون لديك جيران صاخبون أو أن يكون لديك جيران فضوليون؟ ",
"لو خيروك |  بين أن تكون شخص مشغول دائمًا أو أن تكون شخص يشعر بالملل دائمًا؟ ",
"لو خيروك |  بين قضاء يوم كامل مع الرياضي الذي تشجعه أو نجم السينما الذي تحبه؟ ",
"لو خيروك |  بين استمرار فصل الشتاء دائمًا أو بقاء فصل فصل ⋮ الصيف؟ ",
"لو خيروك |  بين العيش في القارة القطبية أو العيش في الصحراء؟ ",
"لو خيروك |  بين أن تكون لديك القدرة على حفظ كل ما تسمع أو تقوله وبين القدرة على حفظ كل ما تراه أمامك؟ ",
"لو خيروك |  بين أن يكون طولك 150 سنتي متر أو أن يكون 190 سنتي متر؟ ",
"لو خيروك |  بين إلغاء رحلتك تمامًا أو بقائها ولكن فقدان الأمتعة والأشياء الخاص بك خلالها؟ ",
"لو خيروك |  بين أن تكون اللاعب الأفضل في فريق كرة فاشل أو أن تكون لاعب عادي في فريق كرة ناجح؟ ",
"لو خيروك |  بين ارتداء ملابس البيت لمدة أسبوع كامل أو ارتداء البدلة الرسمية لنفس المدة؟ ",
"لو خيروك |  بين امتلاك أفضل وأجمل منزل ولكن في حي سيء أو امتلاك أسوأ منزل ولكن في حي جيد وجميل؟ ",
"لو خيروك |  بين أن تكون غني وتعيش قبل 500 سنة، أو أن تكون فقير وتعيش في عصرنا الحالي؟ ",
"لو خيروك |  بين ارتداء ملابس الغوص ليوم كامل والذهاب إلى العمل أو ارتداء ملابس جدك/جدتك؟ ",
"لو خيروك |  بين قص شعرك بشكل قصير جدًا أو صبغه باللون الوردي؟ ",
"لو خيروك |  بين أن تضع الكثير من الملح على كل الطعام بدون علم أحد، أو أن تقوم بتناول شطيرة معجون أسنان؟ ",
"لو خيروك |  بين قول الحقيقة والصراحة الكاملة مدة 24 ساعة أو الكذب بشكل كامل مدة 3 أيام؟ ",
"لو خيروك |  بين تناول الشوكولا التي تفضلها لكن مع إضافة رشة من الملح والقليل من عصير الليمون إليها أو تناول ليمونة كاملة كبيرة الحجم؟ ",
"لو خيروك |  بين وضع أحمر الشفاه على وجهك ما عدا شفتين أو وضع ماسكارا على شفتين فقط؟ ",
"لو خيروك |  بين الرقص على سطح منزلك أو الغناء على نافذتك؟ ",
"لو خيروك |  بين تلوين شعرك كل خصلة بلون وبين ارتداء ملابس غير متناسقة لمدة أسبوع؟ ",
"لو خيروك |  بين تناول مياه غازية مجمدة وبين تناولها ساخنة؟ ",
"لو خيروك |  بين تنظيف شعرك بسائل غسيل الأطباق وبين استخدام كريم الأساس لغسيل الأطباق؟ ",
"لو خيروك |  بين تزيين طبق السلطة بالبرتقال وبين إضافة البطاطا لطبق الفاكهة؟ ",
"لو خيروك |  بين اللعب مع الأطفال لمدة 7 ساعات أو الجلوس دون فعل أي شيء لمدة 24 ساعة؟ ",
"لو خيروك |  بين شرب كوب من الحليب أو شرب كوب من شراب عرق السوس؟ ",
"لو خيروك |  بين الشخص الذي تحبه وصديق الطفولة؟ ",
"لو خيروك |  بين أمك وأبيك؟ ",
"لو خيروك |  بين أختك وأخيك؟ ",
"لو خيروك |  بين نفسك وأمك؟ ",
"لو خيروك |  بين صديق قام بغدرك وعدوك؟ ",
"لو خيروك |  بين خسارة حبيبك/حبيبتك أو خسارة أخيك/أختك؟ ",
"لو خيروك |  بإنقاذ شخص واحد مع نفسك بين أمك أو ابنك؟ ",
"لو خيروك |  بين ابنك وابنتك؟ ",
"لو خيروك |  بين زوجتك وابنك/ابنتك؟ ",
"لو خيروك |  بين جدك أو جدتك؟ ",
"لو خيروك |  بين زميل ناجح وحده أو زميل يعمل كفريق؟ ",
"لو خيروك |  بين لاعب كرة قدم مشهور أو موسيقي مفضل بالنسبة لك؟ ",
"لو خيروك |  بين مصور فوتوغرافي جيد وبين مصور سيء ولكنه عبقري فوتوشوب؟ ",
"لو خيروك |  بين سائق سيارة يقودها ببطء وبين سائق يقودها بسرعة كبيرة؟ ",
"لو خيروك |  بين أستاذ اللغة العربية أو أستاذ الرياضيات؟ ",
"لو خيروك |  بين أخيك البعيد أو جارك القريب؟ ",
"لو خيروك |  يبن صديقك البعيد وبين زميلك القريب؟ ",
"لو خيروك |  بين رجل أعمال أو أمير؟ ",
"لو خيروك |  بين نجار أو حداد؟ ",
"لو خيروك |  بين طباخ أو خياط؟ ",
"لو خيروك |  بين أن تكون كل ملابس بمقاس واحد كبير الحجم أو أن تكون جميعها باللون الأصفر؟ ",
"لو خيروك |  بين أن تتكلم بالهمس فقط طوال الوقت أو أن تصرخ فقط طوال الوقت؟ ",
"لو خيروك |  بين أن تمتلك زر إيقاف موقت للوقت أو أن تمتلك أزرار للعودة والذهاب عبر الوقت؟ ",
"لو خيروك |  بين أن تعيش بدون موسيقى أبدًا أو أن تعيش بدون تلفاز أبدًا؟ ",
"لو خيروك |  بين أن تعرف متى سوف تموت أو أن تعرف كيف سوف تموت؟ ",
"لو خيروك |  بين العمل الذي تحلم به أو بين إيجاد شريك حياتك وحبك الحقيقي؟ ",
"لو خيروك |  بين معاركة دب أو بين مصارعة تمساح؟ ",
"لو خيروك |  بين إما الحصول على المال أو على المزيد من الوقت؟ ",
"لو خيروك |  بين امتلاك قدرة التحدث بكل لغات العالم أو التحدث إلى الحيوانات؟ ",
"لو خيروك |  بين أن تفوز في اليانصيب وبين أن تعيش مرة ثانية؟ ",
"لو خيروك |  بأن لا يحضر أحد إما لحفل زفافك أو إلى جنازتك؟ ",
"لو خيروك |  بين البقاء بدون هاتف لمدة شهر أو بدون إنترنت لمدة أسبوع؟ ",
"لو خيروك |  بين العمل لأيام أقل في الأسبوع مع زيادة ساعات العمل أو العمل لساعات أقل في اليوم مع أيام أكثر؟ ",
"لو خيروك |  بين مشاهدة الدراما في أيام السبعينيات أو مشاهدة الأعمال الدرامية للوقت الحالي؟ ",
"لو خيروك |  بين التحدث عن كل شيء يدور في عقلك وبين عدم التحدث إطلاقًا؟ ",
"لو خيروك |  بين مشاهدة فيلم بمفردك أو الذهاب إلى مطعم وتناول العشاء بمفردك؟ ",
"لو خيروك |  بين قراءة رواية مميزة فقط أو مشاهدتها بشكل فيلم بدون القدرة على قراءتها؟ ",
"لو خيروك |  بين أن تكون الشخص الأكثر شعبية في العمل أو المدرسة وبين أن تكون الشخص الأكثر ذكاءً؟ ",
"لو خيروك |  بين إجراء المكالمات الهاتفية فقط أو إرسال الرسائل النصية فقط؟ ",
"لو خيروك |  بين إنهاء الحروب في العالم أو إنهاء الجوع في العالم؟ ",
"لو خيروك |  بين تغيير لون عينيك أو لون شعرك؟ ",
"لو خيروك |  بين امتلاك كل عين لون وبين امتلاك نمش على خديك؟ ",
"لو خيروك |  بين الخروج بالمكياج بشكل مستمر وبين الحصول على بشرة صحية ولكن لا يمكن لك تطبيق أي نوع من المكياج؟ ",
"لو خيروك |  بين أن تصبحي عارضة أزياء وبين ميك آب أرتيست؟ ",
"لو خيروك |  بين مشاهدة كرة القدم أو متابعة الأخبار؟ ",
"لو خيروك |  بين موت شخصية بطل الدراما التي تتابعينها أو أن يبقى ولكن يكون العمل الدرامي سيء جدًا؟ ",
"لو خيروك |  بين العيش في دراما قد سبق وشاهدتها ماذا تختارين بين الكوميديا والتاريخي؟ ",
"لو خيروك |  بين امتلاك القدرة على تغيير لون شعرك متى تريدين وبين الحصول على مكياج من قبل خبير تجميل وذلك بشكل يومي؟ ",
"لو خيروك |  بين نشر تفاصيل حياتك المالية وبين نشر تفاصيل حياتك العاطفية؟ ",
"لو خيروك |  بين البكاء والحزن وبين اكتساب الوزن؟ ",
"لو خيروك |  بين تنظيف الأطباق كل يوم وبين تحضير الطعام؟ ",
"لو خيروك |  بين أن تتعطل سيارتك في نصف الطريق أو ألا تتمكنين من ركنها بطريقة صحيحة؟ ",
"لو خيروك |  بين إعادة كل الحقائب التي تملكينها أو إعادة الأحذية الجميلة الخاصة بك؟ ",
"لو خيروك |  بين قتل حشرة أو متابعة فيلم رعب؟ ",
"لو خيروك |  بين امتلاك قطة أو كلب؟ ",
"لو خيروك |  بين الصداقة والحب ",
"لو خيروك |  بين تناول الشوكولا التي تحبين طوال حياتك ولكن لا يمكنك الاستماع إلى الموسيقى وبين الاستماع إلى الموسيقى ولكن لا يمكن لك تناول الشوكولا أبدًا؟ ",
"لو خيروك |  بين مشاركة المنزل مع عائلة من الفئران أو عائلة من الأشخاص المزعجين الفضوليين الذين يتدخلون في كل كبيرة وصغيرة؟ ",
} 
selva = vBandav_Msg[math.random(#vBandav_Msg)]
return send(msg_chat_id,msg_id,"* "..selva.." * ",'md')
end
end
if text == "حروف" or text == "حرف" or text == "الحروف" then 
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
local vBandav_Msg = { 
" جماد بحرف › ر  ", 
" مدينة بحرف › ع  ",
" حيوان ونبات بحرف › خ  ", 
" اسم بحرف › ح  ", 
" اسم ونبات بحرف › م  ", 
" دولة عربية بحرف › ق  ", 
" جماد بحرف › ي  ", 
" نبات بحرف › ج  ", 
" اسم بنت بحرف › ع  ", 
" اسم ولد بحرف › ع  ", 
" اسم بنت وولد بحرف › ث  ", 
" جماد بحرف › ج  ",
" حيوان بحرف › ص  ",
" دولة بحرف › س  ",
" نبات بحرف › ج  ",
" مدينة بحرف › ب  ",
" نبات بحرف › ر  ",
" اسم بحرف › ك  ",
" حيوان بحرف › ظ  ",
" جماد بحرف › ذ  ",
" مدينة بحرف › و  ",
" اسم بحرف › م  ",
" اسم بنت بحرف › خ  ",
" اسم و نبات بحرف › ر  ",
" نبات بحرف › و  ",
" حيوان بحرف › س  ",
" مدينة بحرف › ك  ",
" اسم بنت بحرف › ص  ",
" اسم ولد بحرف › ق  ",
" نبات بحرف › ز  ",
"  جماد بحرف › ز  ",
"  مدينة بحرف › ط  ",
"  جماد بحرف › ن  ",
"  مدينة بحرف › ف  ",
"  حيوان بحرف › ض  ",
"  اسم بحرف › ك  ",
"  نبات و حيوان و مدينة بحرف › س  ", 
"  اسم بنت بحرف › ج  ", 
"  مدينة بحرف › ت  ", 
"  جماد بحرف › ه  ", 
"  اسم بنت بحرف › ر  ", 
" اسم ولد بحرف › خ  ", 
" جماد بحرف › ع  ",
" حيوان بحرف › ح  ",
" نبات بحرف › ف  ",
" اسم بنت بحرف › غ  ",
" اسم ولد بحرف › و  ",
" نبات بحرف › ل  ",
"مدينة بحرف › ع  ",
"دولة واسم بحرف › ب  ",
} 
selva = vBandav_Msg[math.random(#vBandav_Msg)]
return send(msg_chat_id,msg_id,"* "..selva.." * ",'md')
end
end
if text == "صراحه" or text == "جراه" then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
local timos = {
        "هل تعرضت لغدر في حياتك؟",
        "هل تعرف عيوبك؟",
        "هل أنت مُسامح أم لا تستطيع أن تُسامح؟",
        "إذا قمت بالسفر إلى نُزهة خارج بلدك فمن هو الشخص الذي تُحب أن يُرافقك؟",
        "هل تتدخل إذا وجدت شخص يتعرض لحادثة سير أم تتركه وترحل؟",
        "ما هو الشخص الذي لا تستطيع أن ترفض له أي طلب؟",
        "إذا أعجبت بشخصٍ ما، كيف تُظهر له هذا الإعجاب أو ما هي الطريقة التي ستتبعها لتظهر إعجابك به؟",
        "هل ترى نفسك مُتناقضًا؟",
        "ما هو الموقف الذي تعرضت فيه إلى الإحراج المُبرح؟",
        "ما هو الموقف الذي جعلك تبكي أمام مجموعة من الناس رغمًا عنك؟",
        "إذا جاء شريك حياتك وطلب الانفصال، فماذا يكون ردك وقتها؟",
        "إذا كان والدك يعمل بعملٍ فقير، هل تقبل به أو تستعر منه؟",
        "ما الذي يجعلك تُصاب بالغضب الشديد؟",
        "إذا وجدت الشخص الذي أحببتهُ في يومٍ ما يمسك بطفله، هل هذا سيشعرك بالألم؟",
        "كيف هي علاقتك مع أهلك؟",
        "اذكر ثلاثة أشياء تحبها."
}
local timo = timos[math.random(#timos)]
Redis:set(Fast.."Truth_Mode:"..msg.chat_id, "active") 
return send(msg.chat_id, msg.id, "*"..timo.."*", 'md')
end
end
if Redis:get(Fast.."Truth_Mode:"..msg.chat_id) == "active" then
local selva = {"يعم خف كدب شويا 😂❤️","مش مصدقك والله 🤨","واضح انك بتهزر 🌚❤️","قول الصراحه بقا 🙄","انا ڪـ بوت شاهد 😉❤️","ايوا حصل انت صادق 🥹❤️","خف كدب يبت الكدابه 😢🖤",}
local response = selva[math.random(#selva)]
send(msg.chat_id, msg.id,"*"..response.." * ",'md')
Redis:del(Fast.."Truth_Mode:"..msg.chat_id) 
end
if text == "اعلام" or tect == "الاعلام" then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
AlamSpeed = {"انجلترا","البرازيل","مصر","كندا","فرنسا","اسبانيا","الارجنتين","اليمن","تونس","العراق","فلسطين","امريكا","Barlo","روسيا","البحرين","قطر","الاردن","الصين","ليبيا","السعوديه","الجزائر","لبنان","كوريا","ايطاليا","تركيا","البرتغال","المكسيك","سويسرا","نيجيريا","كرواتيا","السودان","الكاميرون","النيجر","المغرب"};
name = AlamSpeed[math.random(#AlamSpeed)]
Redis:set(Fast.."Game:Alam"..msg.chat_id,name)
name = string.gsub(name,"انجلترا","🇦🇺")
name = string.gsub(name,"البرازيل","🇧🇷")
name = string.gsub(name,"مصر","🇪🇬")
name = string.gsub(name,"كندا","🇨🇦")
name = string.gsub(name,"فرنسا","🏴‍☠️")
name = string.gsub(name,"اسبانيا","🇪🇦")
name = string.gsub(name,"الارجنتين","🇦🇷")
name = string.gsub(name,"اليمن","🇾🇪")
name = string.gsub(name,"تونس","🇹🇳")
name = string.gsub(name,"العراق","🇮🇶")
name = string.gsub(name,"فلسطين","🇵🇸")
name = string.gsub(name,"امريكا","🇺🇸")
name = string.gsub(name,"سوريا","🇸🇾")
name = string.gsub(name,"روسيا","🇷🇺")
name = string.gsub(name,"البحرين","🇧🇭")
name = string.gsub(name,"قطر","🇶🇦")
name = string.gsub(name,"الاردن","🇯🇴")
name = string.gsub(name,"الصين","🇨🇳")
name = string.gsub(name,"ليبيا","🇱🇾")
name = string.gsub(name,"السعوديه","🇸🇦")
name = string.gsub(name,"الجزائر","🇩🇿")
name = string.gsub(name,"لبنان","🇱🇧")
name = string.gsub(name,"كوريا","🇰🇷")
name = string.gsub(name,"ايطاليا","🇮🇹")
name = string.gsub(name,"تركيا","🇹🇷")
name = string.gsub(name,"البرتغال","🇵🇹")
name = string.gsub(name,"المكسيك","🇲🇽")
name = string.gsub(name,"سويسرا","🇨🇭")
name = string.gsub(name,"كرواتيا","🇭🇷")
name = string.gsub(name,"السودان","🇸🇩")
name = string.gsub(name,"الكاميرون","🇨🇲")
name = string.gsub(name,"النيجر","🇳🇪")
name = string.gsub(name,"المغرب","🇲🇦")
return bot.sendText(msg_chat_id,msg_id,"* • اسرع واحد يكتب اسم العلم ~ ⟦ "..name.." ⟧*","md",true)  
end
end
if text == "مريم" or text == "لعبة مريم" or text == "لعبه مريم" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n • عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n • عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return send(msg.chat_id,msg.id,"* • الالعاب معطلة من قبل المشرفين *","md",true)
end
local t = "*🥀 اطفي النور واستمتع بلعب *"
local m = "https://t.me/UOUSOU/46"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• حسنا •', callback_data=senderr.."/may"},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&photo="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown&reply_markup="..JSON.encode(keyboard))
end
if text == "ذكاء" or text == "اختبار الذكاء" or text == "اختبار" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n • عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n • عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Jabwa = bot.getUser(senderr)
local news = Jabwa.first_name
local t = "*هل انت جاهز للعب ياصديقي •*"
local m = "https://t.me/UOUSOU/45"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• نعم •', callback_data=senderr.."/Start"},
},
{
{text =news, url = "https://t.me/"..Jabwa.username..""},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&photo="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown&reply_markup="..JSON.encode(keyboard))
end
------
-- xo game by S0BM
function xogames(ChatId,UserId,user2,MsgId,t1,t2,t3,t4,t5,t6,t7,t8,t9,pleyerT)
local player1 = bot.getUser(UserId)
if player1.first_name then
player1N = player1.first_name
else
player1N = " لا يوجد اسم"
end
local player2 = bot.getUser(user2)
if player2.first_name then
player2N = player2.first_name
else
player2N = " لا يوجد اسم"
end
local player1Mark = Redis:get(Fast.."xopleyers"..UserId..":"..ChatId)
local player2Mark = Redis:get(Fast.."xopleyers"..user2..":"..ChatId)
local ttsaa = (Redis:get(Fast.."xonumt"..ChatId..(UserId+user2)) or 0)
local winnerMessage
if tonumber(ttsaa) >= tonumber(3) then 
if tonumber(ttsaa) >= tonumber(8) then 
winnerMessage = "*• اللاعب الاول ⋮ ⦉ "..player1N.." ⦊\n• اللاعب الثاني ⋮ ⦉ "..player2N.." ⦊\n• الـنـتـيـجـه تـعـادل *"
end
if (Redis:get(Fast.."xoswin1"..UserId..":"..ChatId) == "true" and Redis:get(Fast.."xoswin2"..UserId..":"..ChatId) == "true" and Redis:get(Fast.."xoswin3"..UserId..":"..ChatId) == "true") or
   (Redis:get(Fast.."xoswin4"..UserId..":"..ChatId) == "true" and Redis:get(Fast.."xoswin5"..UserId..":"..ChatId) == "true" and Redis:get(Fast.."xoswin6"..UserId..":"..ChatId) == "true") or
   (Redis:get(Fast.."xoswin7"..UserId..":"..ChatId) == "true" and Redis:get(Fast.."xoswin8"..UserId..":"..ChatId) and Redis:get(Fast.."xoswin9"..UserId..":"..ChatId) == "true") or
   (Redis:get(Fast.."xoswin1"..UserId..":"..ChatId) == "true" and Redis:get(Fast.."xoswin4"..UserId..":"..ChatId) == "true" and Redis:get(Fast.."xoswin7"..UserId..":"..ChatId) == "true") or
   (Redis:get(Fast.."xoswin2"..UserId..":"..ChatId) == "true" and Redis:get(Fast.."xoswin5"..UserId..":"..ChatId) == "true" and Redis:get(Fast.."xoswin8"..UserId..":"..ChatId)) or
   (Redis:get(Fast.."xoswin3"..UserId..":"..ChatId) == "true" and Redis:get(Fast.."xoswin6"..UserId..":"..ChatId) == "true" and Redis:get(Fast.."xoswin9"..UserId..":"..ChatId) == "true") or
   (Redis:get(Fast.."xoswin1"..UserId..":"..ChatId) == "true" and Redis:get(Fast.."xoswin5"..UserId..":"..ChatId) == "true" and Redis:get(Fast.."xoswin9"..UserId..":"..ChatId) == "true") or
   (Redis:get(Fast.."xoswin3"..UserId..":"..ChatId) == "true" and Redis:get(Fast.."xoswin5"..UserId..":"..ChatId) == "true" and Redis:get(Fast.."xoswin7"..UserId..":"..ChatId) == "true") then
  winnerMessage = "*• اللاعب الفائز ⋮ ⦉ "..player1N.." ⦊ 🏅*"
end
if (Redis:get(Fast.."xoswin1"..user2..":"..ChatId) == "true" and Redis:get(Fast.."xoswin2"..user2..":"..ChatId) == "true" and Redis:get(Fast.."xoswin3"..user2..":"..ChatId) == "true") or
   (Redis:get(Fast.."xoswin4"..user2..":"..ChatId) == "true" and Redis:get(Fast.."xoswin5"..user2..":"..ChatId) == "true" and Redis:get(Fast.."xoswin6"..user2..":"..ChatId) == "true") or
   (Redis:get(Fast.."xoswin7"..user2..":"..ChatId) == "true" and Redis:get(Fast.."xoswin8"..user2..":"..ChatId) and Redis:get(Fast.."xoswin9"..user2..":"..ChatId) == "true") or
   (Redis:get(Fast.."xoswin1"..user2..":"..ChatId) == "true" and Redis:get(Fast.."xoswin4"..user2..":"..ChatId) == "true" and Redis:get(Fast.."xoswin7"..user2..":"..ChatId) == "true") or
   (Redis:get(Fast.."xoswin2"..user2..":"..ChatId) == "true" and Redis:get(Fast.."xoswin5"..user2..":"..ChatId) == "true" and Redis:get(Fast.."xoswin8"..user2..":"..ChatId)) or
   (Redis:get(Fast.."xoswin3"..user2..":"..ChatId) == "true" and Redis:get(Fast.."xoswin6"..user2..":"..ChatId) == "true" and Redis:get(Fast.."xoswin9"..user2..":"..ChatId) == "true") or
   (Redis:get(Fast.."xoswin1"..user2..":"..ChatId) == "true" and Redis:get(Fast.."xoswin5"..user2..":"..ChatId) == "true" and Redis:get(Fast.."xoswin9"..user2..":"..ChatId) == "true") or
   (Redis:get(Fast.."xoswin3"..user2..":"..ChatId) == "true" and Redis:get(Fast.."xoswin5"..user2..":"..ChatId) == "true" and Redis:get(Fast.."xoswin7"..user2..":"..ChatId) == "true") then
 winnerMessage = "*• اللاعب الفائز ⋮ ⦉ "..player1N.." ⦊ 🏅*"
end
end
obtal1 = Redis:get(Fast.."xosgear1"..(UserId+user2)..":"..ChatId) or "🌫"
obtal2 = Redis:get(Fast.."xosgear2"..(UserId+user2)..":"..ChatId) or "🌫"
obtal3 = Redis:get(Fast.."xosgear3"..(UserId+user2)..":"..ChatId) or "🌫"
obtal4 = Redis:get(Fast.."xosgear4"..(UserId+user2)..":"..ChatId) or "🌫"
obtal5 = Redis:get(Fast.."xosgear5"..(UserId+user2)..":"..ChatId) or "🌫"
obtal6 = Redis:get(Fast.."xosgear6"..(UserId+user2)..":"..ChatId) or "🌫"
obtal7 = Redis:get(Fast.."xosgear7"..(UserId+user2)..":"..ChatId) or "🌫"
obtal8 = Redis:get(Fast.."xosgear8"..(UserId+user2)..":"..ChatId) or "🌫"
obtal9 = Redis:get(Fast.."xosgear9"..(UserId+user2)..":"..ChatId) or "🌫" 
if winnerMessage then
local winerchkd = " • اللاعب الاول  : "..player1N.." ("..player1Mark..") \n• اللاعب الثاني :   "..player2N.." ("..player2Mark..")\n"..winnerMessage.." "
Redis:del(Fast.."xopleyers"..user2..":"..ChatId)
Redis:del(Fast.."xotern"..user2..":"..ChatId)
Redis:del(Fast.."xotern"..UserId..":"..ChatId)
Redis:del(Fast.."xopleyers"..UserId..":"..ChatId)
Redis:del(Fast.."xonumt"..ChatId..(UserId+user2))
Redis:del(Fast.."xosgear1"..(UserId+user2)..":"..ChatId)
Redis:del(Fast.."xosgear2"..(UserId+user2)..":"..ChatId)
Redis:del(Fast.."xosgear3"..(UserId+user2)..":"..ChatId)
Redis:del(Fast.."xosgear4"..(UserId+user2)..":"..ChatId)
Redis:del(Fast.."xosgear5"..(UserId+user2)..":"..ChatId)
Redis:del(Fast.."xosgear6"..(UserId+user2)..":"..ChatId)
Redis:del(Fast.."xosgear7"..(UserId+user2)..":"..ChatId)
Redis:del(Fast.."xosgear8"..(UserId+user2)..":"..ChatId)
Redis:del(Fast.."xosgear9"..(UserId+user2)..":"..ChatId)
Redis:del(Fast.."xoswin1"..UserId..":"..ChatId)
Redis:del(Fast.."xoswin2"..UserId..":"..ChatId)
Redis:del(Fast.."xoswin3"..UserId..":"..ChatId)
Redis:del(Fast.."xoswin4"..UserId..":"..ChatId)
Redis:del(Fast.."xoswin5"..UserId..":"..ChatId)
Redis:del(Fast.."xoswin6"..UserId..":"..ChatId)
Redis:del(Fast.."xoswin7"..UserId..":"..ChatId)
Redis:del(Fast.."xoswin8"..UserId..":"..ChatId)
Redis:del(Fast.."xoswin9"..UserId..":"..ChatId)
Redis:del(Fast.."xoswin1"..user2..":"..ChatId)
Redis:del(Fast.."xoswin2"..user2..":"..ChatId)
Redis:del(Fast.."xoswin3"..user2..":"..ChatId)
Redis:del(Fast.."xoswin4"..user2..":"..ChatId)
Redis:del(Fast.."xoswin5"..user2..":"..ChatId)
Redis:del(Fast.."xoswin6"..user2..":"..ChatId)
Redis:del(Fast.."xoswin7"..user2 ..":"..ChatId)
Redis:del(Fast.."xoswin8"..user2 ..":"..ChatId)
Redis:del(Fast.."xoswin9"..user2 ..":"..ChatId)
end
play_time = "  "
if pleyerT then
obtalT = play_time.."\n"..pleyerT.." "
else
obtalT = play_time.."*\n• الان دور اللاعب ⋮ ⦉ "..player1N.." ⦊* "
end
local reply_markupp = bot.replyMarkup{
type = 'inline',
data = {
{
{text = (t1 or obtal1), data = UserId..'/xo1//'..user2}, {text = (t2 or obtal2), data = UserId..'/xo2//'..user2}, {text = (t3 or obtal3), data = UserId..'/xo3//'..user2},
},
{
{text = (t4 or obtal4), data = UserId..'/xo4//'..user2}, {text = (t5 or obtal5), data = UserId..'/xo5//'..user2}, {text = (t6 or obtal6), data = UserId..'/xo6//'..user2}, 
},
{
{text = (t7 or obtal7), data = UserId..'/xo7//'..user2}, {text = (t8 or obtal8), data = UserId..'/xo8//'..user2}, {text = (t9 or obtal9), data = UserId..'/xo9//'..user2},
},
}
}
edit(ChatId,MsgId," "..(winnerMessage or obtalT).." ", 'md', false, false, reply_markupp)
end
if text:match("(.*)(xo)(.*)") or text:match("(.*)(XO)(.*)") or text:match("(.*)(اكس او)(.*)") then
local user_info = bot.getUser(msg.sender_id.user_id)
local name = user_info.first_name or "مستخدم مجهول"
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '🎮 بــدء اللعبة', data = msg.sender_id.user_id..'/xogamesta//'},}}}
return send(msg_chat_id, msg_id,"*🙋 أهلا بك في لعبة إكس أو!\n\n🎮 اضغط على زر **بدء اللعبة** للعب ضد شخص آخر.\n👤 اللاعب الحالي* ⋮ ⦉ ["..name.."](tg://user?id="..user_info.id..") ⦊", 'md', false, false, false, false, reply_markup)
end
--------------
if text == "المختلف" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
mktlf = {"??","☠","🐼","🐇","🌑","🌚","⭐️","✨","⛈","🌥","⛄️","👨‍🔬","👨‍💻","??‍🔧","??‍♀","??‍♂","🧝‍♂","🙍‍♂","🧖‍♂","👬","🕒","🕤","⌛️","📅",};
name = mktlf[math.random(#mktlf)]
Redis:set(Fast.."Game:Difference"..msg.chat_id,name)
name = string.gsub(name,"😸","😹??????😹😹😹😹😸😹😹😹😹")
name = string.gsub(name,"☠","💀💀💀💀💀💀💀☠??💀💀💀💀")
name = string.gsub(name,"🐼","👻👻👻🐼👻👻??👻👻👻👻")
name = string.gsub(name,"🐇","🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊")
name = string.gsub(name,"🌑","🌚🌚🌚🌚🌚🌑🌚🌚🌚")
name = string.gsub(name,"🌚","🌑🌑🌑🌑🌑??🌑🌑🌑")
name = string.gsub(name,"⭐️","🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟")
name = string.gsub(name,"✨","💫💫💫💫💫✨💫💫💫💫")
name = string.gsub(name,"⛈","🌨🌨🌨??🌨⛈🌨🌨🌨🌨")
name = string.gsub(name,"🌥","⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️")
name = string.gsub(name,"⛄️","☃☃☃☃☃☃⛄️☃☃☃☃")
name = string.gsub(name,"👨‍🔬","👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬")
name = string.gsub(name,"👨‍💻","👩‍💻👩‍??👩‍‍💻👩‍‍??👩‍‍💻👨‍💻??‍💻👩‍💻👩‍💻")
name = string.gsub(name,"👨‍🔧","👩‍🔧👩‍🔧??‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧")
name = string.gsub(name,"👩‍??","👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳??‍🍳")
name = string.gsub(name,"🧚‍♀","🧚‍♂🧚‍♂🧚‍♂??‍♂🧚‍♀🧚‍♂🧚‍♂")
name = string.gsub(name,"🧜‍♂","🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧚‍♂🧜‍♀🧜‍♀🧜‍♀")
name = string.gsub(name,"🧝‍♂","🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀")
name = string.gsub(name,"🙍‍♂️","🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️")
name = string.gsub(name,"🧖‍♂️","🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️??‍♀️")
name = string.gsub(name,"👬","👭👭👭👭👭👬👭👭👭")
name = string.gsub(name,"👨‍👨‍👧","👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦")
name = string.gsub(name,"🕒","🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒")
name = string.gsub(name,"🕤","🕥🕥🕥🕥🕥🕤🕥🕥🕥")
name = string.gsub(name,"⌛️","⏳⏳⏳⏳⏳⏳⌛️⏳⏳")
name = string.gsub(name,"📅","📆📆📆📆📆📆??????")
return send(msg.chat_id,msg.id,"• اسرع واحد يدز الاختلاف ~ {"..name.."}","md",true)  
end
end
if text == "امثله" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
mthal = {"جوز","ضراطه","الحبل","الحافي","شقره","بيدك","سلايه","النخله","الخيل","حداد","المبلل","يركص","قرد","العنب","العمه","الخبز","بالحصاد","شهر","شكه","يكحله",};
name = mthal[math.random(#mthal)]
Redis:set(Fast.."Game:Example"..msg.chat_id,name)
name = string.gsub(name,"جوز","ينطي____للماعده سنون")
name = string.gsub(name,"ضراطه","الي يسوق المطي يتحمل___")
name = string.gsub(name,"بيدك","اكل___محد يفيدك")
name = string.gsub(name,"الحافي","تجدي من___نعال")
name = string.gsub(name,"شقره","مع الخيل يا___")
name = string.gsub(name,"النخله","الطول طول___والعقل عقل الصخلة")
name = string.gsub(name,"سلايه","بالوجه امراية وبالظهر___")
name = string.gsub(name,"الخيل","من قلة___شدو على الچلاب سروج")
name = string.gsub(name,"حداد","موكل من صخم وجهه كال آني___")
name = string.gsub(name,"المبلل","___ما يخاف من المطر")
name = string.gsub(name,"الحبل","اللي تلدغة الحية يخاف من جرة___")
name = string.gsub(name,"يركص","المايعرف___يقول الكاع عوجه")
name = string.gsub(name,"العنب","المايلوح___يقول حامض")
name = string.gsub(name,"العمه","___إذا حبت الچنة ابليس يدخل الجنة")
name = string.gsub(name,"الخبز","انطي___للخباز حتى لو ياكل نصه")
name = string.gsub(name,"باحصاد","اسمة___ومنجله مكسور")
name = string.gsub(name,"شهر","امشي__ولا تعبر نهر")
name = string.gsub(name,"شكه","يامن تعب يامن__يا من على الحاضر لكة")
name = string.gsub(name,"القرد","__بعين امه غزال")
name = string.gsub(name,"يكحله","اجه___عماها")
return send(msg.chat_id,msg.id,"• اسرع واحد يكمل المثل ~ {"..name.."}","md",true)  
end
end
----------------------------------------------------------------
if text == "ديني" or text == "الدين" or text == "نصيحه دينيه" then
local ayat_and_hadiths = {
{text = "﴿إِنَّ مَعَ الْعُسْرِ يُسْرًا﴾ [الشرح: 6]", explanation = "الآية تذكرنا بأن بعد كل صعوبة هناك راحة وسهولة."},
{text = "﴿وَقُل رَّبُّ زِدْنِي عِلْمًا﴾ [طه: 114]", explanation = "تُعلمنا هذه الآية أهمية طلب العلم وتوسيع مداركنا."},
{text = "﴿إِنَّ اللَّهَ مَعَ الصَّابِرِينَ﴾ [البقرة: 153]", explanation = "الآية تدعونا للصبر في الأوقات الصعبة وتذكرنا بأن الله مع الصابرين."},
{text = "﴿وَمَا أَرْسَلْنَاكَ إِلَّا رَحْمَةً لِّلْعَـٰلَمِينَ﴾ [الأنبياء: 107]", explanation = "الآية تدل على رحمة النبي محمد صلى الله عليه وسلم، الذي أرسله الله رحمة للعالمين."},
{text = "﴿وَإِذَا سَأَلَكَ عِبَادِي عَنِّي فَإِنِّي قَرِيبٌۢ أُجِيبُ دَعْوَةَ الدَّاعِ إِذَا دَعَانِ﴾ [البقرة: 186]", explanation = "الآية تؤكد قرب الله عز وجل من عباده واهتمامه بدعائهم."},
{text = "﴿إِنَّ اللَّهَ لا يُحِبُّ كُلَّ مُخْتَالٍ فَخُورٍ﴾ [الحديد: 23]", explanation = "الآية تدعونا للتواضع وترك التفاخر."},
{text = "﴿إِنَّ اللَّهَ يَغْفِرُ الذُّنُوبَ جَمِيعًا إِنَّهُۥ هُوَ ٱلْغَفُورُ الرَّحِيمُ﴾ [الزمر: 53]", explanation = "الآية تذكرنا بمغفرة الله وأنه لا يغفر الذنوب إلا هو."},
{text = "﴿يُحْيِي وَيُمِيتُ وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ﴾ [آل عمران: 156]", explanation = "الآية تؤكد قدرة الله في إحياء الموتى وإماتتهم."},
{text = "﴿وَقَالَ رَبُّكُمْ ٱدْعُونِىٓ أَسْتَجِبْ لَكُمْ ۚ إِنَّ ٱلَّذِينَ يَسْتَكْبِرُونَ عَنْ عِبَادَتِىٓ سَيَدْخُلُونَ جَهَنَّمَ دَاخِرِينَ﴾ [غافر: 60]", explanation = "الآية تدعونا لدعاء الله وتطلب منه الاستجابة."},
{text = "قال رسول الله صلى الله عليه وسلم: (من لا يشكر الناس لا يشكر الله)", explanation = "حديث شريف يحثنا على شكر الآخرين على مساعدتهم."},
{text = "قال رسول الله صلى الله عليه وسلم: (الدين النصيحة).", explanation = "حديث نبوي يؤكد على أهمية النصح في ديننا."},
{text = "قال رسول الله صلى الله عليه وسلم: (إنما الأعمال بالنيات، وإنما لكل امرئ ما نوى).", explanation = "حديث نبوي يذكرنا بأهمية النية في جميع أعمالنا."},
{text = "قال رسول الله صلى الله عليه وسلم: (أحب الناس إلى الله أنفعهم للناس).", explanation = "حديث نبوي يحثنا على إفادة الآخرين ومساعدتهم."},
{text = "قال رسول الله صلى الله عليه وسلم: (من لا يُؤثِر لا يُؤثَر).", explanation = "حديث نبوي يؤكد أهمية العطاء وإيثار الآخرين."},
{text = "قال رسول الله صلى الله عليه وسلم: (من غشنا فليس منا).", explanation = "حديث نبوي يحذرنا من الخداع والغش."},
{text = "قال رسول الله صلى الله عليه وسلم: (خيركم خيركم لأهله).", explanation = "حديث نبوي يوضح أهمية معاملة الأهل بالخير."},
{text = "قال رسول الله صلى الله عليه وسلم: (أطعموا الطعام، وأفشوا السلام، وصلوا الأرحام، وصلوا بالليل والناس نيام، تدخلوا الجنة بسلام).", explanation = "حديث نبوي يحثنا على فعل الأعمال الصالحة."},
{text = "قال رسول الله صلى الله عليه وسلم: (من صام رمضان إيمانًا واحتسابًا غفر له ما تقدم من ذنبه).", explanation = "حديث نبوي يحثنا على صيام رمضان وتذكر ثوابه العظيم."},
{text = "قال رسول الله صلى الله عليه وسلم: (إياكم والظن فإن الظن أكذب الحديث).", explanation = "حديث نبوي يحذرنا من الظن السيء."},
{text = "قال رسول الله صلى الله عليه وسلم: (اتق الله حيثما كنت).", explanation = "حديث نبوي يحثنا على تقوى الله في كل مكان وزمان."},
{text = "قال رسول الله صلى الله عليه وسلم: (من لا يستغفر للمؤمنين والمؤمنات لا تُقبل دعوته).", explanation = "حديث نبوي يبين أهمية الدعاء للمؤمنين."},
{text = "قال رسول الله صلى الله عليه وسلم: (أفشوا السلام على من عرفت ومن لم تعرف).", explanation = "حديث نبوي يوصينا بالسلام بين الناس."},
{text = "قال رسول الله صلى الله عليه وسلم: (من لا يُؤثِر لا يُؤثَر).", explanation = "حديث نبوي يوضح أهمية الإيثار."},
{text = "قال رسول الله صلى الله عليه وسلم: (الدال على الخير كفاعله).", explanation = "حديث نبوي يشجعنا على الإرشاد إلى الخير."},
{text = "قال رسول الله صلى الله عليه وسلم: (من يُحسن إلى الناس يُحسن الله إليه).", explanation = "حديث نبوي يحثنا على الإحسان إلى الآخرين."},
{text = "قال رسول الله صلى الله عليه وسلم: (الذين يحبونني هم المؤمنون).", explanation = "حديث نبوي يتحدث عن حب المؤمنين للنبي صلى الله عليه وسلم."},
{text = "قال رسول الله صلى الله عليه وسلم: (النساء شقائق الرجال).", explanation = "حديث نبوي يبين دور النساء في المجتمع."},
{text = "﴿إِنَّ مَعَ الْعُسْرِ يُسْرًا﴾ [الشرح: 6]", explanation = "تُعلمنا هذه الآية أنه مهما كانت الصعوبات، فإن الله سيجعل لنا مخرجًا."},
{text = "﴿وَقَالَ رَبُّكُمْ ٱدْعُونِىٓ أَسْتَجِبْ لَكُمْ ۚ إِنَّ ٱلَّذِينَ يَسْتَكْبِرُونَ عَنْ عِبَادَتِىٓ سَيَدْخُلُونَ جَهَنَّمَ دَاخِرِينَ﴾ [غافر: 60]", explanation = "الآية تدعونا لدعاء الله وتطلب منه الاستجابة."},
{text = "﴿إِنَّ اللَّهَ يَغْفِرُ الذُّنُوبَ جَمِيعًا إِنَّهُۥ هُوَ ٱلْغَفُورُ الرَّحِيمُ﴾ [الزمر: 53]", explanation = "الآية تذكرنا بمغفرة الله وأنه لا يغفر الذنوب إلا هو."},
{text = "﴿إِنَّ اللَّهَ مَعَ الصَّابِرِينَ﴾ [البقرة: 153]", explanation = "الآية تدعونا للصبر في الأوقات الصعبة وتذكرنا بأن الله مع الصابرين."},
{text = "﴿وَمَا أَرْسَلْنَاكَ إِلَّا رَحْمَةً لِّلْعَـٰلَمِينَ﴾ [الأنبياء: 107]", explanation = "الآية تدل على رحمة النبي محمد صلى الله عليه وسلم، الذي أرسله الله رحمة للعالمين."},
{text = "﴿فَإِنَّ مَعَ الْعُسْرِ يُسْرًا﴾ [الشرح: 6]", explanation = "تُعلمنا هذه الآية أنه مهما كانت الصعوبات، فإن الله سيجعل لنا مخرجًا."},
{text = "﴿وَإِذَا سَأَلَكَ عِبَادِي عَنِّي فَإِنِّي قَرِيبٌۢ أُجِيبُ دَعْوَةَ الدَّاعِ إِذَا دَعَانِ﴾ [البقرة: 186]", explanation = "الآية تؤكد قرب الله عز وجل من عباده واهتمامه بدعائهم."},
{text = "﴿يُحْيِي وَيُمِيتُ وَإِلَيْهِ تُرْجَعُونَ﴾ [الجمعة: 8]", explanation = "الآية تذكرنا بأن الله هو الذي يحيي ويميت، وإليه نعود."},
{text = "﴿فَإِنَّ مَعَ الْعُسْرِ يُسْرًا﴾ [الشرح: 6]", explanation = "الآية تدعونا للأمل بأن الفرج قادم بعد الشدائد."},
{text = "﴿وَمَا تَوْفِيقِي إِلَّا بِاللَّهِ﴾ [هود: 88]", explanation = "تُعلمنا هذه الآية أن التوفيق والنجاح من عند الله وحده."},
{text = "﴿إِنَّ اللَّهَ يُحِبُّ التَّوَابِينَ وَيُحِبُّ المُتَطَهِّرِينَ﴾ [البقرة: 222]", explanation = "الآية توضح أن الله يحب الذين يتوبون ويطهرون أنفسهم."},
{text = "﴿رَبُّ السَّمَاوَاتِ وَالْأَرْضِ وَمَا فِيهِنَّ﴾ [الزخرف: 84]", explanation = "الآية تذكر عظمة الله في ملكه الشامل لكل ما في السماوات والأرض."},
{text = "﴿إِنَّ رَحْمَتَ اللَّهِ قَرِيبٌ مِّنَ الْمُحْسِنِينَ﴾ [الأعراف: 56]", explanation = "الآية تشجعنا على الإحسان لأن رحمة الله قريبًا من المحسنين."}
}
local random_entry = ayat_and_hadiths[math.random(#ayat_and_hadiths)]
send(msg.chat_id, msg.id, "*• نصيحة دينية ⋮\n" .. random_entry.text .. "*\n\n*" .. random_entry.explanation .. "*", "md", true)
end
----------------------------------------------------------------
local islamic_timos = {
{timo = "ما هي السوره التي تعادل ثلث القران؟", selva = "الاخلاص"},
{timo = "من هو اول الخلفاء الراشدين؟", selva = "ابو بكر"},
{timo = "كم عدد اركان الاسلام؟", selva = "خمسهه"},
{timo = "ما هو الركن الثاني من اركان الاسلام؟", selva = "الصلاه"},
{timo = "ما هي اطول سوره في القران الكريم؟", selva = "البقره"},
{timo = "من هو النبي الذي ابتلعه الحوت؟", selva = "يونس"},
{timo = "ما هو اول مسجد بني في الاسلام؟", selva = "قباء"},
{timo = "كم عدد اجزاء القران الكريم؟", selva = "ثلاثون"},
{timo = "من هو اخر الانبياء؟", selva = "محمد"},
{timo = "كم عدد الصلوات المفروضه في اليوم؟", selva = "خمسه"},
{timo = "ما هي اول ايه نزلت من القران الكريم؟", selva = "اقرا"},
{timo = "ما هو اول جبل وضع على الارض؟", selva = "ابو قبيس"},
{timo = "من هو النبي الذي رفعه الله الى السماء؟", selva = "عيسى"},
{timo = "ما هي السوره التي سميت باسم فاكهه؟", selva = "التين"},
{timo = "من هو النبي الذي كلمه الله مباشره؟", selva = "موسى"},
{timo = "كم عدد سور القران الكريم؟", selva = "114"},
{timo = "ما هي السوره التي لا تبدا بالبسمله؟", selva = "التوبه"},
{timo = "ما هو اسم ام النبي محمد؟", selva = "امنه"},
{timo = "من هو اول نبي كتب بالقلم؟", selva = "ادريس"},
{timo = "من هو الصحابي الذي جمع القران؟", selva = "زيد بن ثابت"},
{timo = "ما هي اقصر سوره في القران؟", selva = "الكوثر"},
{timo = "ما هي اطول ايه في القران؟", selva = "ايه الدين"},
{timo = "ما هو الاعجاز العلمي في سوره الحديد؟", selva = "ذكر عنصر الحديد"},
{timo = "من هو النبي الذي صنع سفينه؟", selva = "نوح"},
{timo = "كم عدد السجدات في القران؟", selva = "15"},
{timo = "من هو اول شهيد في الاسلام؟", selva = "سميه بنت خياط"},
{timo = "ما هي دار الكرامه؟", selva = "الجنه"},
{timo = "من هو الصحابي الذي نام في فراش النبي؟", selva = "علي بن ابي طالب"},
{timo = "من هو اول مؤذن في الاسلام؟", selva = "بلال بن رباح"},
{timo = "من هو الصحابي الملقب بسيف الله المسلول؟", selva = "خالد بن الوليد"},
{timo = "ما هو الدعاء الذي يقال عند دخول المسجد؟", selva = "اللهم افتح لي ابواب رحمتك"},
{timo = "كم عدد اسماء الله الحسنى؟", selva = "99"},
{timo = "من هو النبي الذي امره الله بذبح ابنه؟", selva = "ابراهيم"},
{timo = "ما هو الطائر الذي تكلم في القران؟", selva = "الهدهد"},
{timo = "من هي اول زوجات النبي؟", selva = "خديجه"},
{timo = "كم سنه استمرت الدعوه في مكه؟", selva = "13"},
{timo = "من هو الصحابي الذي لقب بالصديق؟", selva = "ابو بكر"},
{timo = "ما هي كنيه عمر بن الخطاب؟", selva = "ابو حفص"},
{timo = "من هو النبي الذي جاء بعد موسى؟", selva = "هارون"},
{timo = "ما هو اسم والد النبي محمد؟", selva = "عبدالله"},
{timo = "كم عدد ابواب الجنه؟", selva = "8"},
{timo = "كم عدد ابواب النار؟", selva = "7"},
{timo = "ما هو الاعجاز في سوره العلق؟", selva = "ذكر خلق الانسان من العلق"},
{timo = "من هو النبي الذي كان يتكلم وهو في المهد؟", selva = "عيسى"},
{timo = "من هي الصحابيه التي دافعت عن النبي في معركه احد؟", selva = "نسيبه بنت كعب"},
{timo = "ما هي الاشهر الحرم؟", selva = "ذو القعده، ذو الحجه، محرم، رجب"},
{timo = "ما هو اسم زوجه فرعون التي امنت؟", selva = "اسيه"},
{timo = "من هو الصحابي الذي ارسله النبي الى المدينه لتعليم القران؟", selva = "مصعب بن عمير"},
{timo = "ما هي السوره التي تحتوي على سجدتين؟", selva = "الحج"},
{timo = "كم عدد كلمات ايه الكرسي؟", selva = "50"},
{timo = "من هو الصحابي الذي حمل رايه المسلمين في بدر؟", selva = "مصعب بن عمير"},
{timo = "ما هي السوره التي تسمى عروس القران؟", selva = "الرحمن"},
{timo = "من هو النبي الذي ابتلاه الله بمرض شديد؟", selva = "ايوب"},
{timo = "كم عدد الملائكه الذين يسجلون اعمال البشر؟", selva = "ملكان"},
{timo = "ما هي المدينه التي هاجر اليها النبي؟", selva = "المدينه المنوره"},
{timo = "ما هو اول ما يحاسب عليه العبد يوم القيامه؟", selva = "الصلاه"},
{timo = "من هو الصحابي الذي حمى النبي يوم الهجره؟", selva = "ابو بكر"},
{timo = "من هو النبي الذي القاه قومه في النار؟", selva = "ابراهيم"},
{timo = "من هو النبي الذي صام اول مره؟", selva = "نوح"},
{timo = "ما هو اسم حوض النبي في الجنه؟", selva = "الكوثر"},
{timo = "من هو الصحابي الذي قرا القران بصوت جميل؟", selva = "عبدالله بن مسعود"},
{timo = "ما هي السوره التي تبدا بـ (الحمد لله)؟", selva = "الفاتحه"},
{timo = "من هو الصحابي الذي بشر بالجنه؟", selva = "عثمان بن عفان"},
{timo = "من هو النبي الذي علمه الله لغه الطير؟", selva = "سليمان"},
{timo = "ما هو اسم ملك الموت؟", selva = "عزرائيل"}
}
if not active_timos then
active_timos = {}
end
if text == "دين" or text == "اسئله دينيه" or text == "اسالني في الدين" or text == "مسلم" or text == "الاسلام" then
local random_index = math.random(#islamic_timos)
local selected_timo = islamic_timos[random_index]
active_timos[msg.sender_id.user_id] = selected_timo.selva
bot.sendText(msg_chat_id, msg_id, " *• سؤال ديني لك ⋮\n\n" .. selected_timo.timo .. "\n\n• ارسل اجابتك الان !*", 'md', true)
return
end
if active_timos[msg.sender_id.user_id] and text ~= "دين" or text == "اسئله دينيه" or text == "اسالني في الدين" or text == "مسلم" or text == "الاسلام" then
if text == active_timos[msg.sender_id.user_id] then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id,2)  
local xx = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id)
bot.sendText(msg.chat_id, msg.id, "*• احسنت اجابه صحيحه 🌿❤️.\n\n• لقد ربحت 2 نقطه 🎉\n\n• عدد نقاطك الان ⋮ ⦉ "..xx.." ⦊*", 'md', true)
else
bot.sendText(msg.chat_id, msg.id, "*• للاسف اجابه خاطئه !\n\n• الاجابه الصحيحه ⋮ ⦉ ".. active_timos[msg.sender_id.user_id] .." ⦊*", 'md', true)
end
active_timos[msg.sender_id.user_id] = nil
end 
----------------------------------------------------------------
local public_figures = {
{lido = "من هو اول رئيس لجمهوريه مصر العربيه؟", team = "محمد نجيب"},
{lido = "من هو الرئيس الحالي لمصر؟", team = "عبدالفتاح السيسي"},
{lido = "من هو اشهر مقدم برامج مصري في العصر الحديث؟", team = "عمرو اديب"},
{lido = "من هو اللاعب المصري الذي حصل على جائزه افضل لاعب في افريقيا عده مرات؟", team = "محمد صلاح"},
{lido = "من هو الممثل المصري الشهير الملقب بالامبراطور؟", team = "احمد زكي"},
{lido = "من هو الاعلامي المصري الذي اشتهر ببرنامج 'العاشره مساءً'؟", team = "وائل الابراشي"},
{lido = "من هو الفنان المصري الملقب بالكوميديان الاول؟", team = "عادل امام"},
{lido = "من هو صاحب نوبل المصري في الادب؟", team = "نجيب محفوظ"},
{lido = "من هو مؤسس شركه اوراسكوم؟", team = "انسي ساويرس"},
{lido = "من هو لاعب كره السله الامريكي الشهير الملقب بالملك؟", team = "ليبرون جيمس"},
{lido = "من هو رئيس الولايات المتحده الحالي؟", team = "جو بايدن"},
{lido = "من هو اعظم عالم فيزياء في التاريخ وصاحب نظريه النسبيه؟", team = "البرت اينشتاين"},
{lido = "من هو صاحب اشهر شركات السيارات الكهربائيه؟", team = "ايلون ماسك"},
{lido = "من هو الملياردير الامريكي مؤسس امازون؟", team = "جيف بيزوس"},
{lido = "من هو اعظم ملاكم في التاريخ؟", team = "محمد علي كلاي"},
{lido = "من هو نجم كره القدم البرتغالي الشهير؟", team = "كريستيانو رونالدو"},
{lido = "من هو المغني البريطاني الذي لقب بملك البوب؟", team = "مايكل جاكسون"},
{lido = "من هو الممثل الامريكي الشهير ببطوله افلام 'تايتانيك' و'انسبشن'؟", team = "ليوناردو دي كابريو"},
{lido = "من هو مؤسس شركه مايكروسوفت؟", team = "بيل جيتس"},
{lido = "من هو المهندس المصري الذي تولى وزاره النقل وكان مشهورًا بالاصلاحات؟", team = "كامل الوزير"},
{lido = "من هو الصحفي المصري الذي اسس جريده 'اليوم السابع'؟", team = "خالد صلاح"},
{lido = "من هو مؤسس بنك الطعام المصري؟", team = "معز مسعود"},
{lido = "من هو العالم المصري الذي له دور بارز في تطوير صواريخ ناسا؟", team = "فاروق الباز"},
{lido = "من هو مؤسس حزب الوفد؟", team = "سعد زغلول"},
{lido = "من هو شيخ الازهر الحالي؟", team = "احمد الطيب"},
{lido = "من هو الفنان المصري الذي اشتهر بدور اللمبي؟", team = "محمد سعد"},
{lido = "من هو الحارس المصري الذي تالق في كاس العالم 2018؟", team = "عصام الحضري"},
{lido = "من هو الاعلامي المصري صاحب برنامج '90 دقيقه'؟", team = "محمد الباز"}
}
if not active_lidos then
active_lidos = {}
end
if text == "شخصيات عامه" then
local random_index = math.random(#public_figures)
local selected_lido = public_figures[random_index]
active_lidos[msg.sender_id.user_id] = selected_lido.team
bot.sendText(msg.chat_id, msg.id, " *• سؤال لك عن الشخصيات العامه ⋮\n\n" .. selected_lido.lido .. "\n\n• ارسل اجابتك الان !*", 'md', true)
return
end
if active_lidos[msg.sender_id.user_id] then
if text == active_lidos[msg.sender_id.user_id] then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
local xx = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id)
bot.sendText(msg.chat_id, msg.id, "*• احسنت اجابه صحيحه 🌿❤️.\n\n• لقد ربحت نقطه 🎉\n\n• عدد نقاطك الان ⋮ ⦉ "..xx.." ⦊*", 'md', true)
else
bot.sendText(msg.chat_id, msg.id, "*• للاسف اجابه خاطئه !\n\n• الاجابه الصحيحه ⋮ ⦉ ".. active_lidos[msg.sender_id.user_id] .." ⦊*", 'md', true)
end
active_lidos[msg.sender_id.user_id] = nil
end
----------------------------------------------------------------
local players = {
{name = "الونش", image = "https://t.me/koraaaa_laed/2"},
{name = "زيزو", image = "https://t.me/koraaaa_laed/3"},
{name = "مودريتش", image = "https://t.me/koraaaa_laed/4"},
{name = "رونالدو", image = "https://t.me/koraaaa_laed/7"},
{name = "اليسون", image = "https://t.me/koraaaa_laed/5"},
{name = "ميسي", image = "https://t.me/koraaaa_laed/9"},
{name = "ليفاندوسكي", image = "https://t.me/koraaaa_laed/13"},
{name = "نيمار", image = "https://t.me/koraaaa_laed/12"},
{name = "ديبالا", image = "https://t.me/koraaaa_laed/11"},
{name = "بيكيه", image = "https://t.me/koraaaa_laed/8"},
{name = "تريشتغن", image = "https://t.me/koraaaa_laed/10"},
{name = "كرستيانو رونالدو", image = "https://t.me/koraaaa_laed/14"},
{name = "فانديك", image = "https://t.me/koraaaa_laed/15"},
{name = "محمد صلاح", image = "https://t.me/koraaaa_laed/17"},
{name = "امبابي", image = "https://t.me/koraaaa_laed/18"},
{name = "فينسيوس", image = "https://t.me/koraaaa_laed/19"},
{name = "رونالدينيو", image = "https://t.me/koraaaa_laed/16"},
{name = "بنتايج", image = "https://t.me/koraaaa_laed/29"},
{name = "مرموش", image = "https://t.me/koraaaa_laed/28"},
{name = "عبدالله السعيد", image = "https://t.me/koraaaa_laed/27"},
{name = "حسام عبدالمجيد", image = "https://t.me/koraaaa_laed/26"},
{name = "امام عاشور", image = "https://t.me/koraaaa_laed/25"},
{name = "رامي ربيعه", image = "https://t.me/koraaaa_laed/20"},
{name = "عمرو السوليه", image = "https://t.me/koraaaa_laed/23"},
{name = "افشه", image = "https://t.me/koraaaa_laed/21"},
{name = "مروان عطيه", image = "https://t.me/koraaaa_laed/24"},
{name = "طاهر محمد طاهر", image = "https://t.me/koraaaa_laed/22"},
{name = "جاريث بيل", image = "https://t.me/koraaaa_laed/30"},
{name = "عواد", image = "https://t.me/koraaaa_laed/38"},
{name = "ناصر ماهر", image = "https://t.me/koraaaa_laed/37"},
{name = "شيكابالا", image = "https://t.me/koraaaa_laed/32"},
{name = "عمر جابر", image = "https://t.me/koraaaa_laed/31"},
{name = "الجزيري", image = "https://t.me/koraaaa_laed/34"},
{name = "دونجا", image = "https://t.me/koraaaa_laed/36"},
{name = "حمزه المثلوثي", image = "https://t.me/koraaaa_laed/33"},
{name = "محمد شحاته", image = "https://t.me/koraaaa_laed/35"},
{name = "سيرجيو بوسكيتس", image = "https://t.me/koraaaa_laed/50"},
{name = "ابو تريكه", image = "https://t.me/koraaaa_laed/49"},
{name = "زيدان", image = "https://t.me/koraaaa_laed/48"},
{name = "مانويل نوير", image = "https://t.me/koraaaa_laed/47"},
{name = "هازارد", image = "https://t.me/koraaaa_laed/46"},
{name = "حسن شحاته", image = "https://t.me/koraaaa_laed/45"},
{name = "سواريز", image = "https://t.me/koraaaa_laed/44"},
{name = "محمد شريف", image = "https://t.me/koraaaa_laed/43"},
{name = "رادجا ناينجولان", image = "https://t.me/koraaaa_laed/42"},
{name = "بيلنغهام", image = "https://t.me/koraaaa_laed/41"},
}
if not active_players then
active_players = {}
end 
if text == "لاعبين" or text == "لاعيبه" or text == "لاعيبة" or text == "لاعبون" then
local random_index = math.random(#players)
local selected_player = players[random_index]
active_players[msg.sender_id.user_id] = selected_player
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'مـن هـذا الـلاعـب 🌿❤️.', data = senderr..'/fnaneen'}, },}}
bot.sendPhoto(msg_chat_id, msg_id, selected_player.image,"","md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
return
end
if active_players[msg.sender_id.user_id] then
local selected_player = active_players[msg.sender_id.user_id]
if text == selected_player.name then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id,1)
local xx = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id)
bot.sendText(msg.chat_id, msg.id, "*• احسنت اجابه صحيحه 🌿❤️.\n\n• لقد ربحت نقطه 🎉\n\n• عدد نقاطك الان ⋮ ⦉ "..xx.." ⦊*", 'md', true)
else
bot.sendText(msg_chat_id, msg_id, "*• للاسف اجابه خاطئه !*\n\n*• الإجابة الصحيحة ⋮ ⦉ ".. selected_player.name .." ⦊*", 'md', true)
end
active_players[msg.sender_id.user_id] = nil
end
----------------------------------------------------------------
local players = {
{name = "محمد رمضان", image = "https://t.me/koraaaa_laed/60"},
{name = "حماده هلال", image = "https://t.me/koraaaa_laed/59"},
{name = "احمد العوضي", image = "https://t.me/koraaaa_laed/58"},
{name = "رنا رئيس", image = "https://t.me/koraaaa_laed/57"},
{name = "علي ربيع", image = "https://t.me/koraaaa_laed/61"},
{name = "حمدي المرغني", image = "https://t.me/koraaaa_laed/62"},
{name = "غاده عادل", image = "https://t.me/koraaaa_laed/56"},
{name = "ياسمين عبدالعزيز", image = "https://t.me/koraaaa_laed/55"},
{name = "عبله كامل", image = "https://t.me/koraaaa_laed/54"},
{name = "دينا الشربيني", image = "https://t.me/koraaaa_laed/53"},
{name = "مصطفي خاطر", image = "https://t.me/koraaaa_laed/52"},
{name = "احمد السقا", image = "https://t.me/koraaaa_laed/63"},
{name = "احمد عز", image = "https://t.me/koraaaa_laed/64"},
{name = "عصام السقا", image = "https://t.me/koraaaa_laed/65"},
{name = "مي عمر", image = "https://t.me/koraaaa_laed/66"},
{name = "ياسمين صبري", image = "https://t.me/koraaaa_laed/67"},
{name = "مصطفي قمر", image = "https://t.me/koraaaa_laed/68"},
{name = "تامر حسني", image = "https://t.me/koraaaa_laed/69"},
{name = "منه شلبي", image = "https://t.me/koraaaa_laed/70"},
{name = "عمرو سعد", image = "https://t.me/koraaaa_laed/71"},
{name = "مصطفي شعبان", image = "https://t.me/koraaaa_laed/72"},
} 
if not active_players then
active_players = {}
end 
if text == "ممثلين" or text == "فنانين" or text == "مشاهير" or text == "الفنانين" then
local random_index = math.random(#players)
local selected_player = players[random_index]
active_players[msg.sender_id.user_id] = selected_player
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'مـن هـذا الفـنـان 🌿❤️.', data = senderr..'/fnaneen'}, },}}
bot.sendPhoto(msg_chat_id, msg_id, selected_player.image,"","md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
return
end
if active_players[msg.sender_id.user_id] then
local selected_player = active_players[msg.sender_id.user_id]
if text == selected_player.name then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id,1)
local xx = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id)
bot.sendText(msg.chat_id, msg.id, "*• احسنت اجابه صحيحه 🌿❤️.\n\n• لقد ربحت نقطه 🎉\n\n• عدد نقاطك الان ⋮ ⦉ "..xx.." ⦊*", 'md', true)
else
bot.sendText(msg_chat_id, msg_id, "*• للاسف اجابه خاطئه !*\n\n*• الإجابة الصحيحة ⋮ ⦉ ".. selected_player.name .." ⦊*", 'md', true)
end
active_players[msg.sender_id.user_id] = nil
end
----------------------------------------------------------------
local public_figures = {
{tito = "• اكتب رمز دولاب", timoselva = {"125","١٢٥"}},
{tito = "• اكتب رمز فرح", timoselva = {"222","٢٢٢"}},
{tito = "• اكتب رمز فن", timoselva = {"548","٥٤٨"}},
{tito = "• اكتب رمز رز", timoselva = {"432","٤٣٢"}},
{tito = "• اكتب رمز ابداع", timoselva = {"333","٣٣٣"}},
{tito = "• اكتب رمز عيد", timoselva = {"435","٤٣٥"}},
{tito = "• اكتب رمز نظارة", timoselva = {"153","١٥٣"}},
{tito = "• اكتب رمز شمس", timoselva = {"171","١٧١"}},
{tito = "• اكتب رمز سحاب", timoselva = {"874","٨٧٤"}},
{tito = "• اكتب رمز جوال", timoselva = {"134","١٣٤"}},
{tito = "• اكتب رمز شبشب", timoselva = {"999","٩٩٩"}},
{tito = "• اكتب رمز صباح", timoselva = {"237","٢٣٧"}},
{tito = "• اكتب رمز باب", timoselva = {"654","٦٥٤"}},
{tito = "• اكتب رمز صداقة", timoselva = {"493","٤٩٣"}},
{tito = "• اكتب رمز تفكير", timoselva = {"888","٨٨٨"}},
{tito = "• اكتب رمز مفتاح", timoselva = {"327","٣٢٧"}},
{tito = "• اكتب رمز طموح", timoselva = {"102","١٠٢"}},
{tito = "• اكتب رمز صندوق", timoselva = {"871","٨٧١"}},
{tito = "• اكتب رمز قمر", timoselva = {"542","٥٤٢"}},
{tito = "• اكتب رمز أمل", timoselva = {"679","٦٧٩"}},
{tito = "• اكتب رمز برتقالة", timoselva = {"436","٤٣٦"}},
{tito = "• اكتب رمز منديل", timoselva = {"431","٤٣١"}},
{tito = "• اكتب رمز راحة", timoselva = {"762","٧٦٢"}},
{tito = "• اكتب رمز مشبك", timoselva = {"329","٣٢٩"}},
{tito = "• اكتب رمز قارورة", timoselva = {"129","١٢٩"}},
{tito = "• اكتب رمز أخلاق", timoselva = {"101","١٠١"}},
{tito = "• اكتب رمز ملعقة", timoselva = {"319","٣١٩"}},
{tito = "• اكتب رمز لُمية", timoselva = {"459","٤٥٩"}},
{tito = "• اكتب رمز عين", timoselva = {"873","٨٧٣"}},
{tito = "• اكتب رمز لعبة", timoselva = {"324","٣٢٤"}},
{tito = "• اكتب رمز رحمة", timoselva = {"473","٤٧٣"}},
{tito = "• اكتب رمز روج", timoselva = {"555","٥٥٥"}},
{tito = "• اكتب رمز بلورة", timoselva = {"388","٣٨٨"}},
{tito = "• اكتب رمز إحسان", timoselva = {"777","٧٧٧"}},
{tito = "• اكتب رمز تواصل", timoselva = {"651","٦٥١"}},
{tito = "• اكتب رمز دفتر", timoselva = {"128","١٢٨"}},
{tito = "• اكتب رمز رجل", timoselva = {"658","٦٥٨"}},
{tito = "• اكتب رمز كواكب", timoselva = {"764","٧٦٤"}},
{tito = "• اكتب رمز شمعة", timoselva = {"336","٣٣٦"}},
{tito = "• اكتب رمز ألوان", timoselva = {"438","٤٣٨"}},
{tito = "• اكتب رمز كأس", timoselva = {"666","٦٦٦"}},
{tito = "• اكتب رمز مخدة", timoselva = {"659","٦٥٩"}},
{tito = "• اكتب رمز تفاؤل", timoselva = {"398","٣٩٨"}},
{tito = "• اكتب رمز ثلاثة", timoselva = {"534","٥٣٤"}},
{tito = "• اكتب رمز بيت", timoselva = {"444","٤٤٤"}},
{tito = "• اكتب رمز مرايه", timoselva = {"872","٨٧٢"}},
{tito = "• اكتب رمز خير", timoselva = {"325","٣٢٥"}},
{tito = "• اكتب رمز عباية", timoselva = {"123","١٢٣"}},
{tito = "• اكتب رمز امتحان", timoselva = {"768","٧٦٨"}},
{tito = "• اكتب رمز شكر", timoselva = {"546","٥٤٦"}},
{tito = "• اكتب رمز غيوم", timoselva = {"547","٥٤٧"}},
{tito = "• اكتب رمز شجرة", timoselva = {"235","٢٣٥"}},
{tito = "• اكتب رمز صدق", timoselva = {"657","٦٥٧"}},
{tito = "• اكتب رمز تعاون", timoselva = {"763","٧٦٣"}},
{tito = "• اكتب رمز قدر", timoselva = {"761","٧٦١"}},
{tito = "• اكتب رمز مقص", timoselva = {"126","١٢٦"}},
{tito = "• اكتب رمز سعادة", timoselva = {"124","١٢٤"}},
{tito = "• اكتب رمز مسطرة", timoselva = {"541","٥٤١"}},
{tito = "• اكتب رمز مناكير", timoselva = {"653","٦٥٣"}},
{tito = "• اكتب رمز علم", timoselva = {"331","٣٣١"}},
{tito = "• اكتب رمز عصا", timoselva = {"313","٣١٣"}},
{tito = "• اكتب رمز كرسي", timoselva = {"765","٧٦٥"}},
{tito = "• اكتب رمز نجوم", timoselva = {"321","٣٢١"}},
}
if not active_titos then
active_titos = {}
end
if text == "جدول" then
local random_index = math.random(#public_figures)
local selected_tito = public_figures[random_index]
active_titos[msg.chat_id] = {question = selected_tito,user_id = msg.sender_id.user_id}
bot.sendPhoto(msg_chat_id, msg_id, "https://t.me/UOUSOU/63", "*" .. selected_tito.tito .. "\n\n• ارسل اجابتك الان !*", 'md')
return
end
if active_titos[msg.chat_id] then
if msg.sender_id.user_id ~= active_titos[msg.chat_id].user_id then
return
end
local correct_answers = active_titos[msg.chat_id].question.timoselva
local is_correct = false
for _, ans in ipairs(correct_answers) do
if text == ans then
is_correct = true
break
end
end
if is_correct then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)
local xx = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id)
bot.sendText(msg.chat_id, msg.id,"*• احسنت! اجابة صحيحة 🌿❤️.\n\n• لقد ربحت نقطة 🎉\n\n• عدد نقاطك الان ⋮ ⦉ "..xx.." ⦊*",'md',true)
active_titos[msg.chat_id] = nil
else
local correct_show = table.concat(correct_answers, " أو ")
bot.sendText(msg.chat_id, msg.id,"*• للاسف اجابتك خطأ ❌*\n\n*• الاجابة الصحيحة هي : "..correct_show.." *",'md',true)
active_titos[msg.chat_id] = nil
end
end
----------------------------------------------------------------
local public_figures = {
{abdo = "فك تشفير ⋮ خ - م - ه", walid = "وهم"},
{abdo = "فك تشفير ⋮ د - ك - ن - ب - ل", walid = "زعلان"},
{abdo = "فك تشفير ⋮ ث - ة - ي", walid = "فرح"},
{abdo = "فك تشفير ⋮ ظ - ب - ا - ة", walid = "صابر"},
{abdo = "فك تشفير ⋮ ي - س - ة - م", walid = "حشره"},
{abdo = "فك تشفير ⋮ ش - ة - ب - ت", walid = "سراج"},
{abdo = "فك تشفير ⋮ ي - ث - ة - ر", walid = "حفره"},
{abdo = "فك تشفير ⋮ ى - ز - خ - ر", walid = "قدوه"},
{abdo = "فك تشفير ⋮ ف - ب - ه - ة", walid = "ثامر"},
{abdo = "فك تشفير ⋮ ب - ظ - ي - ب - ا", walid = "اصحاب"},
{abdo = "فك تشفير ⋮ ى - ه - ة", walid = "قمر"},
{abdo = "فك تشفير ⋮ ز - د - م - ب", walid = "دزها"},
{abdo = "فك تشفير ⋮ ح - ي - ن - خ", walid = "يحلو"},
{abdo = "فك تشفير ⋮ ى - د - ك", walid = "قزع"},
{abdo = "فك تشفير ⋮ ج - ك - ف - ة", walid = "تعثر"},
{abdo = "فك تشفير ⋮ ض - ة - م", walid = "مرض"},
{abdo = "فك تشفير ⋮ ا - ب - ا", walid = "باب"},
{abdo = "فك تشفير ⋮ ت - خ - ن", walid = "جول"},
{abdo = "فك تشفير ⋮ ض - ي - ض - ز", walid = "محمد"},
{abdo = "فك تشفير ⋮ ج - ب - ت - ة", walid = "تاجر"},
{abdo = "فك تشفير ⋮ ج - ب - ت", walid = "تاج"},
}
if not active_abdos then
active_abdos = {}
end
if text == "تشفير" or text == "فك تشفير" then
local random_index = math.random(#public_figures)
local selected_abdo = public_figures[random_index]
active_abdos[msg.chat_id] = {
answer = selected_abdo.walid,
user = msg.sender_id.user_id
}
bot.sendPhoto(msg_chat_id, msg_id, "https://t.me/UOUSOU/67", "*" .. selected_abdo.abdo .. "\n\n• ارسل اجابتك الان !*", 'md')
return
end
if active_abdos[msg.chat_id] then
if msg.sender_id.user_id == active_abdos[msg.chat_id].user then
if text == active_abdos[msg.chat_id].answer then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
local xx = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id)
bot.sendText(msg.chat_id, msg.id,"*• احسنت! اجابة صحيحة 🌿❤️.\n\n• لقد ربحت نقطة 🎉\n\n• عدد نقاطك الان ⋮ ⦉ "..xx.." ⦊*", 'md', true)
active_abdos[msg.chat_id] = nil
else
bot.sendText(msg.chat_id, msg.id,"*• اجابتك خطأ ❌*\n\n*• الاجابة الصحيحة هي ⋮ "..active_abdos[msg.chat_id].answer.."*", 'md', true)
active_abdos[msg.chat_id] = nil
end
end
end
----------------------------------------------------------------
local public_figures = {
{emoji="😂", answers={"ضحك", "مضحك", "هاها"}},
{emoji="❤️", answers={"حب", "قلب", "رومانسي"}},
{emoji="🔥", answers={"نار", "حريق", "حماس"}},
{emoji="🍕", answers={"بيتزا", "اكل", "طعام"}},
{emoji="🚗", answers={"سياره", "عربيه", "مواصلات"}},
{emoji="🏆", answers={"كاس", "بطوله", "فوز"}},
{emoji="🎸", answers={"جيتار", "موسيقى", "روك"}},
{emoji="🐱", answers={"قطه", "بسه", "حيوان"}},
{emoji="🌍", answers={"ارض", "عالم", "كوكب"}},
{emoji="⚽", answers={"كره", "قدم", "رياضه"}},
{emoji="🚀", answers={"صاروخ", "فضاء", "سرعه"}},
{emoji="🌞", answers={"شمس", "حر", "طقس"}},
{emoji="🌧️", answers={"مطر", "شتاء", "غيم"}},
{emoji="❄️", answers={"ثلج", "برد", "شتاء"}},
{emoji="🍎", answers={"تفاحه", "فاكهه", "احمر"}},
{emoji="🍌", answers={"موز", "فاكهه", "اصفر"}},
{emoji="🍉", answers={"بطيخ", "فاكهه", "اخضر"}},
{emoji="🥕", answers={"جزر", "خضار", "برتقالي"}},
{emoji="🌵", answers={"صبار", "نبات", "صحراوي"}},
{emoji="🐶", answers={"كلب", "وفي", "حيوان"}},
{emoji="🐼", answers={"باندا", "حيوان", "ابيض واسود"}},
{emoji="🦁", answers={"اسد", "ملك", "حيوان"}},
{emoji="🐘", answers={"فيل", "ضخم", "حيوان"}},
{emoji="🐍", answers={"ثعبان", "افعى", "زواحف"}},
{emoji="🐧", answers={"بطريق", "ثلج", "حيوان"}},
{emoji="🦉", answers={"بومه", "طائر", "حكيم"}},
{emoji="🎃", answers={"يقطين", "هالوين", "خريف"}},
{emoji="🎭", answers={"مسرح", "تمثيل", "قناع"}},
{emoji="🏀", answers={"كره سله", "رياضه", "NBA"}},
{emoji="🎤", answers={"مايك", "غناء", "موسيقى"}},
{emoji="🎮", answers={"لعبه", "جيمينج", "تحكم"}},
{emoji="🛫", answers={"طائره", "سفر", "مطار"}},
{emoji="🚲", answers={"دراجه", "عجل", "مواصلات"}},
{emoji="🏡", answers={"منزل", "بيت", "سكن"}},
{emoji="🗿", answers={"تمثال", "حجر", "تاريخي"}},
{emoji="🔒", answers={"قفل", "حمايه", "امان"}},
{emoji="🧩", answers={"لغز", "بازل", "ذكاء"}},
{emoji="🎯", answers={"هدف", "دقه", "تصويب"}},
{emoji="📚", answers={"كتب", "مكتبه", "تعلم"}},
{emoji="🖥️", answers={"كمبيوتر", "شاشه", "تكنولوجيا"}},
{emoji="📱", answers={"جوال", "هاتف", "موبايل"}},
{emoji="⌚", answers={"ساعه", "وقت", "توقيت"}},
{emoji="🔑", answers={"مفتاح", "باب", "فتح"}},
{emoji="⚓", answers={"مرساه", "بحر", "سفينه"}},
{emoji="🚦", answers={"اشاره", "مرور", "سيارات"}},
{emoji="🌈", answers={"قوس قزح", "الوان", "جمال"}},
{emoji="🎵", answers={"نوته", "موسيقى", "اغنيه"}},
{emoji="📷", answers={"كاميرا", "تصوير", "صوره"}}
}
if not active_emojis then active_emojis = {} end
if text == "ايموجي" then
local random_index = math.random(#public_figures)
local selected_emoji = public_figures[random_index]
active_emojis[msg.sender_id.user_id] = selected_emoji.answers
bot.sendText(msg.chat_id, msg.id, "*• ما اسم هذا الايموجي ⋮ ⦉ " .. selected_emoji.emoji .. " ⦊*", 'md', true)
return
end
if active_emojis[msg.sender_id.user_id] then
local correct_answers = active_emojis[msg.sender_id.user_id]
local user_answer = text:gsub("%s+", ""):lower()
local found_correct = false
for _, correct_answer in ipairs(correct_answers) do
if user_answer == correct_answer:lower() then
found_correct = true
break
end
end
if found_correct then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)
local xx = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id)
bot.sendText(msg.chat_id, msg.id, "*• احسنت! اجابه صحيحه 🌿❤️.\n\n• لقد ربحت نقطه 🎉\n\n• عدد نقاطك الان ⋮ ⦉ "..xx.." ⦊*", 'md', true)
else
bot.sendText(msg.chat_id, msg.id, "*• للاسف اجابه خاطئه! ❌\n\n• الاجابه الصحيحه كانت ⋮ ⦉ ".. correct_answers[1] .." ⦊*", 'md', true)
end
active_emojis[msg.sender_id.user_id] = nil
end
----------------------------------------------------------------
local capitals = {
    {country = "مصر", capital = "القاهره"},
    {country = "السعوديه", capital = "الرياض"},
    {country = "الامارات", capital = "ابوظبي"},
    {country = "الجزائر", capital = "الجزائر"},
    {country = "المغرب", capital = "الرباط"},
    {country = "العراق", capital = "بغداد"},
    {country = "سوريا", capital = "دمشق"},
    {country = "لبنان", capital = "بيروت"},
    {country = "الاردن", capital = "عمان"},
    {country = "السودان", capital = "الخرطوم"},
    {country = "ليبيا", capital = "طرابلس"},
    {country = "تونس", capital = "تونس"},
    {country = "اليمن", capital = "صنعاء"},
    {country = "قطر", capital = "الدوحه"},
    {country = "البحرين", capital = "المنامه"},
    {country = "عمان", capital = "مسقط"},
    {country = "تركيا", capital = "انقره"},
    {country = "فرنسا", capital = "باريس"},
    {country = "المانيا", capital = "برلين"},
    {country = "ايطاليا", capital = "روما"},
    {country = "اسبانيا", capital = "مدريد"},
    {country = "بريطانيا", capital = "لندن"},
    {country = "الولايات المتحده", capital = "واشنطن"},
    {country = "روسيا", capital = "موسكو"},
    {country = "الصين", capital = "بكين"},
    {country = "الهند", capital = "نيودلهي"},
    {country = "البرازيل", capital = "برازيليا"},
    {country = "الارجنتين", capital = "بوينس ايرس"},
    {country = "كندا", capital = "اوتاوا"},
    {country = "استراليا", capital = "كانبرا"},
    {country = "اليونان", capital = "اثينا"},
    {country = "السويد", capital = "ستوكهولم"},
    {country = "هولندا", capital = "امستردام"},
    {country = "سويسرا", capital = "برن"},
    {country = "النرويج", capital = "اوسلو"},
    {country = "كوريا الجنوبيه", capital = "سيول"},
    {country = "اليابان", capital = "طوكيو"},
    {country = "جنوب افريقيا", capital = "بريتوريا"}
}
if not active_capitals then
active_capitals = {}
end
if text == "عواصم" then
local random_index = math.random(#capitals)
local selected_capital = capitals[random_index]
active_capitals[msg.sender_id.user_id] = selected_capital.capital
bot.sendText(msg.chat_id, msg.id, " *• ما هي عاصمه ⋮ ⦉ ".. selected_capital.country .." ⦊ *", 'md', true)
return
end
if active_capitals[msg.sender_id.user_id] then
if text == active_capitals[msg.sender_id.user_id] then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)
local points = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id)
bot.sendText(msg.chat_id, msg.id, "*• احسنت! اجابه صحيحه 🌿❤️.\n\n• لقد ربحت نقطه 🎉.\n\n• عدد نقاطك الان ⋮ ⦉ "..points.." ⦊*", 'md', true)
else
bot.sendText(msg.chat_id, msg.id, "*• للاسف! اجابه خاطئه ❌.\n\n• الاجابه الصحيحه كانت ⦉ ".. active_capitals[msg.sender_id.user_id] .." ⦊*", 'md', true)
end
active_capitals[msg.sender_id.user_id] = nil
end
local true_false_questions = {
{question="الشمس تدور حول الارض.", answer="خطا"},
{question="القاهره هي عاصمه مصر.", answer="صح"},
{question="المحيط الاطلسي هو اكبر محيط في العالم.", answer="خطا"},
{question="اسرع حيوان على وجه الارض هو الفهد.", answer="صح"},
{question="عدد الكواكب في المجموعه الشمسيه هو 8.", answer="صح"},
{question="الماء يتجمد عند درجه حراره 0 مئويه.", answer="صح"},
{question="الذهب معدن سائل في حالته الطبيعيه.", answer="خطا"},
{question="جبل ايفرست هو اعلى قمه جبليه في العالم.", answer="صح"},
{question="التمساح يستطيع تحريك لسانه.", answer="خطا"},
{question="عدد عظام جسم الانسان البالغ هو 206.", answer="صح"},
{question="الصوت ينتقل في الفراغ.", answer="خطا"},
{question="الدماغ هو اكبر عضو في جسم الانسان.", answer="خطا"},
{question="البرازيل فازت بكاس العالم اكثر من اي دوله اخرى.", answer="صح"},
{question="الحوت الازرق هو اكبر حيوان على وجه الارض.", answer="صح"},
{question="عدد القارات في العالم هو 7.", answer="صح"},
{question="يستطيع الانسان العيش بدون الكبد.", answer="خطا"},
{question="المانيا هي اكبر دوله في اوروبا من حيث المساحه.", answer="خطا"},
{question="النيل هو اطول نهر في العالم.", answer="صح"},
{question="جميع العناكب سامه.", answer="خطا"},
{question="الضوء يمكنه الانحناء بفعل الجاذبيه.", answer="صح"},
{question="روما هي عاصمه ايطاليا.", answer="صح"},
{question="الصين هي اكبر دوله من حيث عدد السكان.", answer="صح"},
{question="الفضاء الخارجي ليس له جاذبيه.", answer="خطا"},
{question="القطط ترى في الظلام بشكل افضل من البشر.", answer="صح"},
{question="الاخطبوط لديه 5 قلوب.", answer="خطا"},
{question="الالماس هو اصلب ماده طبيعيه معروفه.", answer="صح"},
{question="الشوكولاته البيضاء تحتوي على الكاكاو.", answer="خطا"},
{question="الزرافه يمكنها النوم لبضع دقائق فقط يومياً.", answer="صح"},
{question="اقصر حرب في التاريخ استمرت 38 دقيقه.", answer="صح"},
{question="الفيروسات تعتبر من الكائنات الحيه.", answer="خطا"},
{question="الارض هي الكوكب الوحيد الذي يحتوي على ماء سائل.", answer="صح"},
{question="الدماغ البشري يتوقف عن النمو بعد سن 18.", answer="خطا"},
{question="الزئبق هو المعدن الوحيد السائل في درجه حراره الغرفه.", answer="صح"},
{question="يوجد اكثر من 50 نوعاً من البراكين.", answer="صح"},
{question="القرود قادره على تعلم لغه الاشاره.", answer="صح"},
{question="الكافيين يوجد فقط في القهوه.", answer="خطا"},
{question="الكهرباء يمكن ان تنتقل عبر الماء النقي.", answer="خطا"},
{question="الذهب اثقل من الفضه.", answer="صح"},
{question="اطول نفق في العالم موجود في اليابان.", answer="صح"},
{question="النوم بدون وساده افضل لصحه الرقبه.", answer="صح"},
{question="الكربون هو العنصر الاساسي في تكوين الالماس.", answer="صح"},
{question="التمساح يمكنه العيش دون طعام لمده عام.", answer="صح"},
{question="القمر يضيء من نفسه.", answer="خطا"},
{question="اول رحله للفضاء كانت عام 1969.", answer="خطا"},
{question="حاسه الشم عند الكلاب اقوى من البشر بـ 40 مره.", answer="صح"},
{question="الاسماك لا تستطيع النوم.", answer="خطا"},
{question="استراليا اصغر قاره في العالم.", answer="صح"},
{question="معده الانسان يمكنها اذابه المعدن.", answer="صح"},
{question="البصل يجعل الجميع يبكي عند تقطيعه.", answer="خطا"}
}
if not active_questions then active_questions = {} end
if text == "صح وخطا" then
local random_index = math.random(#true_false_questions)
local selected_question = true_false_questions[random_index]
active_questions[msg.sender_id.user_id] = selected_question.answer
bot.sendText(msg.chat_id, msg.id, " *• هل هذه العباره صحيحه ام خاطئه ؟\n\n⦉ " .. selected_question.question .. " ⦊\n\n• ارسل ( صح ) او ( خطا ) الان ..!*", 'md', true)
return
end
if active_questions[msg.sender_id.user_id] then
if text == active_questions[msg.sender_id.user_id] then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)
local points = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id)
bot.sendText(msg.chat_id, msg.id, "*• اجابه صحيحه 🌿❤️.\n\n• لقد ربحت نقطه 🎉.\n\n• عدد نقاطك الان ⋮ ⦉ "..points.." ⦊*", 'md', true)
else
bot.sendText(msg.chat_id, msg.id, "*• اجابه خاطئه ❌.\n\n• الاجابه الصحيحه هي ⋮ ⦉ ".. active_questions[msg.sender_id.user_id] .." ⦊*", 'md', true)
end
active_questions[msg.sender_id.user_id] = nil
end
local proverbs = {
{start="الغايب حجته...", complete="معاه"},
{start="اللي اختشوا...", complete="ماتوا"},
{start="من جد وجد ومن زرع...", complete="حصد"},
{start="القفه اللي ليها ودنين...", complete="يشيلوها اتنين"},
{start="على قد لحافك...", complete="مد رجليك"},
{start="اللي ميعرفش يقول...", complete="عدس"},
{start="الحي يحييك والميت...", complete="يزودك طيب"},
{start="الجار قبل...", complete="الدار"},
{start="كل تاخيره وفيها...", complete="خيره"},
{start="يد واحده لا...", complete="تصفق"},
{start="ان غاب القط...", complete="العب يا فار"},
{start="اللي يعوزه البيت...", complete="يحرمه الجامع"},
{start="لا تؤجل عمل اليوم الى...", complete="الغد"},
{start="اذا كان الكلام من فضه فالسكوت من...", complete="ذهب"},
{start="امشي عدل...", complete="يحتار عدوك فيك"},
{start="اللي في القدر...", complete="يجيبه المغرف"},
{start="العين بصيره...", complete="واليد قصيره"},
{start="الديك الفصيح من البيضه...", complete="يصيح"},
{start="اللي ما يعرف الصقر...", complete="يشويه"},
{start="رب اخ لك...", complete="لم تلده امك"},
{start="عصفور في اليد...", complete="ولا عشره على الشجره"},
{start="كلمه الحق...", complete="تقضي الحاجه"},
{start="جبتك عون طلعت...", complete="فرعون"},
{start="اليد اللي متقدرش تقطعها...", complete="بوسها"},
{start="اللي بيته من زجاج...", complete="ما يحدفش الناس بالطوب"},
{start="ضربوا الاعور على عينه قال...", complete="خسرانه خسرانه"},
{start="اللي يتلسع من الشوربه...", complete="ينفخ في الزبادي"},
{start="يخلق من الشبه...", complete="اربعين"},
{start="اللي على راسه بطحه...", complete="يحسس عليها"},
{start="المياه تكذب...", complete="الغطاس"},
{start="الحلو ما يكملش...", complete="دايماً"},
{start="اخر العلاج...", complete="الكي"},
{start="عدوك ابن...", complete="كارك"},
{start="ياما تحت السواهي...", complete="دواهي"},
{start="لو كان فيه خير...", complete="ما كان رماه الطير"},
{start="ابن الوز...", complete="عوام"},
{start="الباب اللي يجيلك منه الريح...", complete="سده واستريح"},
{start="كل واحد ينام على الجنب اللي...", complete="يريحه"},
{start="اللي ميطولش العنب...", complete="يقول عليه حامض"},
{start="بعد ما شاب...", complete="ودوه الكتاب"},
{start="الطيور على...", complete="اشكالها تقع"},
{start="القرد في عين امه...", complete="غزال"},
{start="اللي يعمل خير...", complete="ما يلقاش غير الخير"},
{start="اتلم المتعوس على...", complete="خايب الرجا"},
{start="خد من التل...", complete="يقل"},
{start="كثره الضحك...", complete="تميت القلب"},
{start="سكتنا له دخل...", complete="بحماره"},
{start="صاحب بالين...", complete="كذاب"},
{start="الصبر مفتاح...", complete="الفرج"}
}
if not active_proverbs then active_proverbs = {} end
if text == "اكمل المثل" or text == "مثل" or text == "كمل المثل" then
local random_index = math.random(#proverbs)
local selected_proverb = proverbs[random_index]
active_proverbs[msg.sender_id.user_id] = selected_proverb.complete
bot.sendText(msg.chat_id, msg.id, " *• اكمل المثل التالي\n\n⦉ " .. selected_proverb.start .. " ⦊ ...؟\n\n• ارسل اكمال المثل الان !*", 'md', true)
return
end
if active_proverbs[msg.sender_id.user_id] then
if text == active_proverbs[msg.sender_id.user_id] then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)
local points = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id)
bot.sendText(msg.chat_id, msg.id, "*• اجابه صحيحه 🌿❤️.\n\n• لقد ربحت نقطه 🎉.\n\n• عدد نقاطك الان ⋮ ⦉ "..points.." ⦊*", 'md', true)
else
bot.sendText(msg.chat_id, msg.id, "*• اجابه خاطئه ❌.\n\n• الاجابه الصحيحه هي ⋮ ⦉ ".. active_proverbs[msg.sender_id.user_id] .." ⦊*", 'md', true)
end
active_proverbs[msg.sender_id.user_id] = nil
end
----------------------------------------------------------------
if text == 'مسح رسائله' and msg.reply_to_message_id ~= 0 then
if not msg.SuperCreator then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:del(Fast..'Num:Message:User'..msg.chat_id..':'..rep_idd) 
return send(msg.chat_id,msg.id,"• تم مسح رسائله ", "md")
end
if text == 'مسح نقاطه' and msg.reply_to_message_id ~= 0 then
if not msg.SuperCreator then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:del(Fast.."Num:Add:Games"..msg.chat_id..rep_idd)
return send(msg.chat_id,msg.id,"• تم مسح نقاطه ", "md")
end
if text == 'مسح تعديلاته' and msg.reply_to_message_id ~= 0 then
if not msg.SuperCreator then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:del(Fast..'Num:Message:Edit'..msg.chat_id..rep_idd)
return send(msg.chat_id,msg.id,"• تم مسح تعديلاته ", "md")
end

if text and text:match("^بيع نقاطي (%d+)$") then
local NumGame = text:match("^بيع نقاطي (%d+)$") 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if tonumber(NumGame) == tonumber(0) then
return send(msg.chat_id,msg.id,"\n*• لا استطيع البيع اقل من 1 *","md",true)  
end
local NumberGame = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id)
if tonumber(NumberGame) == tonumber(0) then
return send(msg.chat_id,msg.id,"• ليس لديك جواهر من الالعاب \n• اذا كنت تريد ربح النقاط \n• ارسل الالعاب وابدأ اللعب ! ","md",true)  
end
if tonumber(NumGame) > tonumber(NumberGame) then
return send(msg.chat_id,msg.id,"\n• ليس لديك جواهر بهذا العدد \n• لزيادة نقاطك في اللعبه \n• ارسل الالعاب وابدأ اللعب !","md",true)   
end
local NumberGet = (tonumber(NumGame) * 50)
Redis:decrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id,NumGame)  
Redis:incrby(Fast.."Num:Message:User"..msg.chat_id..":"..msg.sender_id.user_id,NumberGet)  
return send(msg.chat_id,msg.id,"• تم خصم *~ { "..NumGame.." }* من نقاطك \n• وتم اضافة* ~ { "..NumberGet.." } رساله الى رسائلك *","md",true)  
end 
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id ~= 0 and Redis:get(Fast.."Status:Games"..msg.chat_id) then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هـذا الامر يخص الـمـطور الاساسي\n√* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg.chat_id,msg.id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg.chat_id,msg.id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..rep_idd, text:match("^اضف نقاط (%d+)$"))  
return send(msg.chat_id,msg.id,Reply_Status(rep_idd,"• تم اضافه له { "..text:match("^اضف نقاط (%d+)$").." } من النقاط").Reply,"md",true)  
end
if text and text:match("^اضف تعديلات (%d+)$") and msg.reply_to_message_id ~= 0 and Redis:get(Fast.."Status:Games"..msg.chat_id) then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg.chat_id,msg.id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg.chat_id,msg.id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(Fast..'Num:Message:Edit'..msg.chat_id..rep_idd, text:match("^اضف تعديلات (%d+)$"))  
return send(msg.chat_id,msg.id,Reply_Status(rep_idd,"• تم اضافه له { "..text:match("^اضف تعديلات (%d+)$").." } من التعديلات").Reply,"md",true)  
end
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id ~= 0 and Redis:get(Fast.."Status:Games"..msg.chat_id) then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg.chat_id,msg.id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg.chat_id,msg.id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(Fast.."Num:Message:User"..msg.chat_id..":"..rep_idd, text:match("^اضف رسائل (%d+)$"))  
return send(msg.chat_id,msg.id,Reply_Status(rep_idd,"• تم اضافه له { "..text:match("^اضف رسائل (%d+)$").." } من الرسائل").Reply,"md",true)  
end
if text == "نقاطي" then 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لاستخدام الأوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لاستخدام الأوامر*',"md",false, false, false, false, reply_markup)
end
local bain = bot.getUser(senderr)
local Text = bain.first_name and '*['..bain.first_name..'](tg://user?id='..bain.id..')*' or 'لا يوجد'
local Num = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id) or 0
return send(msg.chat_id,msg.id, Num == 0 and "*• ليس لديك نقاط يا ⦉ "..Text.." ⦊\n√*" or "*• عدد نقاطك يا ⦉ "..Text.." ⦊ \n\n• هـــي ⦉ "..Num.." ⦊ 🌿❤️*","md",true)
end
if text == "جلب نسخة نقاطي" or text == "جاب نسخه نقاطي" or text == "جلب نقاطي" then
local user_id = tostring(msg.sender_id.user_id)
local points = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..user_id) or 0
local data = {
BotId = Fast,
UsersPoints = {
[user_id] = points
}
}
local file_name = "./نسخه النقاط الخاصه بك "..user_id.." "
local file = io.open(file_name, "w")
file:write(JSON.encode(data))
file:close()
local send_status = bot.sendDocument(user_id, 0, file_name, "*• هذه نسخة احتياطية من نقاطك، استخدمها لاستعادتها لاحقًا.\n\n• لرفع النسخة ⋮ قم بتحويل هذا الملف إلى أي جروب يوجد فيه البوت ثم اكتب* ⋮ `رفع نقاطي` \n\n*• لا تشاك النسخه مع احد للحفاظ علي نقاطتك *", "md")
if not send_status then
send(msg.chat_id, msg.id, "❌ لا يمكن إرسال النسخة الاحتياطية في الخاص، تأكد من أنك بدأت المحادثة مع البوت عن طريق إرسال أي رسالة في الخاص.", "md", true)
else
send(msg.chat_id, msg.id, "*• تم جلب نسخه نقاطتك بنجاح ستجدها في خاص البوت\n\n• تاكد من وجود محادثه بينك وبين البوت\n\n• اذا كان لا يوجد محادثه برجاء ارسال /start داخل البوت\n\n• ثم اعد كتابه جلب نقاطي*", "md", true) 
end
os.remove(file_name)
end
if text == 'رفع نقاطي' and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path, Name_File)
local Get_Info = io.open(download_,"r"):read('*a')
if not Get_Info then
return send(msg.chat_id, msg.id, "❌ فشل في قراءة الملف، تأكد من أنك ترفع النسخة الصحيحة.", "md", true)
end
local FilesJson = JSON.decode(Get_Info)
if not FilesJson or not FilesJson.UsersPoints then
return send(msg.chat_id, msg.id, "❌ الملف لا يحتوي على بيانات النقاط أو غير صالح.", "md", true)
end
local user_id = tostring(msg.sender_id.user_id)
local user_points = FilesJson.UsersPoints[user_id]
if user_points then
Redis:set(Fast.."Num:Add:Games"..msg.chat_id..user_id, user_points)
return send(msg.chat_id, msg.id, "✅ تم استعادة نقاطك بنجاح! لديك الآن ⦉ "..user_points.." ⦊ نقطة 🌿❤️", "md", true)
else
return send(msg.chat_id, msg.id, "❌ لم يتم العثور على نقاطك داخل هذا الملف، تأكد من أنك ترفع النسخة الصحيحة.", "md", true)
end
end
end
if text == "توب النقاط" or text == "ترتيب النقاط" then
local users_points = {}
local all_users = Redis:smembers(Fast.."Num:User:Pv")
for _, user_id in pairs(all_users) do
local points = tonumber(Redis:get(Fast.."Num:Add:Games"..msg.chat_id..user_id) or 0)
if points > 0 then
table.insert(users_points, {id = user_id, points = points})
end
end
table.sort(users_points, function(a, b) return a.points > b.points end)
local buttons = {}
local text_msg = "*اعلي 5 مستخدمين من حيث النقاط 🏅*"
for i = 1, math.min(5, #users_points) do
local user_info = bot.getUser(users_points[i].id)
local display_name = user_info.first_name or "مستخدم مجهول"
local points = users_points[i].points
table.insert(buttons, {
{ text = " " .. display_name, url = "tg://user?id=" .. users_points[i].id },
{ text = "⦉ " .. points .. " ⦊", url = "tg://user?id=" .. users_points[i].id },})
end
if #users_points == 0 then
text_msg = "❌ لا يوجد أي مستخدم لديه نقاط حتى الآن."
end
local reply_markup = bot.replyMarkup{type = 'inline',data = buttons}
send(msg.chat_id, msg.id, text_msg, "md", false, false, false, false, reply_markup)
end


end

return {Fast = games}