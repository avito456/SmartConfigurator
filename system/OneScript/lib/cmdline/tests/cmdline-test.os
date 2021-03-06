﻿#Использовать logos
#Использовать asserts

#Использовать ".."

Перем ПарсерКомаднойСтроки;
Перем КаталогИсходников;

Перем юТест;
Перем РаботаСТестами;
Перем Лог;

Перем СчетчикРекурсии;

Функция ПолучитьСписокТестов(Знач Тестирование) Экспорт

	юТест = Тестирование;
	
	СписокТестов = Новый Массив;
	
	СписокТестов.Добавить("ТестДолжен_ПолучитьПараметрИЗначение");
	СписокТестов.Добавить("ТестДолжен_ПолучитьНесколькихПараметровИЗначений");
	СписокТестов.Добавить("ТестДолжен_ПолучитьПараметрыКоманды");
	СписокТестов.Добавить("ТестДолжен_ВернутьСправкуПоПараметрам");
	СписокТестов.Добавить("ТестДолжен_ВернутьСправкуПоКоманде");
	СписокТестов.Добавить("ТестДолжен_ВернутьСправкуПоСпискуКоманд");
	СписокТестов.Добавить("ТестДолжен_ВернутьСправкуПоСпискуКомандСГлобальнымиПараметрами");
	СписокТестов.Добавить("ТестДолжен_ПолучитьПараметрыКомандыИДалееПозиционнныеПараметры");
	СписокТестов.Добавить("ТестДолжен_ПолучитьПараметрыКомандыИменованныйИлиПозиционныйПоВыбору");
	СписокТестов.Добавить("ТестДолжен_ПолучитьПараметрыКомандыИОтдельныйПараметрФлаг");
	СписокТестов.Добавить("ТестДолжен_ПроверитьКомандуСПараметромПоУмолчаниюИГлобальнымПараметромФлаг");
	СписокТестов.Добавить("ТестДолжен_ПроверитьМетод_ДобавитьПараметрФлаг");
	СписокТестов.Добавить("ТестДолжен_ПроверитьМетод_ДобавитьПараметрФлаг_КогдаПараметрФлагНеЗадан");
	СписокТестов.Добавить("ТестДолжен_ОбработатьНеизвестныйТокен");
	СписокТестов.Добавить("ТестДолжен_ПрочитатьПараметрКоллекцияВКонцеДляКоманды");
	СписокТестов.Добавить("ТестДолжен_ПрочитатьПараметрИменованнаяКоллекцияДляКоманды");
	СписокТестов.Добавить("ТестДолжен_ПрочитатьПараметрКоллекцияВКонце");

	Возврат СписокТестов;
	
КонецФункции

Процедура ПередЗапускомТеста() Экспорт
	
	ПарсерКомаднойСтроки = Новый ПарсерАргументовКоманднойСтроки;

	Лог = Логирование.ПолучитьЛог("oscript.lib.cmdline");
	Лог.УстановитьУровень(УровниЛога.Информация);
	
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
	
	ПарсерКомаднойСтроки = Неопределено;
	юТест.УдалитьВременныеФайлы();
	Лог = Неопределено;
КонецПроцедуры

