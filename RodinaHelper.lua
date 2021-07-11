script_version('07.07.2021')
script_author("Grey_Garcia")

local nalogovaya = 0
local version = script.this.version

local checking = false
local tVips = {}

local font = renderCreateFont('Arial', 10, 9)
local gkey = require 'game.keys'
local lib = require 'lib.moonloader'
local imgui = require 'imgui'
local encoding = require 'encoding'
local inicfg = require 'inicfg'
local hook = require 'lib.samp.events'
encoding.default = 'CP1251'
u8 = encoding.UTF8

local mainIni = inicfg.load({
config =
{
invf = false,
lic = false,
dmg = false,
timer = false,
trade = false,
spawncara = false,
tlf = false,
arm = false,
msk = false,
med = false,
smk = false,
cctime = false,
lock = false,
fcar = false,
recar = false,
key = false,
vr = false,
aut = false,
abc = false,
acd = false,
mbc = false,
at = false,
act = false,
zz = false,
famnames = false,
pizza = false,
vip = false,
drugs = false,
flood = false,
olock = false,
doppiar = false,
nalogi = false,
asc = false,
nalog = false,
binder = false,
aafk = false,
aafksilent = false,
aeda = false,
ashar = false,
shar = false,
piarcheck = false,
catchmenu = false,
binderset1 = true,
binderset2 = false,
binderset3 = false,
bindersetkey = false,
infotextb = false,
chatsms = "",
rtsms = "",
famsms = "",
smsbc = "",
smsvip = "",
smsvippr = "",
chasi = "",
bindt1 = "",
bindt2 = "",
bindt3 = "",
bindt4 = "",
bindt5 = "",
bindt6 = "",
bindt7 = "",
bindt8 = "",
bindt9 = "",
bindt10 = "",
bindt11 = "",
bindt12 = "",
bindt13 = "",
bindt14 = "",
bindt15 = "",
bindt16 = "",
bindt17 = "",
bindt18 = "",
bindt19 = "",
bindt20 = "",
bindt21 = "",
bindt22 = "",
bindt23 = "",
bindt24 = "",
bindt25 = "",
bindt26 = "",
bindt27 = "",
bindt28 = "",
bindt29 = "",
bindt30 = "",
tkey = "xx",
maskkey = "-",
medkey = "-",
armkey = "=",
keyAdminMenu = "",
sharkey = "bb",
checked_radio = "1",
bindtab = "1",
toch = "unactive",
textposX = "40",
textposY = "450"
}
}, "Rodina Helper")


local lic = imgui.ImBool(mainIni.config.lic)
local trade = imgui.ImBool(mainIni.config.trade)
local tlf = imgui.ImBool(mainIni.config.tlf)
local arm = imgui.ImBool(mainIni.config.arm)
local msk = imgui.ImBool(mainIni.config.msk)
local med = imgui.ImBool(mainIni.config.med)
local nalog = imgui.ImBool(mainIni.config.nalog)
local asc = imgui.ImBool(mainIni.config.asc)
local smk = imgui.ImBool(mainIni.config.smk)
local cctime = imgui.ImBool(mainIni.config.cctime)
local lock = imgui.ImBool(mainIni.config.lock)
local dmg = imgui.ImBool(mainIni.config.dmg)
local nalogi = imgui.ImBool(mainIni.config.nalogi)
local slider = imgui.ImInt(15000)
local fcar = imgui.ImBool(mainIni.config.fcar)
local recar = imgui.ImBool(mainIni.config.recar)
local key = imgui.ImBool(mainIni.config.key)
local vr = imgui.ImBool(mainIni.config.vr)
local doppiar = imgui.ImBool(mainIni.config.doppiar)
local aut = imgui.ImBool(mainIni.config.aut)
local abc = imgui.ImBool(mainIni.config.abc)
local timer = imgui.ImBool(mainIni.config.timer)
local zz = imgui.ImBool(mainIni.config.zz)
local famnames = imgui.ImBool(mainIni.config.famnames)
local olock = imgui.ImBool(mainIni.config.olock)
local acd = imgui.ImBool(mainIni.config.acd)
local pizza = imgui.ImBool(mainIni.config.pizza)
local at = imgui.ImBool(mainIni.config.at)
local flood = imgui.ImBool(mainIni.config.flood)
local vip = imgui.ImBool(mainIni.config.vip)
local drugs = imgui.ImBool(mainIni.config.drugs)
local spawncara = imgui.ImBool(mainIni.config.spawncara)
local smsbc = imgui.ImBuffer(''..mainIni.config.smsbc, 500) 
local chatsms = imgui.ImBuffer(''..mainIni.config.chatsms, 500) 
local rtsms = imgui.ImBuffer(''..mainIni.config.rtsms, 500) 
local famsms = imgui.ImBuffer(''..mainIni.config.famsms, 500)
local smsvip = imgui.ImBuffer(''..mainIni.config.smsvip, 500)
local smsvippr = imgui.ImBuffer(''..mainIni.config.smsvippr, 500)
local chasi = imgui.ImBuffer(''..mainIni.config.chasi, 500)
local mbc = imgui.ImBool(mainIni.config.mbc)
local binder = imgui.ImBool(mainIni.config.binder)
local binderset1 = imgui.ImBool(mainIni.config.binderset1)
local binderset2 = imgui.ImBool(mainIni.config.binderset2)
local binderset3 = imgui.ImBool(mainIni.config.binderset3)
local bindersetkey = imgui.ImBool(mainIni.config.bindersetkey)
local bindt1 = imgui.ImBuffer(''..mainIni.config.bindt1, 500)
local bindt2 = imgui.ImBuffer(''..mainIni.config.bindt2, 500)
local bindt3 = imgui.ImBuffer(''..mainIni.config.bindt3, 500)
local bindt4 = imgui.ImBuffer(''..mainIni.config.bindt4, 500)
local bindt5 = imgui.ImBuffer(''..mainIni.config.bindt5, 500)
local bindt6 = imgui.ImBuffer(''..mainIni.config.bindt6, 500)
local bindt7 = imgui.ImBuffer(''..mainIni.config.bindt7, 500)
local bindt8 = imgui.ImBuffer(''..mainIni.config.bindt8, 500)
local bindt9 = imgui.ImBuffer(''..mainIni.config.bindt9, 500)
local bindt10 = imgui.ImBuffer(''..mainIni.config.bindt10, 500)
local bindt11 = imgui.ImBuffer(''..mainIni.config.bindt11, 500)
local bindt12 = imgui.ImBuffer(''..mainIni.config.bindt12, 500)
local bindt13 = imgui.ImBuffer(''..mainIni.config.bindt13, 500)
local bindt14 = imgui.ImBuffer(''..mainIni.config.bindt14, 500)
local bindt15 = imgui.ImBuffer(''..mainIni.config.bindt15, 500)
local bindt16 = imgui.ImBuffer(''..mainIni.config.bindt16, 500)
local bindt17 = imgui.ImBuffer(''..mainIni.config.bindt17, 500)
local bindt18 = imgui.ImBuffer(''..mainIni.config.bindt18, 500)
local bindt19 = imgui.ImBuffer(''..mainIni.config.bindt19, 500)
local bindt20 = imgui.ImBuffer(''..mainIni.config.bindt20, 500)
local bindt21 = imgui.ImBuffer(''..mainIni.config.bindt21, 500)
local bindt22 = imgui.ImBuffer(''..mainIni.config.bindt22, 500)
local bindt23 = imgui.ImBuffer(''..mainIni.config.bindt23, 500)
local bindt24 = imgui.ImBuffer(''..mainIni.config.bindt24, 500)
local bindt25 = imgui.ImBuffer(''..mainIni.config.bindt25, 500)
local bindt26 = imgui.ImBuffer(''..mainIni.config.bindt26, 500)
local bindt27 = imgui.ImBuffer(''..mainIni.config.bindt27, 500)
local bindt28 = imgui.ImBuffer(''..mainIni.config.bindt28, 500)
local bindt29 = imgui.ImBuffer(''..mainIni.config.bindt29, 500)
local bindt30 = imgui.ImBuffer(''..mainIni.config.bindt30, 500)
local aeda = imgui.ImBool(mainIni.config.aeda)
local invf = imgui.ImBool(mainIni.config.invf)
local tkey = imgui.ImBuffer(''..mainIni.config.tkey, 4)
local armkey = imgui.ImBuffer(''..mainIni.config.armkey, 10)
local maskkey = imgui.ImBuffer(''..mainIni.config.maskkey, 10)
local medkey = imgui.ImBuffer(''..mainIni.config.medkey, 10)
local toch = imgui.ImBuffer(''..mainIni.config.toch, 20)
local ashar = imgui.ImBool(mainIni.config.ashar)
local shar = imgui.ImBool(mainIni.config.shar)
local sharkey = imgui.ImBuffer(''..mainIni.config.sharkey, 10)
local piarcheck = imgui.ImBool(mainIni.config.piarcheck)
local catchmenu = imgui.ImBool(mainIni.config.catchmenu)
local setmodelID = imgui.ImInt(16112)
local checked_radio = imgui.ImInt(mainIni.config.checked_radio)
local bindtab = imgui.ImInt(mainIni.config.bindtab)
local posX = mainIni.config.textposX
local posY = mainIni.config.textposY
local infotextb = imgui.ImBool(mainIni.config.infotextb)

