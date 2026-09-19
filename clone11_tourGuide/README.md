피그마 디자인 출처 : https://www.figma.com/community/file/1034368748569978451/application-for-travelers-bashkortostan

## 1. 메인 화면
<img width="303" height="618" alt="image" src="https://github.com/user-attachments/assets/d8b01b9b-cf99-4f2f-9e44-2b7809ef7ade" />
<img width="400" height="867" alt="Screen_recording_20260916_114533" src="https://github.com/user-attachments/assets/78576f2c-02a5-4f3b-aace-52075650ca6c" />


## 2. 투어 상세 화면
<img width="303" height="618" alt="image" src="https://github.com/user-attachments/assets/e894b557-2ed2-4977-87e6-8de94a6a0709" />
<img width="400" height="867" alt="Screen_recording_20260916_123019 (1)" src="https://github.com/user-attachments/assets/bd804d8f-f798-46e8-a96a-6791e9e6bf33" />


---

## 0. 들어가기 전
<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/92893930-c3c9-4315-b331-bf1ee080548f" />


이제 클론 코딩을 하면서 최대한 클린 코드를 만들기 위해 고민하며 코딩하는 습관을 조금씩 늘리고 있다.

방학이 된다면 다시 매일 클론 코딩으로 하루를 시작하면서, 단순히 화면을 따라 만드는 것이 아니라 **코드를 어떻게 구조화하면 좋을지 고민하며** 클론 코딩을 해볼 생각이다.

이번에도 디자인을 그대로 구현하는 것에서 끝내지 않고, 화면을 분석하면서 어떤 식으로 코드를 구성할지 함께 고민해보려고 한다. 