Процедура ТестДолжен_ПолучитьПараметрИЗначение() Экспорт

	// строка запуска - oscript test.os Параметр Значение или oscript test.os "Параметр" "Значение"
	ВходнойМассивПараметров = Новый Массив;
	ВходнойМассивПараметров.Добавить("Параметр");
	ВходнойМассивПараметров.Добавить("Значение");
	
	ПарсерКомаднойСтроки.ДобавитьИменованныйПараметр("Параметр");

	Коллекция = ПарсерКомаднойСтроки.Разобрать(ВходнойМассивПараметров);

	Утверждения.ПроверитьРавенство(1, Коллекция.Количество());
	Утверждения.ПроверитьРавенство("Значение", Коллекция.Получить("Параметр"));
	Утверждения.ПроверитьРавенство("Значение", Коллекция["Параметр"]);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьМетод_ДобавитьПараметрФлаг() Экспорт

	// строка запуска - oscript test.os Параметр или oscript test.os "Параметр"
	ВходнойМассивПараметров = Новый Массив;
	ВходнойМассивПараметров.Добавить("Параметр");
	
	ПарсерКомаднойСтроки.ДобавитьПараметрФлаг("Параметр");

	Коллекция = ПарсерКомаднойСтроки.Разобрать(ВходнойМассивПараметров);

	Утверждения.ПроверитьРавенство(1, Коллекция.Количество());
	Утверждения.ПроверитьРавенство(Истина, Коллекция.Получить("Параметр"), "Параметр");
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьМетод_ДобавитьПараметрФлаг_КогдаПараметрФлагНеЗадан() Экспорт

	ВходнойМассивПараметров = Новый Массив;
	ВходнойМассивПараметров.Добавить("ДругойПараметр");
	ВходнойМассивПараметров.Добавить("Значение");
	
	ПарсерКомаднойСтроки.ДобавитьИменованныйПараметр("ДругойПараметр");
	ПарсерКомаднойСтроки.ДобавитьПараметрФлаг("Параметр");

	Коллекция = ПарсерКомаднойСтроки.Разобрать(ВходнойМассивПараметров);

	Утверждения.ПроверитьРавенство(2, Коллекция.Количество(), "Коллекция.Количество()");
	Утверждения.ПроверитьРавенство(Ложь, Коллекция.Получить("Параметр"), "Параметр");
	
	Утверждения.ПроверитьРавенство("Значение", Коллекция.Получить("ДругойПараметр"));
	Утверждения.ПроверитьРавенство("Значение", Коллекция["ДругойПараметр"]);
	
КонецПроцедуры

Процедура ТестДолжен_ПолучитьНесколькихПараметровИЗначений() Экспорт

	НаборПараметров = Новый Соответствие;
	НаборПараметров.Вставить("--Команда1", "Значение11");
	НаборПараметров.Вставить("Команда2", "Значение22");
	НаборПараметров.Вставить("-Команда3", "Значение31");
	
	ВходнойМассивПараметров = Новый Массив;
	Для Каждого КлючЗначение Из НаборПараметров Цикл
		ВходнойМассивПараметров.Добавить(КлючЗначение.Ключ);
		ВходнойМассивПараметров.Добавить(КлючЗначение.Значение);

		ПарсерКомаднойСтроки.ДобавитьИменованныйПараметр(КлючЗначение.Ключ);
	КонецЦикла;
	
	Коллекция = ПарсерКомаднойСтроки.Разобрать(ВходнойМассивПараметров);

	Утверждения.ПроверитьРавенство(НаборПараметров.Количество(), Коллекция.Количество());
	Для Каждого КлючЗначение Из НаборПараметров Цикл
		Утверждения.ПроверитьРавенство(КлючЗначение.Значение, Коллекция.Получить(КлючЗначение.Ключ));
		Утверждения.ПроверитьРавенство(КлючЗначение.Значение, Коллекция[КлючЗначение.Ключ]);
	КонецЦикла;
	
КонецПроцедуры