local checked_box = false
local checktochilki = false
local tab = "one"
local tab2 = "one"
local tochamuletbutton = "unactive"
local piarbutton = "unactive"
local wait_ = 0.5

local KeyB = {"NumPad0",
	"NumPad1",
	"NumPad2",
	"NumPad3",
	"NumPad4",
	"NumPad5",
	"NumPad6",
	"NumPad7",
	"NumPad8",
	"NumPad9",
 }

local status = inicfg.load(mainIni, 'Rodina Helper.ini')
if not doesFileExist('moonloader/config/Rodina Helper.ini') then inicfg.save(mainIni, 'Rodina Helper.ini') end

local main_window_state = imgui.ImBool(false)
function imgui.OnDrawFrame()
  		imgui.ShowCursor = main_window_state.v
  if main_window_state.v then
		imgui.SetNextWindowSize(imgui.ImVec2(1080, 540), imgui.Cond.FirstUseEver)
		if not window_pos then
			ScreenX, ScreenY = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(ScreenX / 2 , ScreenY / 2), imgui.Cond.FirsUseEver, imgui.ImVec2(0.5, 0.5))
		end
	  imgui.Begin('Rodina Helper', main_window_state, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoScrollbar)
	  	imgui.BeginChild("##команды", imgui.ImVec2(1050, 35), true, imgui.WindowFlags.NoScrollbar)
			imgui.SetCursorPos(imgui.ImVec2(109, 10))
				imgui.Text(u8"Сокращенные команды: /armour - /arm, /usemed - /med, /house - /h, /fammenu - /fm |")
				imgui.TextWithQuestionColored(u8'Примеры: \n/calc 2*2 - Умножение\n/calc 2/2 - Деление\n/calc 2-2 - Вычитание\n/calc 2+2 - Сложение ', imgui.ImVec4(0.0, 0.5, 1.0, 1.0), u8'Калькулятор: /calc *пример*', imgui.SameLine())
			imgui.SetCursorPos(imgui.ImVec2(880, 10))
			    imgui.TextColored(imgui.ImVec4(0.43, 0.43, 0.50, 0.50), u8'Версия:')
				imgui.SameLine()
			imgui.SetCursorPos(imgui.ImVec2(932, 5))
				if imgui.Button(u8"От "..version.."", imgui.ImVec2(110, 25)) then
				update()
				end
			imgui.SetCursorPos(imgui.ImVec2(7, 5))
			    imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.85, 1.00, 0.41, 1.00))
                imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.85, 1.00, 0.41, 1.00))
                imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.85, 1.00, 0.41, 1.00))
				imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(0.00, 0.00, 0.00, 1.00))
				if imgui.Button(u8"GARCIA", imgui.ImVec2(90, 25)) then
				   sampAddChatMessage("Семья GARCIA - Сервер Rodina RP Северный округ (03) ", -1)
				end
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
				imgui.PopStyleColor()
		imgui.EndChild()
		imgui.BeginChild("##левый_верх", imgui.ImVec2(300, 120), true, imgui.WindowFlags.NoScrollbar)
				imgui.Checkbox(u8"Показ скилов ближайшему игроку", lic)
				imgui.SameLine()
				imgui.TextQuestion(u8'При нажатии клавиш ALT + 1 вы покажите лицензии ближайшему игроку')
				imgui.Checkbox(u8"Торговля ближайшему игроку", trade)
				imgui.SameLine()
				imgui.TextQuestion(u8'При нажатии клавиш ALT + 2 вы предложите торговлю ближайшему игроку')
				imgui.Checkbox(u8"Телефон", tlf)
				imgui.SameLine()
				imgui.TextQuestion(u8"При нажатии на клавишу P у вас откроется телефон со скипом дилога,\nесли у вас более 2-х устройств в инвентаре." )
				imgui.SameLine()
				imgui.Checkbox(u8"Удаление мусора", flood)
				imgui.SameLine()
				imgui.TextQuestion(u8"Данная функция удалит из чата такие сообщения как: пригласите друга, со склада sf выехал матовоз и т.д" )
	  	imgui.EndChild()
	  	imgui.BeginChild("##левый_низ", imgui.ImVec2(300, 248), true, ImGuiWindowFlags_AlwaysVerticalScrollbar)
				imgui.Checkbox(u8"Бронежилет", arm)
				imgui.SameLine()
				imgui.TextQuestion(u8"При сочетании выбранных вами клавиш у вас появится бронежилет")	
				if arm.v then
				 if imgui.CollapsingHeader(u8"Бронежилет##header") then
				 imgui.PushItemWidth(100)
				 imgui.InputText(u8"Активация брони", armkey)
				 imgui.SameLine()
				 imgui.TextQuestion(u8"Введите чит-код, который будет активировать бронежилет (По умолчанию - кнопка '=' (равно))")
				 imgui.Separator()
				 end
				end
				imgui.Checkbox(u8"Маска", msk)
				imgui.SameLine()
				imgui.TextQuestion(u8"При сочетании выбранных вами клавиш у вас появится маска")
				if msk.v then
				 if imgui.CollapsingHeader(u8"Маска##header") then
				 imgui.PushItemWidth(100)
				 imgui.InputText(u8"Активация маски", maskkey)
				 imgui.SameLine()
				 imgui.TextQuestion(u8"Введите чит-код, который будет активировать маску (По умолчанию - кнопка '-' (минус))")
				 imgui.Separator()
				 end
				end
				imgui.Checkbox(u8"Аптечка", med)
				imgui.SameLine()
				imgui.TextQuestion(u8"При сочетании выбранных вами клавиш у вас используется аптечка")
				if med.v then
				 if imgui.CollapsingHeader(u8"Аптечка##header") then
				 imgui.PushItemWidth(100)
				 imgui.InputText(u8"Активация аптечки", medkey)
				 imgui.SameLine()
				 imgui.TextQuestion(u8"Введите чит-код, который будет активировать аптечку (По умолчанию - кнопка '-' (минус))")
				 imgui.Separator()
				 end
				end
				imgui.Checkbox(u8"Сигарета", smk)
				imgui.SameLine()
				imgui.TextQuestion(u8"При сочетании клавиш SMK у вас появится сигарета")
				imgui.Checkbox(u8"Наркотики", drugs)
				imgui.SameLine()
				imgui.TextQuestion(u8"При сочетании клавиш alt + 1/2/3 (нумпад = кол-во) вы используете наркотики")
				imgui.Checkbox(u8"Реакция на ВИПку", vip)
				imgui.SameLine()
				imgui.TextQuestion(u8"Как только какой то игрок купит Титан или Премиум Вип - скрипт отправит в /vr чат это сообщение")
				if vip.v then
				 if imgui.CollapsingHeader(u8"Реакция на ВИПку##header") then
				 imgui.PushItemWidth(172)
				 imgui.InputText(u8"Если Titan", smsvip)
				 imgui.PushItemWidth(172)
				 imgui.InputText(u8"Если Premium", smsvippr)
				 imgui.Separator()
				 end
				end
				imgui.Checkbox(u8"Часы", cctime)
				imgui.SameLine()
				imgui.TextQuestion(u8"При нажатии выбранных вами клавиш вы посмотрите на часы с вашей отыгровкой.")
				if cctime.v then
				 if imgui.CollapsingHeader(u8"Часы##header") then
				 imgui.PushItemWidth(100)
				 imgui.InputText(u8"Активация часов", tkey)
				 imgui.SameLine()
				 imgui.TextQuestion(u8"Введите чит-код, который будет активировать отыгровку (По умолчанию - 'XX' англ.)")
				 imgui.PushItemWidth(185)
				 imgui.InputText(u8"Отыгровка", chasi)
				 imgui.Separator()
				 end
				end
				imgui.Checkbox(u8"Закрытие транспорта", lock)
				imgui.SameLine()
				imgui.TextQuestion(u8"При нажатии на клавишу L вы закроете/откроете свой транспорт")
				imgui.Checkbox(u8"Установка шара",shar)
				imgui.SameLine()
				imgui.TextQuestion(u8"Установка а/с Воздушный Шар при введении заданного вами Чит-Кода.")
				if shar.v then
				 if imgui.CollapsingHeader(u8"Установка шара##header") then
				 imgui.PushItemWidth(100)
				 imgui.InputText(u8"Активация шара", sharkey)
				 imgui.SameLine()
				 imgui.TextQuestion(u8"Введите чит-код, который будет ставить а/с Воздушный Шар\n(По умолчанию BB (англ.))")
				 imgui.Separator()
				 end
				end
				if aut.v then
				 imgui.Checkbox("", ashar)
				 imgui.TextColored(imgui.ImVec4(1.0, 0.5, 0.0, 1.0), u8'Автосборка шара', imgui.SameLine())
				 imgui.SameLine()
				 imgui.TextQuestion(u8"Автосборка а/с Воздушный шар (Вам нужно только нажать ALT на шаре)")
				end
		imgui.EndChild()
		if imgui.Button(u8'Сохранить настройки',imgui.ImVec2(145,58)) then 
           saverconfig()		   
		end
		imgui.SetCursorPos(imgui.ImVec2(325, 82))
		imgui.BeginChild("##середина_верх_левый", imgui.ImVec2(178, 120), true, imgui.WindowFlags.NoScrollbar)
				imgui.Checkbox(u8"Заправить авто", fcar)
				imgui.SameLine()
				imgui.TextQuestion(u8"При сочетании клавиш KK вы заправите транспорт используя канистру (Только вне авто)")
				imgui.Checkbox(u8"Починить авто", recar)
				imgui.SameLine()
				imgui.TextQuestion(u8"При сочетании клавиш RR вы почините транспорт используя ремкомплект")
				imgui.Checkbox(u8"Ключи от авто", key)
				imgui.SameLine()
				imgui.TextQuestion(u8"При нажатии на кнопку K вы вставите/заберете ключи (Только внутри авто)")
	  	imgui.EndChild()
        imgui.SetCursorPos(imgui.ImVec2(512, 82))
		imgui.BeginChild("##середина_верх_правый", imgui.ImVec2(178, 120), true, imgui.WindowFlags.NoScrollbar)
				imgui.Checkbox(u8"Скип диал. ЗЗ", zz)
				imgui.SameLine()
				imgui.TextQuestion(u8"Как только скрипт увидит диалог с текстом 'Запрещено дратся' - он его пропустит")
				imgui.Checkbox(u8"Cкип диал. пицца", pizza)
				imgui.SameLine()
				imgui.TextQuestion(u8"Как только скрипт увидит диалог с текстом 'Вы успешно положили пиццу' - он его пропустит")
				imgui.Checkbox(u8"Закрытие орг т/с", olock)
				imgui.SameLine()
				imgui.TextQuestion(u8"При сочитании клавиш OL вы откроете/закроете организационный транспорт")
	  	imgui.EndChild()
		imgui.SetCursorPos(imgui.ImVec2(700, 277))
		imgui.BeginChild("##правый_средний", imgui.ImVec2(365, 150), true, ImGuiWindowFlags_AlwaysVerticalScrollbar)
				imgui.Checkbox(u8"Переводить секунды в минуты в деморгане",dmg)
				imgui.SameLine()
				imgui.TextQuestion(u8"Вместо секунд теперь в деморгане будут показыватся минуты")
				imgui.Checkbox(u8"Спавн транспорта на клавишу",spawncara)
				imgui.SameLine()
				imgui.TextQuestion(u8"При нажатии колесика мыши будет спавнится авто в котором вы сидите (нужно иметь титан випку)")
				imgui.Checkbox(u8"Счетчик денег в налоговой",nalog)
		        imgui.SameLine()
		        imgui.TextQuestion(u8"Считает сколько вы получили уже денег работая в налоговой")
				imgui.Checkbox(u8"Налоговая без диалога", nalogi)
				imgui.SameLine()
				imgui.TextQuestion(u8"Данная функция заменяет диалог о получении чека за налоги сообщением в чат")
                imgui.NewLine()
				if aut.v then
				 imgui.NewLine()
				 imgui.PushStyleColor(imgui.Col.Header, imgui.ImVec4(1.00, 0.50, 0.00, 1.00))	
				 if imgui.CollapsingHeader(u8"Дополнительно:") then
				 imgui.Checkbox(u8"",aeda)
				 imgui.TextColored(imgui.ImVec4(1.0, 0.5, 0.0, 1.0), u8'Автоеда', imgui.SameLine())
				 imgui.SameLine()
				 imgui.TextQuestion(u8"При появлении надписи 'Вы голодны' автоматически съдает одну пачку чипсов.\nПримечание: Следите за кол-вом чипсов в инвентаре!")
		         end
				 imgui.PopStyleColor()
				end
		imgui.EndChild()
        imgui.SetCursorPos(imgui.ImVec2(700, 436))
        imgui.BeginChild("##правый_низ", imgui.ImVec2(365, 50), true, imgui.WindowFlags.NoScrollbar)
				imgui.Checkbox(u8"", aut)
				imgui.TextColored(imgui.ImVec4(1.0, 0.5, 0.0, 1.0), u8'Активация спорных функций', imgui.SameLine())
				imgui.SameLine()
				imgui.TextQuestion(u8"Включает функции, которые могут быть запрещены правилами вашего сервера.")
        imgui.EndChild()
		imgui.SetCursorPos(imgui.ImVec2(700, 495))
		    	if imgui.Button(u8"О Создателе", imgui.ImVec2(365,28)) then
		    		sampAddChatMessage(" ", -1)
					sampAddChatMessage("Создатель оригинального скрипта:", -1)
					sampAddChatMessage("Grey | vk.com/syeta_126r", -1)
					sampAddChatMessage("Версия от: "..version.."", -1)
				end
		imgui.SetCursorPos(imgui.ImVec2(170, 466))
		    	if imgui.Button(u8"Перезагрузить скрипт", imgui.ImVec2(145,58)) then
					sampAddChatMessage(" {01A0E9}[Rodina Helper] {ffffff}Введите повторно команду активации: {ff4747}/rhelp",-1)
		    		thisScript():reload()
				end
				
				--[Вызов функций новых интерфейсов]
				newinterface()
	    	    centerinterface()
				--
	imgui.End()
	end
