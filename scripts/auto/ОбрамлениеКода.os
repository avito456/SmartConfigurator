Перем Обмен;

Процедура ОбработкаТекста(Данные,Приемник)
	
	Соответствие = Новый Соответствие();
	Соответствие.Вставить("Если", "Если");
	Соответствие.Вставить("Пока", "Пока");
	Соответствие.Вставить("Для", "Для");
	Соответствие.Вставить("Для каждого", "Для каждого");
	Соответствие.Вставить("Попытка", "Попытка");
	Соответствие.Вставить("Область", "Область");

	ВыборИзСписка = ЗагрузитьСценарий("scripts\SelectValue.os");
	Стр = ВыборИзСписка.ВыбратьИзСписка(Соответствие);

	Если (Стр = "") Тогда
		возврат;
	ИначеЕсли (Стр = "Если") Тогда
		Данные = "Если Тогда" + Символы.ПС + Данные + Символы.ПС + "КонецЕсли;";
	ИначеЕсли (Стр = "Пока") Тогда
		Данные = "Пока Цикл" + Символы.ПС + Данные + Символы.ПС + "КонецЦикла;";
	ИначеЕсли (Стр = "Для") Тогда
		Данные = "Для По Цикл" + Символы.ПС + Данные + Символы.ПС + "КонецЦикла;";
	ИначеЕсли (Стр = "Для каждого") Тогда
		Данные = "Для каждого Стр из Коллекция Цикл" + Символы.ПС + Данные + Символы.ПС + "КонецЦикла;";
	ИначеЕсли (Стр = "Попытка") Тогда
		Данные = "Попытка" + Символы.ПС + Данные + Символы.ПС + "Исключение" +  Символы.ПС + "КонецПопытки;";
	ИначеЕсли (Стр = "Область") Тогда
		ИмяОбласти = Обмен.ВвестиЗначение("");
		Если СокрЛП(ИмяОбласти) <> "" Тогда
			Данные = "#Область " + ИмяОбласти + Символы.ПС + Данные + Символы.ПС + "#КонецОбласти";
		КонецЕсли
	КонецЕсли;	
	Данные = Данные + Символы.ПС;
	Обмен.ЗаписатьРезультатВФайл(Приемник,Данные);

КонецПроцедуры

Процедура ВыполнитьДействие(Параметры)
	
	ИмяФайла = "tmp\module.txt";
	Если Параметры.Количество() > 0 Тогда
		ИмяФайла = Параметры[0];
	КонецЕсли;
	Приемник = ИмяФайла;

	Если Параметры.Количество() > 1 Тогда
		Приемник = Параметры[1];
	КонецЕсли;

	ОбработкаТекста(Обмен.ПолучитьТекстИзФайла(ИмяФайла),Приемник);

КонецПроцедуры

//Обмен = ЗагрузитьСценарий(ТекущийКаталог()+"\scripts\Обмен.os");
Обмен = ЗагрузитьСценарий("scripts\Обмен.os");

ВыполнитьДействие(АргументыКоманднойСтроки);

//МассивПарамеров = новый Массив;
//МассивПарамеров.Добавить("c:\work\portable\v8CfgAddsAhk\tmp\module.txt");
//МассивПарамеров.Добавить("c:\work\portable\v8CfgAddsAhk\tmp\new.module.txt");

//Выполнить(МассивПарамеров);