Процедура ТестДолжен_ПолучитьПараметрыКоманды() Экспорт
	
	ОписаниеКоманды = ПарсерКомаднойСтроки.ОписаниеКоманды("test");
	
	ПарсерКомаднойСтроки.ДобавитьПозиционныйПараметрКоманды(ОписаниеКоманды, "testpath");
	ПарсерКомаднойСтроки.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, "mode");
	ПарсерКомаднойСтроки.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, "output");
	ПарсерКомаднойСтроки.ДобавитьПараметрФлагКоманды(ОписаниеКоманды, "flag");
	ПарсерКомаднойСтроки.ДобавитьКоманду(ОписаниеКоманды);
	
	ВходнойМассивПараметров = Новый Массив;
	ВходнойМассивПараметров.Добавить("test");
	ВходнойМассивПараметров.Добавить("testpath-value");
	ВходнойМассивПараметров.Добавить("mode");
	ВходнойМассивПараметров.Добавить("1");
	ВходнойМассивПараметров.Добавить("output");
	ВходнойМассивПараметров.Добавить("2");
	ВходнойМассивПараметров.Добавить("flag");
	
	Результат = ПарсерКомаднойСтроки.РазобратьКоманду(ВходнойМассивПараметров);
	Утверждения.ПроверитьНеравенство(Неопределено, Результат, "Команда должна быть разобрана правильно");
	Утверждения.ПроверитьРавенство("test", Результат.Команда, "Команда");
	Утверждения.ПроверитьРавенство("testpath-value", Результат.ЗначенияПараметров["testpath"], "Значение позиционного параметра");

	Утверждения.ПроверитьРавенство("1", Результат.ЗначенияПараметров["mode"], "Именованный ключ mode");
	Утверждения.ПроверитьРавенство("2", Результат.ЗначенияПараметров["output"], "Именованный ключ output");
	Утверждения.ПроверитьРавенство(Истина, Результат.ЗначенияПараметров["flag"], "Флаг flag");
	Утверждения.ПроверитьРавенство(4, Результат.ЗначенияПараметров.Количество());
	
КонецПроцедуры

Процедура ТестДолжен_ПолучитьПараметрыКомандыИДалееПозиционнныеПараметры() Экспорт
	
	ОписаниеКоманды = ПарсерКомаднойСтроки.ОписаниеКоманды("add");
	
	ПарсерКомаднойСтроки.ДобавитьПозиционныйПараметрКоманды(ОписаниеКоманды, "testpath");
	ПарсерКомаднойСтроки.ДобавитьПозиционныйПараметрКоманды(ОписаниеКоманды, "dest");
	
	ПарсерКомаднойСтроки.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, "mode");
	ПарсерКомаднойСтроки.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, "verbose");

	ПарсерКомаднойСтроки.ДобавитьКоманду(ОписаниеКоманды);
	
	ВходнойМассивПараметров = Новый Массив;
	ВходнойМассивПараметров.Добавить("add");
	ВходнойМассивПараметров.Добавить("testpath-value");
	ВходнойМассивПараметров.Добавить("mode");
	ВходнойМассивПараметров.Добавить("on");
	ВходнойМассивПараметров.Добавить("verbose");
	ВходнойМассивПараметров.Добавить("2");
	ВходнойМассивПараметров.Добавить("dest-value");
	
	Результат = ПарсерКомаднойСтроки.РазобратьКоманду(ВходнойМассивПараметров);
	Утверждения.ПроверитьНеравенство(Неопределено, Результат, "Команда должна быть разобрана правильно");
	Утверждения.ПроверитьРавенство("add", Результат.Команда, "Команда");
	Утверждения.ПроверитьРавенство("testpath-value", Результат.ЗначенияПараметров["testpath"], "Значение позиционного параметра команды");
	Утверждения.ПроверитьРавенство("dest-value", Результат.ЗначенияПараметров["dest"], "Значение позиционного параметра команды");

	Утверждения.ПроверитьРавенство("on", Результат.ЗначенияПараметров["mode"], "Именованный ключ mode");
	Утверждения.ПроверитьРавенство("2", Результат.ЗначенияПараметров["verbose"], "Именованный ключ verbose");
	Утверждения.ПроверитьРавенство(4, Результат.ЗначенияПараметров.Количество());

КонецПроцедуры