end

function newinterface()
			imgui.SetCursorPos(imgui.ImVec2(700, 82))
			    imgui.BeginChild("##правый_верх_вкладки", imgui.ImVec2(365, 50), true, imgui.WindowFlags.NoScrollbar)
            		if imgui.ButtonActivated(tab2=="one", u8"Family Helper## Tab2 2", imgui.ImVec2(161, 25)) then tab2 = "one" end
				imgui.EndChild()
				imgui.PushStyleColor(imgui.Col.Border, imgui.ImVec4(0.28, 0.56, 1.00, 1.00))
				imgui.SetCursorPos(imgui.ImVec2(700, 116))
			    imgui.BeginChild("##правый_верх_окно", imgui.ImVec2(365, 151), true, ImGuiWindowFlags_AlwaysVerticalScrollbar)
				if tab2 == "one" then
					if imgui.CollapsingHeader(u8"Настройки для FAMILY Helper'a:", true, imgui.TreeNodeFlags.DefaultOpen) then
				 		imgui.Checkbox(u8"Запись имен принятых в текстовик", famnames)
                 		imgui.SameLine()
				 		imgui.TextQuestion(u8"После принятия игрока в семью его ник и время записываются в FamInvites.txt в папке moonloader")
	  	         		imgui.Checkbox(u8"Инвайт ближайшего игрока", invf)
				 		imgui.SameLine()
				 		imgui.TextQuestion(u8'При нажатии клавиш ALT + 3 вы предложите вступить в семью ближайшему игроку')
					end
				end
			    imgui.EndChild()
				imgui.PopStyleColor()
end

