// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Импорт пакета для работы с виджетом выбора диапазона дат
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// Определение виджета DateRangePicker
class DateRangePicker extends StatefulWidget {
  // Конструктор виджета с необходимыми параметрами
  const DateRangePicker({
    super.key,
    this.width,
    this.height,
    this.dateFilter,
    this.textColor, // Добавлен параметр для цвета текста
    this.fontSize, // Добавлен параметр для размера шрифта
    this.fontFamily, // Добавлен параметр для семейства шрифтов
  });

  // Ширина виджета (опционально)
  final double? width;
  // Высота виджета (опционально)
  final double? height;
  // Функция обратного вызова для обработки выбранного диапазона дат
  final Future Function(DateTime? dateStart, DateTime? dateEnd)? dateFilter;
  // Цвет текста (опционально)
  final Color? textColor;
  // Размер шрифта (опционально)
  final double? fontSize;
  // Семейство шрифтов (опционально)
  final String? fontFamily;

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

// Состояние виджета DateRangePicker
class _DateRangePickerState extends State<DateRangePicker> {
  // Переменные для хранения выбранных дат
  DateTime? _startDate;
  DateTime? _endDate;

  // Метод, вызываемый при изменении выбора дат
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      setState(() {
        // Обновление начальной и конечной даты
        _startDate = args.value.startDate;
        _endDate = args.value.endDate;
      });
      // Вызов функции обратного вызова, если она предоставлена
      if (widget.dateFilter != null) {
        widget.dateFilter!(_startDate, _endDate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Установка ширины и высоты контейнера
      width: widget.width ?? double.infinity,
      height: widget.height ?? 300,
      child: Column(
        children: [
          Expanded(
            // Виджет выбора диапазона дат
            child: SfDateRangePicker(
              view: DateRangePickerView.month, // Отображение по месяцам
              selectionMode:
                  DateRangePickerSelectionMode.range, // Режим выбора диапазона
              monthViewSettings: DateRangePickerMonthViewSettings(
                firstDayOfWeek: 1, // Понедельник как первый день недели
              ),
              onSelectionChanged:
                  _onSelectionChanged, // Обработчик изменения выбора
              monthCellStyle: DateRangePickerMonthCellStyle(
                textStyle: TextStyle(
                  color: widget.textColor ??
                      FlutterFlowTheme.of(context).primaryText,
                  fontSize: widget.fontSize ?? 14,
                  fontFamily: widget.fontFamily,
                ),
              ),
              yearCellStyle: DateRangePickerYearCellStyle(
                textStyle: TextStyle(
                  color: widget.textColor ??
                      FlutterFlowTheme.of(context).primaryText,
                  fontSize: widget.fontSize ?? 14,
                  fontFamily: widget.fontFamily,
                ),
              ),
              headerStyle: DateRangePickerHeaderStyle(
                textStyle: TextStyle(
                  color: widget.textColor ??
                      FlutterFlowTheme.of(context).primaryText,
                  fontSize: (widget.fontSize ?? 14) + 2,
                  fontFamily: widget.fontFamily,
                ),
              ),
            ),
          ),
          // Отображение выбранного диапазона дат закомментировано
          /* Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Выбранный диапазон: ${_startDate?.toString().split(' ')[0] ?? 'Не выбрано'} - ${_endDate?.toString().split(' ')[0] ?? 'Не выбрано'}',
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          ),*/
        ],
      ),
    );
  }
}