Процедура ТестДолжен_ПолучитьПараметрыКомандыИменованныйИлиПозиционныйПоВыбору() Экспорт
	
	ОписаниеКоманды = ПарсерКомаднойСтроки.ОписаниеКоманды("add");
	
	ПарсерКомаднойСтроки.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, "-file");
	ПарсерКомаднойСтроки.ДобавитьПозиционныйПараметрКоманды(ОписаниеКоманды, "value");
	ПарсерКомаднойСтроки.ДобавитьКоманду(ОписаниеКоманды);
	
	ВходнойМассивПараметров = Новый Массив;
	ВходнойМассивПараметров.Добавить("add");
	ВходнойМассивПараметров.Добавить("-file");
	ВходнойМассивПараметров.Добавить("testpath-value");
	
	Результат = ПарсерКомаднойСтроки.РазобратьКоманду(ВходнойМассивПараметров);
	Утверждения.ПроверитьРавенство("testpath-value", Результат.ЗначенияПараметров["-file"]);
	Утверждения.ПроверитьРавенство(Неопределено, Результат.ЗначенияПараметров["value"]);
	
	ВходнойМассивПараметров = Новый Массив;
	ВходнойМассивПараметров.Добавить("add");
	ВходнойМассивПараметров.Добавить("testpath-value");
	
	Результат = ПарсерКомаднойСтроки.РазобратьКоманду(ВходнойМассивПараметров);
	Утверждения.ПроверитьРавенство(Неопределено, Результат.ЗначенияПараметров["-file"]);
	Утверждения.ПроверитьРавенство("testpath-value", Результат.ЗначенияПараметров["value"]);
	
КонецПроцедуры

Процедура ТестДолжен_ПолучитьПараметрыКомандыИОтдельныйПараметрФлаг() Экспорт
	// Лог.УстановитьУровень(УровниЛога.Отладка);
	
	ПарсерКомаднойСтроки.ДобавитьПараметрФлаг("flag",,Истина);
	
	ОписаниеКоманды = ПарсерКомаднойСтроки.ОписаниеКоманды("test");
	
	ПарсерКомаднойСтроки.ДобавитьПозиционныйПараметрКоманды(ОписаниеКоманды, "testpath");
	ПарсерКомаднойСтроки.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, "mode");
	ПарсерКомаднойСтроки.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, "output");
	ПарсерКомаднойСтроки.ДобавитьКоманду(ОписаниеКоманды);
	
	ВходнойМассивПараметров = Новый Массив;
	ВходнойМассивПараметров.Добавить("test");
	ВходнойМассивПараметров.Добавить("testpath-value");
	ВходнойМассивПараметров.Добавить("mode");
	ВходнойМассивПараметров.Добавить("1");
	ВходнойМассивПараметров.Добавить("output");
	ВходнойМассивПараметров.Добавить("2");
	ВходнойМассивПараметров.Добавить("flag");
	
	Результат = ПарсерКомаднойСтроки.Разобрать(ВходнойМассивПараметров);
	
	Утверждения.ПроверитьНеравенство(Неопределено, Результат, "Команда должна быть разобрана правильно");
	Утверждения.ПроверитьРавенство("test", Результат.Команда, "Команда");
	Утверждения.ПроверитьРавенство("testpath-value", Результат.ЗначенияПараметров["testpath"], "Значение позиционного параметра");

	Утверждения.ПроверитьРавенство("1", Результат.ЗначенияПараметров["mode"], "Именованный ключ mode");
	Утверждения.ПроверитьРавенство("2", Результат.ЗначенияПараметров["output"], "Именованный ключ output");
	Утверждения.ПроверитьРавенство(Истина, Результат.ЗначенияПараметров["flag"], "Флаг flag");
	Утверждения.ПроверитьРавенство(4, Результат.ЗначенияПараметров.Количество());
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьКомандуСПараметромПоУмолчаниюИГлобальнымПараметромФлаг() Экспорт
	
	ПарсерКомаднойСтроки.ДобавитьПараметрФлаг("flag",,Истина);
	
	ОписаниеКоманды = ПарсерКомаднойСтроки.ОписаниеКоманды("test");
	
	ПарсерКомаднойСтроки.ДобавитьПозиционныйПараметрКоманды(ОписаниеКоманды, "testpath");
	ПарсерКомаднойСтроки.ДобавитьКоманду(ОписаниеКоманды);
	
	ВходнойМассивПараметров = Новый Массив;
	ВходнойМассивПараметров.Добавить("test");
	ВходнойМассивПараметров.Добавить("flag");
	ВходнойМассивПараметров.Добавить("path-value");
	
	Результат = ПарсерКомаднойСтроки.Разобрать(ВходнойМассивПараметров);
	
	Утверждения.ПроверитьНеравенство(Неопределено, Результат, "Команда должна быть разобрана правильно");
	Утверждения.ПроверитьРавенство("test", Результат.Команда, "Команда");
	Утверждения.ПроверитьРавенство("path-value", Результат.ЗначенияПараметров["testpath"], "Значение позиционного параметра testpath");

	Утверждения.ПроверитьРавенство(Истина, Результат.ЗначенияПараметров["flag"], "Глобальный параметр-флаг flag");
	Утверждения.ПроверитьРавенство(2, Результат.ЗначенияПараметров.Количество());
	