function centerinterface()
		    imgui.SetCursorPos(imgui.ImVec2(325, 210))
				imgui.BeginChild("##середина_центр_вкладки", imgui.ImVec2(365, 50), true, imgui.WindowFlags.NoScrollbar)
					if imgui.ButtonActivated(tab=="one", u8"Пиар## Tab 1", imgui.ImVec2(75, 25)) then tab = "one" end imgui.SameLine()
            		if imgui.ButtonActivated(tab=="two", u8"Ловля## Tab 2", imgui.ImVec2(75, 25)) then tab = "two" end imgui.SameLine()
					if imgui.ButtonActivated(tab=="three", u8"Биндер## Tab 4", imgui.ImVec2(75, 25)) then tab = "three" end
				imgui.EndChild()
		        imgui.PushStyleColor(imgui.Col.Border, imgui.ImVec4(0.28, 0.56, 1.00, 1.00))
	        imgui.SetCursorPos(imgui.ImVec2(325, 244))
	  	        imgui.BeginChild("##середина_центр_окно", imgui.ImVec2(365, 280), true, ImGuiWindowFlags_AlwaysVerticalScrollbar)
					if tab == "one" then			 
						if aut.v then
						    if not piarcheck.v then
			   				    imgui.SetCursorPos(imgui.ImVec2(64, 25))
			                    imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(1.00, 1.00, 1.00, 0.65))
			                        if imgui.Button(u8"Пиар ВЫКЛЮЧЕН## Unactive", imgui.ImVec2(233, 35)) then 
			                            piarbutton = "active" 
			                            piarcheck.v = true								
									end
			                    imgui.PopStyleColor()
							end	
			                if piarcheck.v then
			   					imgui.SetCursorPos(imgui.ImVec2(64, 25))
               					imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(1.00, 0.50, 0.00, 1.00))			  
			    					if imgui.Button(u8"Пиар ВКЛЮЧЕН## Active", imgui.ImVec2(233, 35)) then 
			      						piarbutton = "unactive"
				  						piarcheck.v = false
									end
			   					imgui.PopStyleColor()
			  				end
				            imgui.SameLine()
				            imgui.TextQuestion(u8"Включает пиар в /vr и /j чаты.")
							-- [Настройка автопиара]
							if piarcheck.v then
							    imgui.SetCursorPos(imgui.ImVec2(87, 65))
				                imgui.Text(u8"Активация автопиара: /piar")
                                imgui.SameLine()
				                imgui.TextQuestion(u8"Включает автоотправку сообщений с определенной задержкой")
								imgui.NewLine()
				                imgui.SliderInt(u8"Задержка (мс)", slider, 15000, 600000)
				                imgui.NewInputText(u8'Реклама #1', chatsms, 237, u8'Пример: /vr Куплю гараж', 1)
				                imgui.Text(u8"")
				                imgui.Checkbox(u8"Включить доп. пиар в любой чат", doppiar)
                                imgui.SameLine()
				                imgui.TextQuestion(u8'Задержка между сообщениями 6 секунд.')
				                imgui.NewInputText(u8'Реклама #2', famsms, 237, u8'Пример: /ad Продам гараж', 1)
				            else
				                imgui.SetCursorPos(imgui.ImVec2(47, 95))
								imgui.Text(u8"Включите пункт Пиар для открытия настроек")
				            end
				        else
				            imgui.TextColored(imgui.ImVec4(1.0, 0.5, 0.0, 1.0), u8'Включение пункта "Спорные функции"\nможет привести к нарушению\nправил вашего сервера.\nОзнакомьтесь с правилами перед использованием!', imgui.SameLine())
				        end
			 		elseif tab == "two" then
			   			imgui.Checkbox(u8"Таймер ловли",timer)
						imgui.SameLine()
						imgui.TextQuestion(u8"Пишет в чат капчу и время за сколько вы ввели")
							if aut.v then
				 				imgui.Checkbox(u8"", catchmenu)
				 				imgui.TextColored(imgui.ImVec4(1.0, 0.5, 0.0, 1.0), u8'Доп. меню ловца', imgui.SameLine())
				 				imgui.SameLine()
				 				imgui.TextQuestion(u8"Открывает настройки ловли авто")
				 					if catchmenu.v then
									  if imgui.CollapsingHeader(u8"Настройки ловли") then
				  						imgui.Checkbox(u8"Авто закрытие дверей авто", acd)
				  						imgui.SameLine()
				  						imgui.TextQuestion(u8"Как только скрипт увидит что вы словили авто по госсу он автоматически закроет двери авто")
				  						imgui.Checkbox(u8"Автоматический спавн кара",asc)
			    						imgui.SameLine()
			    						imgui.TextQuestion(u8"После того как вы словите кар, скрипт заспавнит его")
										imgui.Checkbox(u8"Сообщение после ловли", mbc)
				  						imgui.SameLine()
				 						imgui.TextQuestion(u8"Это сообщение отправится после ловли")
				  						imgui.InputText(u8"Сообщение", smsbc)
				  						imgui.Checkbox(u8"Авто тайм после ловли", at)
				  						imgui.SameLine()
				  						imgui.TextQuestion(u8"После удачной ловли скрипт сам пропишет /time с отыгровкой")
				 					  end
									else
				  						imgui.Text(u8"Включите пункт выше для открытия настроек")
				 					end
							end
					-- [Биндер интерфейс]
					elseif tab == "three" then
						imgui.Checkbox(u8"Включить биндер",binder)
		    			imgui.SameLine()
		    			imgui.TextQuestion(u8"Включает простейший биндер, который завязан на клавишах NumPad от 0 до 9.")
						if binder.v then
						    imgui.SameLine()
							imgui.TextWithQuestion(u8'Нажмите для смены раскладки на NumPad или Ctrl (Если у вас нет NumPad клавиш)\n*Примечание: (Ctrl+ -) Это нажатие клавиш Ctrl и клавиши - (минус)',u8'Смена пресета -')
					        imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.68, 0.30, 0.22, 0.50))
							imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.68, 0.30, 0.22, 0.30))
							imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.68, 0.30, 0.22, 0.40))
							if bindersetkey.v then
							    imgui.SetCursorPos(imgui.ImVec2(286, 16))
			    			    if imgui.Button(u8"Ctrl+ -## BUnactive", imgui.ImVec2(65, 23)) then 
			      				    bindersetkey.v = false 
			    			    end
			  			    elseif not bindersetkey.v then
							    imgui.SetCursorPos(imgui.ImVec2(286, 16))
			    			    if imgui.Button(u8"NumPad*## BActive", imgui.ImVec2(65, 23)) then 
			      				    bindersetkey.v = true
							    end
			  			    end
							imgui.PopStyleColor()
							imgui.PopStyleColor()
							imgui.PopStyleColor()
							imgui.PushStyleColor(imgui.Col.CheckMark, imgui.ImVec4(0.68, 0.30, 0.22, 1.00))
							imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.68, 0.30, 0.22, 0.80))
							imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.68, 0.30, 0.22, 0.90))
								if imgui.ButtonActivated(bindtab.v==1, u8"Пресет 1## BindTab_1", imgui.ImVec2(104, 25)) then 
					 				bindtab.v = 1
								end 
								imgui.SameLine()
            					if imgui.ButtonActivated(bindtab.v==2, u8"Пресет 2## BindTab_2", imgui.ImVec2(104, 25)) then 
									bindtab.v = 2 
								end 
								imgui.SameLine()
								if imgui.ButtonActivated(bindtab.v==3, u8"Пресет 3## BindTab_3", imgui.ImVec2(104, 25)) then 
					 				bindtab.v = 3 
								end
							imgui.PopStyleColor()
							imgui.PopStyleColor()
							imgui.PopStyleColor()
							imgui.SetCursorPos(imgui.ImVec2(7, 67))
							imgui.PushStyleColor(imgui.Col.Border, imgui.ImVec4(0.68, 0.30, 0.22, 1.00))
							imgui.PushStyleColor(imgui.Col.ChildWindowBg, imgui.ImVec4(0.14, 0.17, 0.21, 1.00))
				 			imgui.BeginChild("##середина_центр_окно_биндер", imgui.ImVec2(351, 206), true, ImGuiWindowFlags_AlwaysVerticalScrollbar)
				 			if bindtab.v == 1 then
					 				binderset1.v = true
				     				binderset2.v = false
				     				binderset3.v = false 							
				   					imgui.NewInputText(''..KeyB[1], bindt1, 245, u8'Текст бинда', 1)
				      				imgui.NewInputText(''..KeyB[2], bindt2, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[3], bindt3, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[4], bindt4, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[5], bindt5, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[6], bindt6, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[7], bindt7, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[8], bindt8, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[9], bindt9, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[10], bindt10, 245, u8'Текст бинда', 1)				    			
				   			elseif bindtab.v == 2 then
									binderset1.v = false
				    				binderset2.v = true
				    				binderset3.v = false 							
				     				imgui.NewInputText(''..KeyB[1], bindt11, 245, u8'Текст бинда', 1)
				    				imgui.NewInputText(''..KeyB[2], bindt12, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[3], bindt13, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[4], bindt14, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[5], bindt15, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[6], bindt16, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[7], bindt17, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[8], bindt18, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[9], bindt19, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[10], bindt20, 245, u8'Текст бинда', 1)				    			
				   			elseif bindtab.v == 3 then
					 				binderset1.v = false
				     				binderset2.v = false
				     				binderset3.v = true 							
				     				imgui.NewInputText(''..KeyB[1], bindt21, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[2], bindt22, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[3], bindt23, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[4], bindt24, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[5], bindt25, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[6], bindt26, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[7], bindt27, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[8], bindt28, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[9], bindt29, 245, u8'Текст бинда', 1)
				     				imgui.NewInputText(''..KeyB[10], bindt30, 245, u8'Текст бинда', 1)				    			
				   			end
							imgui.EndChild()
				        imgui.PopStyleColor() 
						imgui.PopStyleColor() 
						end
                    end					
		        imgui.EndChild()
		        imgui.PopStyleColor()   		
end

