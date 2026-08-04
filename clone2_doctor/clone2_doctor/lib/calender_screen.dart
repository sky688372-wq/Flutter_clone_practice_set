import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// 상태 변경이 가능한 StatefulWidget으로 클래스 선언
class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  // 현재 화면에 보여주는 달력의 기준 날짜 (오늘 날짜로 초기화)
  DateTime _focusedDay = DateTime.now();

  // 사용자가 클릭해서 선택한 날짜 (초기값은 선택되지 않았으므로 null 가능)
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TableCalendar(
          // 달력 화면에서 기준이 되는 포커스 날짜
          focusedDay: _focusedDay,
          // 달력에서 이동할 수 있는 최소 시작 날짜
          firstDay: DateTime(2020, 1, 1),
          // 달력에서 이동할 수 있는 최대 종료 날짜
          lastDay: DateTime(2030, 1, 1),
        
          // 1. 날짜 클릭 이벤트 처리
          onDaySelected: (selectedDay, focusedDay) {
            // 화면을 다시 그려주기 위해 setState() 사용
            setState(() {
              // 클릭한 날짜를 선택 상태 변수에 저장
              _selectedDay = selectedDay;
              // 선택한 날짜가 속한 달로 기준 날짜(focusedDay) 업데이트
              _focusedDay = focusedDay;
            });
          },
        
          // 2. 선택 시 선택 효과(하이라이트) 판별 기능
          // 달력이 각각의 날짜(day)를 그릴 때마다 이 함수를 실행하여 true가 반환되는 날짜에 선택 효과를 부여함
          selectedDayPredicate: (day) {
            // isSameDay(): 두 DateTime의 연/월/일이 일치하는지 비교해주는 table_calendar 내장 함수
            return isSameDay(_selectedDay, day);
          },
        
          // 3. (선택 사항) 선택 효과 및 헤더 디자인 커스텀
          headerStyle: const HeaderStyle(
            formatButtonVisible: false, // 우측의 '2 weeks' 포맷 변경 버튼 숨기기
            titleCentered: true,        // 상단 연/월 제목을 중앙에 정렬
          ),
          calendarStyle: CalendarStyle(
            // [선택된 날짜]의 배경 스타일 지정
            selectedDecoration: const BoxDecoration(
              color: Colors.blue,     // 동그라미 배경색 지정
              shape: BoxShape.circle,  // 모양을 원으로 설정 (BoxShape.rectangle 지정 시 네모)
            ),
            // [선택된 날짜]의 글자 스타일 지정
            selectedTextStyle: const TextStyle(
              color: Colors.white,         // 글자 색상
              fontWeight: FontWeight.bold, // 글자 두께
            ),
        
            // [오늘 날짜]의 배경 스타일 지정 (선택한 날짜와 구분해주기 위함)
            todayDecoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3), // 은은한 투명도의 배경색
              shape: BoxShape.circle,
            ),
            // [오늘 날짜]의 글자 스타일 지정
            todayTextStyle: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}