КонецПроцедуры

Процедура ТестДолжен_ВернутьСправкуПоПараметрам() Экспорт
	
	ПарсерКомаднойСтроки.ДобавитьИменованныйПараметр("Параметр", "Это первый тестовый параметр");
	ПарсерКомаднойСтроки.ДобавитьПараметр("Параметр1", "Это второй тестовый параметр");

	СтрокиСправки = ПарсерКомаднойСтроки.СправкаПоПараметрам();
	// позиционные параметры идут в справке сначала
	Утверждения.ПроверитьРавенство("Это второй тестовый параметр", СтрокиСправки[0].Пояснение);
	Утверждения.ПроверитьИстину(СтрокиСправки[1].ЭтоИменованныйПараметр);
	Утверждения.ПроверитьРавенство("Это первый тестовый параметр", СтрокиСправки[1].Пояснение);
	Утверждения.ПроверитьЛожь(СтрокиСправки[0].ЭтоИменованныйПараметр);
	
КонецПроцедуры

Процедура ТестДолжен_ВернутьСправкуПоКоманде() Экспорт

	ОписаниеКоманды = ПарсерКомаднойСтроки.ОписаниеКоманды("add", "Добавляет что-то куда-то");
	
	ПарсерКомаднойСтроки.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, "-file", "файл");
	ПарсерКомаднойСтроки.ДобавитьПозиционныйПараметрКоманды(ОписаниеКоманды, "value", "значение какое-то");
	ПарсерКомаднойСтроки.ДобавитьКоманду(ОписаниеКоманды);
	
	Справка = ПарсерКомаднойСтроки.СправкаПоКоманде("add");
	Утверждения.ПроверитьРавенство("Добавляет что-то куда-то", Справка.Пояснение);
	// позиционные параметры идут в справке сначала
	Утверждения.ПроверитьРавенство("файл", Справка.Параметры[1].Пояснение);
	Утверждения.ПроверитьРавенство("значение какое-то", Справка.Параметры[0].Пояснение);

КонецПроцедуры

Процедура ТестДолжен_ВернутьСправкуПоСпискуКоманд() Экспорт
	
	ОписаниеКоманды = ПарсерКомаднойСтроки.ОписаниеКоманды("ком1", "описание 1");
	ПарсерКомаднойСтроки.ДобавитьКоманду(ОписаниеКоманды);
	
	ОписаниеКоманды = ПарсерКомаднойСтроки.ОписаниеКоманды("ком2", "описание 2");
	ПарсерКомаднойСтроки.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, "парам1", "пояснение");
	ПарсерКомаднойСтроки.ДобавитьКоманду(ОписаниеКоманды);
	
	Справка = ПарсерКомаднойСтроки.СправкаВозможныеКоманды();
	Утверждения.ПроверитьРавенство(2, Справка.Количество());
	Утверждения.ПроверитьРавенство("описание 1", Справка[0].Пояснение);
	Утверждения.ПроверитьРавенство("описание 2", Справка[1].Пояснение);
	Утверждения.ПроверитьРавенство("пояснение" , Справка[1].Параметры[0].Пояснение);
	