-- [Функция сохранения]
function saverconfigNew() -- Сюда новые переменные
				mainIni.config.ashar = ashar.v
				mainIni.config.shar = shar.v
				mainIni.config.sharkey = sharkey.v
				mainIni.config.piarcheck = piarcheck.v
				mainIni.config.catchmenu = catchmenu.v
				mainIni.config.checked_radio = checked_radio.v
				mainIni.config.smsvippr = smsvippr.v
				mainIni.config.bindt11 = bindt11.v
				mainIni.config.bindt12 = bindt12.v
				mainIni.config.bindt13 = bindt13.v
				mainIni.config.bindt14 = bindt14.v
				mainIni.config.bindt15 = bindt15.v
				mainIni.config.bindt16 = bindt16.v
				mainIni.config.bindt17 = bindt17.v
				mainIni.config.bindt18 = bindt18.v
				mainIni.config.bindt19 = bindt19.v
				mainIni.config.bindt20 = bindt20.v
				mainIni.config.bindt21 = bindt21.v
				mainIni.config.bindt22 = bindt22.v
				mainIni.config.bindt23 = bindt23.v
				mainIni.config.bindt24 = bindt24.v
				mainIni.config.bindt25 = bindt25.v
				mainIni.config.bindt26 = bindt26.v
				mainIni.config.bindt27 = bindt27.v
				mainIni.config.bindt28 = bindt28.v
				mainIni.config.bindt29 = bindt29.v
				mainIni.config.bindt30 = bindt30.v
				mainIni.config.binderset1 = binderset1.v
				mainIni.config.binderset2 = binderset2.v
				mainIni.config.binderset3 = binderset3.v
				mainIni.config.bindersetkey = bindersetkey.v
				mainIni.config.bindtab = bindtab.v
				mainIni.config.toch = toch.v
				mainIni.config.infotextb = infotextb.v
end

function saverconfig() -- Переполнены Upvalues!!!
		   saverconfigNew() -- Загрузка новых переменных
                mainIni.config.lic = lic.v
				mainIni.config.trade = trade.v
				mainIni.config.tlf = tlf.v
				mainIni.config.arm = arm.v
				mainIni.config.msk = msk.v
				mainIni.config.med = med.v
				mainIni.config.smk = smk.v
				mainIni.config.nalogi = nalogi.v
				mainIni.config.cctime = cctime.v
				mainIni.config.spawncara = spawncara.v
				mainIni.config.lock = lock.v
				mainIni.config.fcar = fcar.v
				mainIni.config.recar = recar.v
				mainIni.config.key = key.v
				mainIni.config.aut = aut.v
				mainIni.config.abc = abc.v
				mainIni.config.acd = acd.v
				mainIni.config.nalog = nalog.v
				mainIni.config.dmg = dmg.v
				mainIni.config.asc = asc.v
				mainIni.config.mbc = mbc.v
				mainIni.config.timer = timer.v
				mainIni.config.at = at.v
				mainIni.config.smsbc = smsbc.v
				mainIni.config.chatsms = chatsms.v
				mainIni.config.rtsms = rtsms.v
				mainIni.config.famsms = famsms.v
				mainIni.config.zz = zz.v
				mainIni.config.famnames = famnames.v
				mainIni.config.flood = flood.v
				mainIni.config.olock = olock.v
				mainIni.config.pizza = pizza.v
				mainIni.config.vip = vip.v
				mainIni.config.smsvip = smsvip.v
				mainIni.config.chasi = chasi.v
				mainIni.config.drugs = drugs.v
				mainIni.config.doppiar = doppiar.v
				mainIni.config.binder = binder.v
				mainIni.config.bindt1 = bindt1.v
				mainIni.config.bindt2 = bindt2.v
				mainIni.config.bindt3 = bindt3.v
				mainIni.config.bindt4 = bindt4.v
				mainIni.config.bindt5 = bindt5.v
				mainIni.config.bindt6 = bindt6.v
				mainIni.config.bindt7 = bindt7.v
				mainIni.config.bindt8 = bindt8.v
				mainIni.config.bindt9 = bindt9.v
				mainIni.config.bindt10 = bindt10.v
				mainIni.config.aeda = aeda.v
				mainIni.config.invf = invf.v
				mainIni.config.tkey = tkey.v
				mainIni.config.armkey = armkey.v
				mainIni.config.maskkey = maskkey.v
				mainIni.config.medkey = medkey.v
				if inicfg.save(mainIni, 'Rodina Helper.ini') then
				 sampAddChatMessage("{01A0E9}[Rodina Helper] {56d93f} Настройки успешно сохранены!", -1)
				end
end
			
function main()
	while not isSampAvailable() do wait(0) end
	sampRegisterChatCommand("piar", function()
    if piarcheck.v then	
	act = not act; sampAddChatMessage(act and '{01A0E9}Реклама включена!' or '{01A0E9}Реклама выключена!', -1)
	    if act then
	      piar()
        end
	end
	end)
	
	sampRegisterChatCommand("rhelp", function()
      main_window_state.v = not main_window_state.v
    end)
	
	sampRegisterChatCommand('med', function(num) 
		sampSendChat('/usemed '..num) 
	end)
    
	sampRegisterChatCommand('setbpos', infotext)
	
	sampRegisterChatCommand('h', function(num) 
		sampSendChat('/house '..num) 
	end)
    
	sampRegisterChatCommand('fm', function(num) 
		sampSendChat('/fammenu '..num) 
	end)
	
	sampRegisterChatCommand('arm', function(num) 
		sampSendChat('/armour '..num) 
	end)
	
	sampAddChatMessage(" {01A0E9}[Rodina Helper] {ffffff}- Загружен! Версия {6495ED}от " ..version.. " ",-1)
	
	sampRegisterChatCommand('calc', function(arg) 
    if #arg > 0 then 
        local k = calc(arg)
        if k then 
            sampAddChatMessage('{01A0E9}[Rodina Helper] {ff981a}Решенный пример: ' ..arg.. ' = ' .. k,0x6495ED)  
        end 
            else sampAddChatMessage("{01A0E9}[Rodina Helper] {ff981a}Введите пример который нужно решить" , 0x6495ED)
        end
    end)

  while true do
	  wait(0)
	  imgui.Process = main_window_state.v
	  
	  --[Активация кода биндера]
	  bindermain_pc()
      bindermain_notebook()
	  --
	  if infotextb.v then
	  infotext()
      end
	    --[Лицензии]
		if lic.v and wasKeyPressed(0x31) and isKeyDown(0x12) then 
			local veh, ped = storeClosestEntities(PLAYER_PED)
			local _, id = sampGetPlayerIdByCharHandle(ped)
			if id then
			        if id == -1 then sampAddChatMessage('[Ошибка] Рядом никого нет!', 0x6495ED) else
					   sampSendChat('/showskill '..id)
					end
			end
		end
		

		
		--[Трейд]
		if trade.v and wasKeyPressed(0x32) and isKeyDown(0x12) then
			local veh, ped = storeClosestEntities(PLAYER_PED)
			local _, id = sampGetPlayerIdByCharHandle(ped)
			if id then
			        if id == -1 then sampAddChatMessage('[Ошибка] Рядом никого нет!', 0x6495ED) else
					   sampSendChat('/trade '..id)
					end
			end
		end

		--[Инвайт в фаму]
		if invf.v and wasKeyPressed(0x33) and isKeyDown(0x12) then
			local veh, ped = storeClosestEntities(PLAYER_PED)
			local _, id = sampGetPlayerIdByCharHandle(ped)
			if id then
			        if id == -1 then sampAddChatMessage('[Ошибка] Рядом никого нет!', 0x6495ED) else
					   sampSendChat('/faminvite '..id)
					end
			end
		end
		
		if arm.v then
			if testCheat(armkey.v) and not sampIsChatInputActive() and not isKeyDown(0x11) then
				sampSendChat("/armour")
			end
		end
		if spawncara.v then
			if wasKeyPressed(4) then
              if not isCharOnFoot(playerPed) then
                 car = storeCarCharIsInNoSave(playerPed)
                 _, id = sampGetVehicleIdByCarHandle(car)
                 sampSendChat('/fixmycar '..id)
				end
			end
       end
		if smk.v then
			if testCheat("smk") and not sampIsCursorActive() then
				sampSendChat("/smoke")
			end
		end
		if msk.v then
			if testCheat(maskkey.v) and not sampIsCursorActive() and not isKeyDown(0x11) then
				sampSendChat("/mask")
			end
		end
		if med.v then
			if testCheat(medkey.v) and not sampIsCursorActive() and not isKeyDown(0x11) then
				sampSendChat("/usemed")
			end
		end
		if timer.v then
			if sampIsDialogActive() and (sampGetCurrentDialogId() == 8869 or sampGetCurrentDialogId() == 8868) then
			ttime = os.clock()
			while sampIsDialogActive() do
				wait(0)
			end
			sampAddChatMessage(string.format("{01A0E9}[Rodina Helper] {ffffff}Капча {ff981a}[%s]{ffffff} ввел за {ff981a}[%s]{ffffff} секунд",sampGetCurrentDialogEditboxText(), string.sub(os.clock() - ttime, 1, 5)), 16777215)
			end
		end
		if cctime.v then
			if testCheat(tkey.v) and not sampIsCursorActive() then				
				sampSendChat ("/time")
				wait(1000)
				if chasi.v=="" then else
				 sampSendChat(u8:decode(chasi.v))
				end
				wait(1800)
				sampSendChat ("/do На экране часов  "..os.date('%H:%M:%S'))
			end 
		end
		if olock.v and not sampIsCursorActive() then
			if testCheat("ol") then
				sampSendChat("/olock")
			end
		end
		if lock.v and not sampIsChatInputActive() then
			if testCheat("l") then
				sampSendChat("/lock")
			end
		end
		if drugs.v and not sampIsCursorActive() then
			if wasKeyPressed(0x61) and isKeyDown(0x12) then
                sampSendChat("/usedrugs 1")
            end
            if wasKeyPressed(0x62) and isKeyDown(0x12) then
                sampSendChat("/usedrugs 2")
            end
            if wasKeyPressed(0x63) and isKeyDown(0x12) then
                sampSendChat("/usedrugs 3")
			end
		end
		if fcar.v and not sampIsCursorActive() and isCharOnFoot(playerPed) then
			if testCheat("kk") then
				sampSendChat("/fillcar")
			end
		end
		if recar.v and not sampIsCursorActive() then
			if testCheat("rr") then
				sampSendChat("/repcar")
			end
		end
		if key.v and not sampIsCursorActive() and not isCharOnFoot(playerPed) then
			if testCheat("k") then
				sampSendChat("/key")
			end
		end
		if shar.v then
			if testCheat(sharkey.v) and isCharOnFoot(playerPed) and not sampIsCursorActive() then
				sampSendChat("/balloon")
			end 
		end
		if ashar.v then -- [Автошар] 
         textdt = sampTextdrawGetString(2067)		
		  if sampTextdrawIsExists(2067) and textdt == "~w~PRESSED [ ~p~LALT~w~ ]" or textdt == "~w~PRESSED [ ~p~SPACE~w~ ]" or textdt == "~w~PRESSED [ ~p~H~w~ ]" and not sampIsCursorActive() then 
		    wait(1) 
		    autoshar() 
		  end
		end 
		if ashar.v then -- [Автошар2] 
         textdt2 = sampTextdrawGetString(2069)		
		  if sampTextdrawIsExists(2069) and textdt2 == "~w~PRESSED [ ~p~LALT~w~ ]" or textdt2 == "~w~PRESSED [ ~p~SPACE~w~ ]" or textdt2 == "~w~PRESSED [ ~p~H~w~ ]" and not sampIsCursorActive() then 
		    wait(1) 
		    autoshar()		
		  end
		end 
    end