깃허브 주소 : [깃허브 바로가기](https://github.com/sky688372-wq/Flutter_clone_practice_set/tree/main/clone11_tourGuide)

---

## 1. 디자인 살펴보기

- 클론 코딩할 디자인 : [Application For Travelers. Bashkortostan](https://www.figma.com/community/file/1034368748569978451)

먼저 이번에 클론 코딩할 디자인은 다음과 같다.

#### <메인 화면>
![](https://velog.velcdn.com/images/han090213/post/27ac7a53-9706-4d5c-b214-70dc9b40af31/image.png)

---

#### <투어 상세 화면>
![](https://velog.velcdn.com/images/han090213/post/85dcf352-168d-44ea-abb3-0c26d2f4b529/image.png)

## 2. 디자인 분석하기

해당 디자인은 여행자를 위한 투어 앱 디자인으로 보인다.

전체적으로 굉장히 심플하면서도 깔끔한 느낌을 주는 디자인이다.  
특히 많은 정보를 한 화면에 보여주기보다는 **이미지와 텍스트를 적절하게 배치해서 여행 정보를 직관적으로 보여주는 것**에 집중한 것 같다.

디자인을 처음 봤을 때는 단순해 보였지만, 실제로 구현하려고 하나씩 살펴보니 여러 요소들이 눈에 보였다. 

따라서 이번에는 화면 전체를 하나의 큰 위젯으로 만들기보다는, **각각의 역할에 맞게 위젯을 나누는 방식으로 구현해보려고 한다.**

이렇게 디자인을 먼저 분석하고 코드를 작성하면 단순히 화면을 따라 만드는 것보다 코드의 구조를 고민하면서 개발할 수 있을 것 같다.

먼저 기본적으로 화면은 총 두개이고 이 둘을 각각 분석해보겠다.

- 메인 화면
- 투어 상세 화면

### (1) 메인 화면
메인 화면의 배치 요소는 다음으로 나눌 수 있을 것 같다. 

- 상단 앱의 제목 텍스트와 지도 아이콘 버튼
- 검색창
- 카테고리 텍스트와 컨테이너
- popular 텍스트와 장소 컨테이너 박스들
- 하단의 둥근 네비게이션 바

>이 요소들 중에서 데이터를 따로 관리할 필요가 있는 요소는 카테고리와 popular 카드라고 생각했다.

기본적으로 하나의 카테고리는 다음 요소들로 이루어져있다.
- 아이콘(이미지)
- text

![](https://velog.velcdn.com/images/han090213/post/98b6ee5d-120a-4c50-a0d2-c60edf1415cc/image.png)

그리고 popular카드는 다음과 같은 요소들로 이루어져있다.

- 이미지
- text
- 별점
- favorite여부

![](https://velog.velcdn.com/images/han090213/post/52f0b5f0-bc26-4801-91e1-3cf33f17bcdf/image.png)

### (2) 투어 상세 화면

투어 상세 화면은 다음과 같이 대표적인 요소들을 나눌 수 있다.

- 상단 장소 사진(뒤로가기 버튼, 가이드  프로필, favorite여부)
- 여행지 제목과 설명(+read more)
- 여행 정보 컨테이너
- 투어 구매 버튼

여기서 모델 클래스로 정의할 요소는 여행 정보 컨테이너로 다음과 같은 요소들로 이루어져있다.

- Icon이미지
- text

![](https://velog.velcdn.com/images/han090213/post/4cfbe5f2-579b-4daf-9e79-959e38d18e47/image.png)



---

## 3. 화면을 어떻게 나눌까?

디자인을 어느 정도 분석했으니 이제 실제 Flutter 코드에서는 이 화면을 어떻게 구성할지 고민해보았다.

처음에는 그냥 `Scaffold` 안에서 `Column`과 `Row`를 사용해 전부 구현해도 될 것 같았다.

하지만 그렇게 구현하면 하나의 `build()` 메서드가 너무 길어질 가능성이 높다.

그래서 화면에서 반복되거나 하나의 역할을 담당하는 부분들을 별도의 위젯으로 분리하기로 했다.

크게 다음과 같이 화면을 구성하기로 했다.

- 모델 클래스 -> **Category, Popular, TravelInfo의 데이터 정의 및 위젯 생성을 담당하는 static 메서드** 
- 메인 화면
- 투어 상세 화면

---

## 4. 코딩 시작하기

### (1) 메인 화면

해당 코드는 이 [메인 화면 깃허브 주소](https://github.com/sky688372-wq/Flutter_clone_practice_set/blob/main/clone11_tourGuide/lib/home_screen.dart)에서 볼 수 있다. 

먼저 메인 화면의 상단부터 검색 카테고리까지 만든다. 그 후 카테고리를 만들기 위해서 [Category](https://github.com/sky688372-wq/Flutter_clone_practice_set/blob/main/clone11_tourGuide/lib/model_class.dart)모델 클래스를 제작한 후 카테고리 화면을 만든다. 그후 popular카드를 만든다. 그 후 바텀 네비게이션 바를 만든다. 

#### <제작한 메인 화면>
![](https://velog.velcdn.com/images/han090213/post/1c535221-c6d7-455b-b789-d2ce76439d89/image.png)

![](https://velog.velcdn.com/images/han090213/post/362c65d7-e1ae-4270-9128-87bfcfad98c5/image.gif)![](https://velog.velcdn.com/images/han090213/post/68248276-e8f6-4987-a43b-450c97c77e41/image.gif)



여기서 바텀네비게이션 바는 컨테이너를 이용해서 수정할 수 있다. 이에 대해서 더 자세히 설명을 해보겠다.

| 파라미터                   | 설명                     |
| ---------------------- | ---------------------- |
| `backgroundColor`      | 네비게이션 바의 배경색을 설정       |
| `elevation`            | 네비게이션 바의 그림자 깊이를 설정    |
| `type`                 | 아이템 배치 방식을 설정          |
| `selectedItemColor`    | 현재 선택된 아이템의 색상         |
| `unselectedItemColor`  | 선택되지 않은 아이템의 색상        |
| `showSelectedLabels`   | 선택된 아이템의 텍스트 표시 여부     |
| `showUnselectedLabels` | 선택되지 않은 아이템의 텍스트 표시 여부 |
| `items`                | 네비게이션 바에 표시할 메뉴들을 설정   |

먼저 네비게이션 바의 기본적인 형태와 디자인을 수정하기 위해 몇 가지 파라미터를 설정했다.

>이번 디자인에서는 네비게이션 바 자체에 배경이나 그림자를 주기보다는, 바깥의 `Container`를 이용해서 둥근 모서리와 배경을 만들고 그 안에 `BottomNavigationBar`를 배치했다.

따라서 `BottomNavigationBar`의 기본 디자인을 최대한 제거하는 것이 중요했다.

가장 먼저 `type`은 `BottomNavigationBarType.fixed`로 설정했다.

```dart
type: BottomNavigationBarType.fixed,
```

`BottomNavigationBar`의 타입에는 대표적으로 `fixed`와 `shifting`이 있는데, 이번 디자인에서는 아이콘들이 일정한 간격으로 고정되어 배치되어 있기 때문에 `fixed`를 사용했다.

>그리고 `backgroundColor`는 투명하게 설정했다.

```dart
backgroundColor: Colors.transparent,
```

실제 배경은 바깥의 `Container`에서 설정하고 있기 때문에 `BottomNavigationBar` 자체의 배경색은 필요하지 않다.

또 하나 중요한 부분은 `elevation`이다.

```dart
elevation: 0,
```

`elevation`은 네비게이션 바에 적용되는 그림자의 정도를 설정하는 값이다. 기본값을 그대로 사용하면 `BottomNavigationBar`에 그림자가 생기는데, 이번 디자인에서는 별도의 그림자가 없는 형태이기 때문에 `0`으로 설정해서 그림자를 제거했다.

>이 값을 설정하지 않으면 `Container`의 둥근 배경과 별개로 `BottomNavigationBar`의 기본 그림자가 나타나 디자인과 어울리지 않게 보일 수 있다.

선택된 아이템과 선택되지 않은 아이템의 색상도 각각 설정했다.

```dart
selectedItemColor: Colors.pink,
unselectedItemColor: Colors.grey,
```

그리고 이번 디자인에서는 아이콘만 표시하고 텍스트는 표시하지 않기 때문에 다음과 같이 라벨을 숨겼다.

```dart
showSelectedLabels: false,
showUnselectedLabels: false,
```

마지막으로 `items`를 통해 실제 네비게이션 메뉴를 구성했다.

```dart
items: const [
  BottomNavigationBarItem(
    label: "Home",
    icon: Icon(Icons.home),
  ),
  BottomNavigationBarItem(
    label: "favorite",
    icon: Icon(Icons.favorite),
  ),
  BottomNavigationBarItem(
    label: "chat",
    icon: Icon(Icons.wechat_outlined),
  ),
  BottomNavigationBarItem(
    label: "setting",
    icon: Icon(Icons.settings),
  ),
],
```

정리하면 이번 네비게이션 바에서는 `type`으로 아이템의 배치 방식을 정하고, `backgroundColor`와 `elevation`을 이용해 기본 디자인을 제거했다. 그리고 `selectedItemColor`와 `unselectedItemColor`로 아이콘의 색상을 조절하고, `showSelectedLabels`와 `showUnselectedLabels`를 `false`로 설정해 아이콘만 보이도록 구현했다.

이렇게 `BottomNavigationBar` 자체의 디자인을 조절하고, 바깥의 `Container`에서 둥근 모서리와 배경을 담당하도록 나누어 구현했다.

---

### (2) 투어 상세 페이지
- [코드 보러기기](https://github.com/sky688372-wq/Flutter_clone_practice_set/blob/main/clone11_tourGuide/lib/detail_screen.dart)

투어 상세 페이지는 호출될 때, 3가지의 파라미터를 넣도록 만들었다. 

```dart
required this.imgPath,
required this.name,
required this.isFavorite,
```

이미지의 경로를 입력 받아서 상단에 이미지를 띄우고 그 뒤에 제목(name)과 좋아요 여부를 받는다. 

![](https://velog.velcdn.com/images/han090213/post/03cfc56a-ad43-4ea0-8db3-872a20861369/image.png)

![](https://velog.velcdn.com/images/han090213/post/3f50f539-96b3-467f-a413-78cd11a741f1/image.gif)

~~그렇다. 솔직히 우리 학교 자습 시간 너무 짧다. 기숙사에서 항시 노트북이 가능하도록 하면 매일 면학 2교시를 할텐데.... 내가 하고 싶은 일을 할 수 있는 시간은 왜이리 없는 것일까?~~

Read more아래에 있는 여행 정보 또한 모델 클래스로 정의하여 ListView.Builder로 배치하였다. 

```dart
class TravelInfo {
  String text;
  IconData icon;
  Color iconColor;
  TravelInfo({required this.text, required this.icon, required this.iconColor});
}
```



해당 화면을 구현할 때... 좋아요 버튼을 디자인 화면에 넣는 것을 까먹었다.

처음에는 단순히 화면을 구현하는 과정에서 놓친 것이라고 생각했다. 하지만 다시 생각해보니 디자인을 분석할 때 각 요소를 확인하는 과정이 조금 부족했던 것 같다.

이번 클론 코딩에서는 화면을 보고 위젯을 어떻게 나눌지에 대해서는 많이 고민했지만, 정작 각각의 요소를 하나씩 체크하면서 구현하지는 않았다. 그래서 이미 분석했다고 생각했던 화면에서도 작은 요소 하나를 놓치게 되었다.

이번 경험을 통해 디자인을 분석할 때는 단순히 "이 화면에는 이런 요소가 있구나"라고 생각하는 것에서 끝나는 것이 아니라, **실제로 구현해야 할 요소들을 하나씩 정리하고 확인하는 과정도 필요하다는 것**을 다시 느끼게 되었다.

다음 클론 코딩에서는 디자인을 분석한 뒤 화면의 요소들을 먼저 정리하고, 하나씩 구현하면서 빠진 부분이 없는지 확인해보려고 한다.

## 5. 마무리

이번 클론 코딩에서는 단순히 디자인을 똑같이 만드는 것보다 **화면을 어떻게 나누고, 각각의 요소를 어떻게 코드로 구성할지** 고민하면서 구현해보았다.

특히 `Category`, `Popular`, `TravelInfo`처럼 반복해서 사용되는 요소들을 따로 정의하면서 화면의 구조를 조금 더 명확하게 만들려고 했다.

물론 이번에도 좋아요 버튼을 빼먹는 실수가 있었고, 모든 부분을 처음부터 완벽하게 설계하지는 못했다. 하지만 이런 실수를 통해 디자인을 분석하는 과정과 코드의 구조를 고민하는 과정 모두 중요하다는 것을 배울 수 있었다.

아직 내가 작성하는 코드가 완벽하게 클린하다고 할 수는 없지만, 이전처럼 단순히 화면을 따라 만드는 것에서 끝나는 것이 아니라 **"왜 이렇게 구현했는가?"와 "더 깔끔하게 작성할 수 있는 방법은 무엇인가?"를 고민하기 시작했다는 것** 자체가 이번 클론 코딩에서 가장 큰 변화라고 생각한다.

앞으로도 클론 코딩을 할 때 단순히 결과물을 똑같이 만드는 것에 집중하기보다는, **디자인을 꼼꼼하게 분석하고 코드의 구조까지 고민하는 습관**을 계속 만들어가려고 한다.