КонецПроцедуры

Процедура ТестДолжен_ВернутьСправкуПоСпискуКомандСГлобальнымиПараметрами() Экспорт
	ПарсерКомаднойСтроки.ДобавитьИменованныйПараметр("ОбщийПараметр", "описание общего", Истина);

	ОписаниеКоманды = ПарсерКомаднойСтроки.ОписаниеКоманды("ком1", "описание 1");
	ПарсерКомаднойСтроки.ДобавитьКоманду(ОписаниеКоманды);
	
	ОписаниеКоманды = ПарсерКомаднойСтроки.ОписаниеКоманды("ком2", "описание 2");
	ПарсерКомаднойСтроки.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, "парам1", "пояснение");
	ПарсерКомаднойСтроки.ДобавитьКоманду(ОписаниеКоманды);
	
	Справка = ПарсерКомаднойСтроки.СправкаВозможныеКоманды();
	Утверждения.ПроверитьРавенство(2, Справка.Количество());
	Утверждения.ПроверитьРавенство("описание 1", Справка[0].Пояснение);
	Утверждения.ПроверитьРавенство("описание общего" , Справка[0].Параметры[0].Пояснение);
	Утверждения.ПроверитьРавенство("описание 2", Справка[1].Пояснение);
	Утверждения.ПроверитьРавенство("пояснение" , Справка[1].Параметры[0].Пояснение);
	Утверждения.ПроверитьРавенство("описание общего" , Справка[1].Параметры[1].Пояснение);
	
	// ПарсерКомаднойСтроки.ВывестиСправкуПоКоманде("ком1");
КонецПроцедуры

Процедура ТестДолжен_ОбработатьНеизвестныйТокен() Экспорт
	ПарсерКомаднойСтроки.ДобавитьПараметр("known");
	
	ВходнойМассивПараметров = Новый Массив;
	ВходнойМассивПараметров.Добавить("known");
	ВходнойМассивПараметров.Добавить("unknown");
	
	Попытка
		ПарсерКомаднойСтроки.Разобрать(ВходнойМассивПараметров);
	Исключение
		Текст = ИнформацияОбОшибке().Описание;
		Утверждения.ПроверитьИстину(Найти(Текст, "Неизвестный параметр") > 0, "Получено исключение " + Текст);
		Возврат;
	КонецПопытки;
	
	ВызватьИсключение "Должно быть выдано исключение, но оно не выдано";
	
КонецПроцедуры

Процедура ТестДолжен_ПрочитатьПараметрКоллекцияВКонцеДляКоманды() Экспорт
	
	ОписаниеКоманды = ПарсерКомаднойСтроки.ОписаниеКоманды("add", "Добавляет что-то куда-то");
	
	ПарсерКомаднойСтроки.ДобавитьИменованныйПараметрКоманды(ОписаниеКоманды, "-file", "файл");
	ПарсерКомаднойСтроки.ДобавитьПараметрКоллекцияКоманды(ОписаниеКоманды, "list", "список параметров");
	ПарсерКомаднойСтроки.ДобавитьКоманду(ОписаниеКоманды);
	
	ВходнойМассивПараметров = Новый Массив;
	ВходнойМассивПараметров.Добавить("add");
	ВходнойМассивПараметров.Добавить("-file");
	ВходнойМассивПараметров.Добавить("readme.txt");
	ВходнойМассивПараметров.Добавить("1");
	ВходнойМассивПараметров.Добавить("2");
	ВходнойМассивПараметров.Добавить("3");
	
	Результат = ПарсерКомаднойСтроки.Разобрать(ВходнойМассивПараметров);
	
	Утверждения.ПроверитьРавенство("add", Результат.Команда);
	
	Значения = Результат.ЗначенияПараметров;
	
	Утверждения.ПроверитьРавенство("readme.txt", Значения["-file"]);
	Утверждения.ПроверитьРавенство(Тип("Массив"), ТипЗнч(Значения["list"]));
	Утверждения.ПроверитьРавенство("1", Значения["list"][0]);
	Утверждения.ПроверитьРавенство("2", Значения["list"][1]);
	Утверждения.ПроверитьРавенство("3", Значения["list"][2]);
	
	