end	

-- [Биндер]
function bindermain_pc()
    if not bindersetkey.v then
		if binder.v and binderset1.v and not isKeyDown(0x12) then
		    if isKeyJustPressed(VK_NUMPAD0) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt1.v))
			end

            if isKeyJustPressed(VK_NUMPAD1) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt2.v))
			end

            if isKeyJustPressed(VK_NUMPAD2) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt3.v)) 
			end
	
            if isKeyJustPressed(VK_NUMPAD3) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt4.v)) 
			end

            if isKeyJustPressed(VK_NUMPAD4) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt5.v))
			end

            if isKeyJustPressed(VK_NUMPAD5) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt6.v)) 
			end

            if isKeyJustPressed(VK_NUMPAD6) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt7.v)) 
			end

            if isKeyJustPressed(VK_NUMPAD7) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt8.v))
			end

            if isKeyJustPressed(VK_NUMPAD8) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt9.v)) 
			end

            if isKeyJustPressed(VK_NUMPAD9) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt10.v))
			end
			
		elseif binder.v and binderset2.v and not isKeyDown(0x12) then
		    if isKeyJustPressed(VK_NUMPAD0) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt11.v))
			end

            if isKeyJustPressed(VK_NUMPAD1) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt12.v))
			end

            if isKeyJustPressed(VK_NUMPAD2) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt13.v)) 
			end
	
            if isKeyJustPressed(VK_NUMPAD3) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt14.v)) 
			end

            if isKeyJustPressed(VK_NUMPAD4) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt15.v))
			end

            if isKeyJustPressed(VK_NUMPAD5) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt16.v)) 
			end

            if isKeyJustPressed(VK_NUMPAD6) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt17.v)) 
			end

            if isKeyJustPressed(VK_NUMPAD7) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt18.v))
			end

            if isKeyJustPressed(VK_NUMPAD8) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt19.v)) 
			end

            if isKeyJustPressed(VK_NUMPAD9) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt20.v))
			end
			
	    elseif binder.v and binderset3.v and not isKeyDown(0x12) then
			if isKeyJustPressed(VK_NUMPAD0) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt21.v))
			end

            if isKeyJustPressed(VK_NUMPAD1) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt22.v))
			end

            if isKeyJustPressed(VK_NUMPAD2) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt23.v)) 
			end
	
            if isKeyJustPressed(VK_NUMPAD3) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt24.v)) 
			end

            if isKeyJustPressed(VK_NUMPAD4) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt25.v))
			end

            if isKeyJustPressed(VK_NUMPAD5) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt26.v)) 
			end

            if isKeyJustPressed(VK_NUMPAD6) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt27.v)) 
			end

            if isKeyJustPressed(VK_NUMPAD7) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt28.v))
			end

            if isKeyJustPressed(VK_NUMPAD8) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt29.v)) 
			end

            if isKeyJustPressed(VK_NUMPAD9) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt30.v))
			end
		end	
	end	
	
		--[Смена пресета биндера]
		if binder.v then
		   if bindersetkey.v then
           	if wasKeyPressed(0xBD) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			    bindtab.v = bindtab.v+1
				if bindtab.v > 3 then bindtab.v = 1 end	
				if bindtab.v == 1 then
					binderset1.v = true
				    binderset2.v = false
				    binderset3.v = false
                elseif bindtab.v == 2 then
					binderset1.v = false
				    binderset2.v = true
				    binderset3.v = false 
                elseif bindtab.v == 3 then
					binderset1.v = false
				    binderset2.v = false
				    binderset3.v = true 
                end					
                sampAddChatMessage(' {01A0E9}[Rodina Helper {ff981a}(BINDER){01A0E9}] {56d93f} Установлен пресет #'..bindtab.v..'', -1)						
			end
           else			
			if isKeyJustPressed(VK_MULTIPLY) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			    bindtab.v = bindtab.v+1
				if bindtab.v > 3 then bindtab.v = 1 end	
				if bindtab.v == 1 then
					binderset1.v = true
				    binderset2.v = false
				    binderset3.v = false
                elseif bindtab.v == 2 then
					binderset1.v = false
				    binderset2.v = true
				    binderset3.v = false 
                elseif bindtab.v == 3 then
					binderset1.v = false
				    binderset2.v = false
				    binderset3.v = true 
                end
                sampAddChatMessage(' {01A0E9}[Rodina Helper {ff981a}(BINDER){01A0E9}] {56d93f} Установлен пресет #'..bindtab.v..'', -1)						
			end
		   end
		end
        
		--[Смена раскладки биндера]
		if bindersetkey.v then
		    KeyB = {"Ctrl+1",
		        "Ctrl+2",
		        "Ctrl+3",
		        "Ctrl+4",
		        "Ctrl+5",
		        "Ctrl+6",
		        "Ctrl+7",
		        "Ctrl+8",
		        "Ctrl+9",
		        "Ctrl+0",
        	}		
		else
		    KeyB = {"NumPad0",
			    "NumPad1",
			    "NumPad2",
			    "NumPad3",
			    "NumPad4",
			    "NumPad5",
			    "NumPad6",
			    "NumPad7",
			    "NumPad8",
			    "NumPad9",
            }				
		end
end

function bindermain_notebook()
    if bindersetkey.v then
		if binder.v and binderset1.v and not isKeyDown(0x12) then
		    if wasKeyPressed(0x31) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt1.v))
			end

            if wasKeyPressed(0x32) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt2.v))
			end

            if wasKeyPressed(0x33) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt3.v)) 
			end
	
            if wasKeyPressed(0x34) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt4.v)) 
			end

            if wasKeyPressed(0x35) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt5.v))
			end

            if wasKeyPressed(0x36) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt6.v)) 
			end

            if wasKeyPressed(0x37) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt7.v)) 
			end

            if wasKeyPressed(0x38) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt8.v))
			end

            if wasKeyPressed(0x39) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt9.v)) 
			end

            if wasKeyPressed(0x30) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt10.v))
			end
			
		elseif binder.v and binderset2.v and not isKeyDown(0x12) then
		    if wasKeyPressed(0x31) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt11.v))
			end

            if wasKeyPressed(0x32) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt12.v))
			end

            if wasKeyPressed(0x33) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt13.v)) 
			end
	
            if wasKeyPressed(0x34) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt14.v)) 
			end

            if wasKeyPressed(0x35) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt15.v))
			end

            if wasKeyPressed(0x36) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt16.v)) 
			end

            if wasKeyPressed(0x37) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt17.v)) 
			end

            if wasKeyPressed(0x38) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt18.v))
			end

            if wasKeyPressed(0x39) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt19.v)) 
			end

            if wasKeyPressed(0x30) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt20.v))
			end
			
	    elseif binder.v and binderset3.v and not isKeyDown(0x12) then
			if wasKeyPressed(0x31) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt21.v))
			end

            if wasKeyPressed(0x32) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt22.v))
			end

            if wasKeyPressed(0x33) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt23.v)) 
			end
	
            if wasKeyPressed(0x34) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt24.v)) 
			end

            if wasKeyPressed(0x35) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt25.v))
			end

            if wasKeyPressed(0x36) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt26.v)) 
			end

            if wasKeyPressed(0x37) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt27.v)) 
			end

            if wasKeyPressed(0x38) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt28.v))
			end

            if wasKeyPressed(0x39) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt29.v)) 
			end

            if wasKeyPressed(0x30) and isKeyDown(0x11) and not sampIsChatInputActive() and not sampIsDialogActive() and not isPauseMenuActive() and not isSampfuncsConsoleActive() then 
			sampSendChat(u8:decode(bindt30.v))
			end
		end	
    end
end

-- [Семья]
function hook.onServerMessage(color, text)
	    if famnames.v then 
		    if text:find('(.+)(%d+)] принял ваше предложение вступить в семью!') then
			    lua_thread.create(function()
				  idf = text:match('%d+')
				   wait(100)
				    if sampIsPlayerConnected(tonumber(idf)) then
		              local famfile = io.open('moonloader/FamInvites.txt',"a")
		              famfile:write(''..sampGetPlayerNickname(idf)..' | Уровень: '..sampGetPlayerScore(idf)..' | '..os.date('%c')..'\n')
		              famfile:close()
		              sampAddChatMessage('{F2A1EE}[RRP Fam Helper] {ffffff}'..sampGetPlayerNickname(idf)..' {ffff00}('..sampGetPlayerScore(idf)..' lvl) {42b201}Был добавлен в ваш список!', -1)			
				    end		
				end)	
		    end				
		end		
	if nalogi.v then
		if text:find("за проделанную работу") and not text:find('говорит') and not text:find('- |') and not text:find('Тел.') and not text:find('News') then
		   nalogovaya = nalogovaya + 20000
		   sampAddChatMessage("{73b461}[Информация] {ffffff}Вы заработали уже {73b461}"..nalogovaya..'$',-1)
		   return false
		end
	end
    if acd.v then
     if text:find("Поздравляем! Теперь этот транспорт принадлежит вам!") and not text:find('говорит') and not text:find('- |') and not text:find(': ') then
			sampSendChat('/lock')
	  end
	end
	if asc.v then
		if text:find("Поздравляем! Теперь этот транспорт принадлежит вам!") and not text:find('говорит') and not text:find('- |') and not text:find(': ') then
			lua_thread.create(function()
              if not isCharOnFoot(playerPed) then
                 car = storeCarCharIsInNoSave(playerPed)
                 _, id = sampGetVehicleIdByCarHandle(car)
                 sampSendChat('/fixmycar '..id)
				 sampAddChatMessage("{01A0E9}[Rodina Helper]{ffffff}- Вы успешно заспавнили свой автомобиль!",-1)
			  end
		  end)
		end
	end  
	if mbc.v then
		if text:find("Поздравляем! Теперь этот транспорт принадлежит вам!") or text:find("(.-)Поздравляю! Теперь этот дом ваш!(.-)") and not text:find('говорит') and not text:find('- |') and not text:find(': ') and not text:find('[VIP]') and not text:find('[PREMIUM]') then
			lua_thread.create(function()
				wait(500)
				sampSendChat(u8:decode(smsbc.v))
			end)
		end
	end
	if at.v then
		if text:find("Поздравляем! Теперь этот транспорт принадлежит вам!") or text:find("(.-)Поздравляю! Теперь этот дом ваш!(.-)") and not text:find('говорит') and not text:find('- |') and not text:find(': ') and not text:find('[VIP]') and not text:find('[PREMIUM]') then
			lua_thread.create(function()
				if mbc.v then
					wait(5000)
				end
				sampSendChat(u8:decode(chasi.v))
				sampSendChat("/time")
				wait(1200)
				sampSendChat ("/do На часах  "..os.date('%H:%M:%S'))
			end)
		end
	end
	if vip.v then
		if text:find 'Игрок (.-) приобрел Titan VIP' and not text:find('говорит') and not text:find('- |') then
			sampSendChat(u8:decode(smsvip.v))
		end
		if text:find 'Игрок (.-) приобрел PREMIUM VIP' and not text:find('говорит') and not text:find('- |') then
			sampSendChat(u8:decode(smsvippr.v))
		end
	end
	if flood.v then
		if text:find("~~~~~~~~~~~~~~~~~~~~~~~~~~") and not text:find('говорит') then
			return false
		end
		if text:find("- Основные команды") and not text:find('говорит') then
			return false
		end
		if text:find("- Пригласи друга") and not text:find('говорит') then
			return false
		end
		if text:find("- Донат и получение") and not text:find('говорит') then
			return false
		end
		if text:find("выехал") and not text:find('говорит') then
			return false
		end
		if text:find("убив его") and not text:find('говорит') then
			return false
		end
		if text:find("начал работу") and not text:find('говорит') then
			return false
		end
		if text:find("Убив его") and not text:find('говорит') then
			return false
		end
		if text:find("между использованием") and not text:find('говорит') then
			return false
		end
		if text:find("обновлениях сервера") and not text:find('говорит') then
			return false
		end
		if text:find("Пополнение игрового счета") and not text:find('говорит') then
			return false
		end
		if text:find("Наш сайт") and not text:find('говорит') then
			return false
		end
	end	
	if checking then 
		local getname = text:match('^%[VIP%]: (.+)%[%d+%].+уровень')
		if getname then
			table.insert(tVips, getname) 
			return false 
		end
	end
	if text:find('Всего: %d+ человек') then 
		checking = false
		return false
	end
	
end

-- [Автошар]
function autoshar()
    if ashar.v and sampTextdrawIsExists(2066) or sampTextdrawIsExists(2069) and not sampIsCursorActive() then
      wait(0)
            gkey.player(9)
			gkey.player(21)
            gkey.player(16)	        
    end		
end

function gkey.player(keyid)
    setGameKeyState(keyid, 2550)
end

--[Инфо о текущем бинд пресете]
		
function infotext(checkpos)
    lua_thread.create(function()
	        while not finished do
			    if checkpos then
	                posX, posY = getCursorPos()
	                sampAddChatMessage("Новая позиция установлена! X:" .. posX .." Y:".. posY, 0xffffff)
	                mainIni.config.textposX = posX
	                mainIni.config.textposY = posY
	                inicfg.save(mainIni, 'Rodina Helper.ini')
					checkpos = false
			    end			
				if sampGetGamestate() ~= 3 or not sampIsLocalPlayerSpawned() then
					finished = true; break
				end
				if infotextb.v then
					renderDrawBox(posX, posY, 140, 20, 0xFF0090FF)
                     renderDrawPolygon(posX, posY + 7, 15, 15, 16, 0, 0xFF0090FF)
					 renderDrawPolygon(posX, posY + 12, 15, 15, 16, 0, 0xFF0090FF)
					 renderDrawPolygon(posX + 140, posY + 7, 15, 15, 16, 0, 0xFF0090FF)
					 renderDrawPolygon(posX + 140, posY + 12, 15, 15, 16, 0, 0xFF0090FF)
		            renderFontDrawText(font, "Пресет биндера №"..bindtab.v, posX + 5, posY + 1, -1)
		        break
				end
		        wait(0)
			end
	end)
finished = false
end

-- [Автоеда]
function hook.onDisplayGameText(style, time, text)
	if dmg.v then
	    if style == 3 and time == 1000 and text:find("~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~Jailed %d+ Sec%.") then
		  local c, _ = math.modf(tonumber(text:match("Jailed (%d+)")) / 60)
		  return {style, time, string.format("~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~Jailed %s Sec = %s Min.", text:match("Jailed (%d+)"), c)}
		end
	end
	if aeda.v then
	    if text:find("Вы голодны!") or text:find('Вы очень голодны!') then
		sampSendChat('/eat')
		end
	end