КонецПроцедуры

Процедура ТестДолжен_ПрочитатьПараметрИменованнаяКоллекцияДляКоманды() Экспорт
	
	ОписаниеКоманды = ПарсерКомаднойСтроки.ОписаниеКоманды("add", "Добавляет что-то куда-то");
	
	ПарсерКомаднойСтроки.ДобавитьПозиционныйПараметрКоманды(ОписаниеКоманды, "file", "файл");
	ПарсерКомаднойСтроки.ДобавитьИменованныйПараметрКоллекцияКоманды(ОписаниеКоманды, "-item", "файл");
	ПарсерКомаднойСтроки.ДобавитьКоманду(ОписаниеКоманды);
	
	ВходнойМассивПараметров = Новый Массив;
	ВходнойМассивПараметров.Добавить("add");
	ВходнойМассивПараметров.Добавить("file.txt");
	ВходнойМассивПараметров.Добавить("-item");
	ВходнойМассивПараметров.Добавить("1");
	ВходнойМассивПараметров.Добавить("-item");
	ВходнойМассивПараметров.Добавить("2");
	ВходнойМассивПараметров.Добавить("-item");
	ВходнойМассивПараметров.Добавить("3");
	
	Результат = ПарсерКомаднойСтроки.Разобрать(ВходнойМассивПараметров);
	
	Утверждения.ПроверитьРавенство("add", Результат.Команда);
	
	Значения = Результат.ЗначенияПараметров;
	
	Утверждения.ПроверитьРавенство("file.txt", Значения["file"]);
	Утверждения.ПроверитьРавенство(Тип("Массив"), ТипЗнч(Значения["-item"]));
	Утверждения.ПроверитьРавенство("1", Значения["-item"][0]);
	Утверждения.ПроверитьРавенство("2", Значения["-item"][1]);
	Утверждения.ПроверитьРавенство("3", Значения["-item"][2]);
	
	
КонецПроцедуры

Процедура ТестДолжен_ПрочитатьПараметрКоллекцияВКонце() Экспорт
	
	ПарсерКомаднойСтроки.ДобавитьИменованныйПараметр("-file", "файл");
	ПарсерКомаднойСтроки.ДобавитьПараметрКоллекция("list", "список параметров");
	
	ВходнойМассивПараметров = Новый Массив;
	ВходнойМассивПараметров.Добавить("-file");
	ВходнойМассивПараметров.Добавить("readme.txt");
	ВходнойМассивПараметров.Добавить("1");
	ВходнойМассивПараметров.Добавить("2");
	ВходнойМассивПараметров.Добавить("3");
	
	Результат = ПарсерКомаднойСтроки.Разобрать(ВходнойМассивПараметров);
	
	Значения = Результат;
	
	Утверждения.ПроверитьРавенство("readme.txt", Значения["-file"]);
	Утверждения.ПроверитьРавенство(Тип("Массив"), ТипЗнч(Значения["list"]));
	Утверждения.ПроверитьРавенство("1", Значения["list"][0]);
	Утверждения.ПроверитьРавенство("2", Значения["list"][1]);
	Утверждения.ПроверитьРавенство("3", Значения["list"][2]);
	
	
КонецПроцедуры