end

-- [Скип диалогов]
function hook.onShowDialog(dialogId, dialogStyle, dialogTitle, okButtonText, cancelButtonText, dialogText)
    if zz.v then
	    if dialogText:find("В этом месте запрещено") then
			return false
		end
	end
	if pizza.v then	
	    if dialogText:find("Вы успешно положили") then
			return false
		end
	end
	if tlf.v then
	   if dialogId == 1000 then
		   sampSendDialogResponse(1000,1,0,"")
		   return false
		end
	end
	if nalogi.v then
		if dialogText:find("чек на оплату") then
			sampAddChatMessage("{01A0E9}Вы оставили чек на оплату налогов",-1)
			return false
		end
		if dialogText:find("для выдачи счета") then
			return false
		end
	end
	
end

-- [Автопиар]
function piar()
	lua_thread.create(function()
		if act and doppiar.v then
		  sampSendChat(u8:decode(chatsms.v))
		  wait(6200)
	      sampSendChat(u8:decode(famsms.v))
          wait(slider.v)
		  return true
		end
		if act and not doppiar.v then
		  sampSendChat(u8:decode(chatsms.v))
		  wait(slider.v)
		  return true
		end
	end)
end


-- [Калькулятор]
function calc(m) 
    local func = load('return '..tostring(m)) 
    local a = select(2, pcall(func)) 
    return type(a) == 'number' and a
end

-- [Интерфейс]
function apply_custom_style()
	if not state then
  	imgui.SwitchContext()
  	local style = imgui.GetStyle()
   	local colors = style.Colors
   	local clr = imgui.Col
   	local ImVec4 = imgui.ImVec4
   	local ImVec2 = imgui.ImVec2
	style.WindowPadding = ImVec2(15, 15)
    style.WindowRounding = 15.0
    style.FramePadding = ImVec2(5, 5)
    style.ItemSpacing = ImVec2(12, 8)
    style.ItemInnerSpacing = ImVec2(8, 6)
    style.IndentSpacing = 25.0
    style.ScrollbarSize = 15.0
    style.ScrollbarRounding = 15.0
    style.GrabMinSize = 15.0
    style.GrabRounding = 7.0
    style.ChildWindowRounding = 8.0
    style.FrameRounding = 6.0
	  colors[clr.Text] = ImVec4(0.95, 0.96, 0.98, 1.00)
      colors[clr.TextDisabled] = ImVec4(0.36, 0.42, 0.47, 1.00)
      colors[clr.WindowBg] = ImVec4(0.11, 0.15, 0.17, 1.00)
      colors[clr.ChildWindowBg] = ImVec4(0.15, 0.18, 0.22, 1.00)
      colors[clr.PopupBg] = ImVec4(0.08, 0.08, 0.08, 0.94)
      colors[clr.Border] = ImVec4(0.43, 0.43, 0.50, 0.50)
      colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
      colors[clr.FrameBg] = ImVec4(0.20, 0.25, 0.29, 1.00)
      colors[clr.FrameBgHovered] = ImVec4(0.12, 0.20, 0.28, 1.00)
      colors[clr.FrameBgActive] = ImVec4(0.09, 0.12, 0.14, 1.00)
      colors[clr.TitleBg] = ImVec4(0.09, 0.12, 0.14, 0.65)
      colors[clr.TitleBgCollapsed] = ImVec4(0.00, 0.00, 0.00, 0.51)
      colors[clr.TitleBgActive] = ImVec4(0.08, 0.10, 0.12, 1.00)
      colors[clr.MenuBarBg] = ImVec4(0.15, 0.18, 0.22, 1.00)
      colors[clr.ScrollbarBg] = ImVec4(0.02, 0.02, 0.02, 0.39)
      colors[clr.ScrollbarGrab] = ImVec4(0.20, 0.25, 0.29, 1.00)
      colors[clr.ScrollbarGrabHovered] = ImVec4(0.18, 0.22, 0.25, 1.00)
      colors[clr.ScrollbarGrabActive] = ImVec4(0.09, 0.21, 0.31, 1.00)
      colors[clr.ComboBg] = ImVec4(0.20, 0.25, 0.29, 1.00)
      colors[clr.CheckMark] = ImVec4(0.28, 0.56, 1.00, 1.00)
      colors[clr.SliderGrab] = ImVec4(0.28, 0.56, 1.00, 1.00)
      colors[clr.SliderGrabActive] = ImVec4(0.37, 0.61, 1.00, 1.00)
      colors[clr.Button] = ImVec4(0.20, 0.25, 0.29, 1.00)
      colors[clr.ButtonHovered] = ImVec4(0.28, 0.56, 1.00, 1.00)
      colors[clr.ButtonActive] = ImVec4(0.06, 0.53, 0.98, 1.00)
      colors[clr.Header] = ImVec4(0.20, 0.25, 0.29, 0.55)
      colors[clr.HeaderHovered] = ImVec4(0.26, 0.59, 0.98, 0.80)
      colors[clr.HeaderActive] = ImVec4(0.26, 0.59, 0.98, 1.00)
      colors[clr.ResizeGrip] = ImVec4(0.26, 0.59, 0.98, 0.25)
      colors[clr.ResizeGripHovered] = ImVec4(0.26, 0.59, 0.98, 0.67)
      colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
      colors[clr.CloseButton] = ImVec4(1.00, 0.39, 0.38, 0.56)
      colors[clr.CloseButtonHovered] = ImVec4(1.00, 0.39, 0.38, 0.69)
      colors[clr.CloseButtonActive] = ImVec4(1.00, 0.39, 0.38, 1.00)
      colors[clr.PlotLines] = ImVec4(0.61, 0.61, 0.61, 1.00)
      colors[clr.PlotLinesHovered] = ImVec4(1.00, 0.43, 0.35, 1.00)
      colors[clr.PlotHistogram] = ImVec4(0.90, 0.70, 0.00, 1.00)
      colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
      colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
      colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)
	end
end
apply_custom_style()



function imgui.ButtonActivated(activated, ...)
    if activated then
        imgui.PushStyleColor(imgui.Col.Button, imgui.GetStyle().Colors[imgui.Col.CheckMark])
        imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.GetStyle().Colors[imgui.Col.CheckMark])
        imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.GetStyle().Colors[imgui.Col.CheckMark])

            imgui.Button(...)

        imgui.PopStyleColor()
        imgui.PopStyleColor()
        imgui.PopStyleColor()

    else
        return imgui.Button(...)
    end
end

function imgui.TextQuestion(text)
	imgui.TextDisabled('(?)')
	if imgui.IsItemHovered() then
		imgui.BeginTooltip()
		imgui.PushTextWrapPos(450)
		imgui.TextUnformatted(text)
		imgui.PopTextWrapPos()
		imgui.EndTooltip()
	end
end

function imgui.TextWithQuestion(text, ...)
	imgui.Text(...)
	if imgui.IsItemHovered() then
		imgui.BeginTooltip()
		imgui.PushTextWrapPos(450)
		imgui.TextUnformatted(text)
		imgui.PopTextWrapPos()
		imgui.EndTooltip()
	end
end

function imgui.ButtonWithQuestion(text, ...)
	imgui.Button(...)
	if imgui.IsItemHovered() then
		imgui.BeginTooltip()
		imgui.PushTextWrapPos(450)
		imgui.TextUnformatted(text)
		imgui.PopTextWrapPos()
		imgui.EndTooltip()
	end
end

function imgui.TextWithQuestionColored(text, ...)
	imgui.TextColored(...)
	if imgui.IsItemHovered() then
		imgui.BeginTooltip()
		imgui.PushTextWrapPos(450)
		imgui.TextUnformatted(text)
		imgui.PopTextWrapPos()
		imgui.EndTooltip()
	end
end

function imgui.NewInputText(lable, val, width, hint, hintpos)
    local hint = hint and hint or ''
    local hintpos = tonumber(hintpos) and tonumber(hintpos) or 1
    local cPos = imgui.GetCursorPos()
    imgui.PushItemWidth(width)
    local result = imgui.InputText(lable, val)
    if #val.v == 0 then
        local hintSize = imgui.CalcTextSize(hint)
        if hintpos == 2 then imgui.SameLine(cPos.x + (width - hintSize.x) / 2)
        elseif hintpos == 3 then imgui.SameLine(cPos.x + (width - hintSize.x - 5))
        else imgui.SameLine(cPos.x + 5) end
        imgui.TextColored(imgui.ImVec4(1.00, 1.00, 1.00, 0.40), tostring(hint))
    end
    imgui.PopItemWidth()
    return result
end

function update()
	sampAddChatMessage("Скрипт сделан для отдельных игроков Rodina RP",-1)
	sampAddChatMessage("За обновлением | vk.com/syeta_126r",-1)
end
