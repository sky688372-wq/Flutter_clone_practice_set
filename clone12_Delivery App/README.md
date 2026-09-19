- 피그마 디자인 출처(무료) : https://www.figma.com/community/file/852455074698003039

---

## 1. 스플래쉬 화면
<img width="270" height="585" alt="image" src="https://github.com/user-attachments/assets/66f64514-39b0-44e7-99b3-f2a6790eca6b" />
<img width="400" height="867" alt="Screen_recording_20260917_204249" src="https://github.com/user-attachments/assets/65676835-25db-4471-80bb-bce59d377898" />

---

## 2. Home화면
<img width="270" height="585" alt="image" src="https://github.com/user-attachments/assets/74b79628-7fd2-48b4-bacf-9edf12950707" />
<img width="400" height="867" alt="Screen_recording_20260917_204439" src="https://github.com/user-attachments/assets/c59ab89c-df34-4497-9452-6533c134013b" />


## 3. CheckOut 화면
<img width="270" height="585" alt="image" src="https://github.com/user-attachments/assets/b1e07ef2-2e3a-49a0-8778-56b18fa9d25f" />
<img width="400" height="867" alt="Screen_recording_20260917_204554" src="https://github.com/user-attachments/assets/db4bfd3a-1f45-4d41-acac-65027d2f474c" />

## 4. creditCard 화면
<img width="270" height="585" alt="image" src="https://github.com/user-attachments/assets/d2feae55-eedf-4137-a15f-1ddea59f38ef" />
<img width="400" height="867" alt="Screen_recording_20260917_204750" src="https://github.com/user-attachments/assets/eb96b4a5-7021-436c-89f6-a8e1b227ab77" />

---

## 0. 들어가기 전
<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/3c2b6d20-5859-4141-871b-864b24e41028" />


오늘은 [provider](https://velog.io/@han090213/%EC%A0%9C%EB%A1%9C%EB%B6%80%ED%84%B0-%EC%8B%9C%EC%9E%91%ED%95%98%EB%8A%94-%ED%94%8C%EB%9F%AC%ED%84%B0-%EC%83%81%ED%83%9C-%EA%B4%80%EB%A6%AC-%EB%9D%BC%EC%9D%B4%EB%B8%8C%EB%9F%AC%EB%A6%AC-provider) 상태 관리 라이브러리를 사용해서 클론 코딩을 하는 것을 목표로 했다.

이전에 [provider](https://velog.io/@han090213/%EC%A0%9C%EB%A1%9C%EB%B6%80%ED%84%B0-%EC%8B%9C%EC%9E%91%ED%95%98%EB%8A%94-%ED%94%8C%EB%9F%AC%ED%84%B0-%EC%83%81%ED%83%9C-%EA%B4%80%EB%A6%AC-%EB%9D%BC%EC%9D%B4%EB%B8%8C%러리-provider)를 간단한 실습으로만 사용해보았기 때문에, 실제 클론 코딩에서도 사용해보면서 Provider에 조금 더 익숙해지고 싶었다.

>그래서 이번에는 화면을 먼저 만든 다음 Provider를 적용하는 방식이 아니라, **처음부터 Provider를 사용하는 것을 전제로 프로젝트를 구성해보려고 했다.**

단순히 Provider의 사용법을 다시 따라 해보는 것보다는 실제 앱을 하나 만들어보면서 어떤 데이터를 상태로 관리할지, Provider를 어디에 적용할지 직접 고민해보는 것이 더 도움이 될 것 같았다.

따라서 이번 글에서는 단순히 디자인을 어떻게 구현했는지뿐만 아니라, **Provider를 어떤 식으로 적용했고 상태를 어떻게 관리했는지**를 중심으로 기록해보려고 한다.

깃허브 주소 : [깃허브 바로가기](https://github.com/sky688372-wq/Flutter_clone_practice_set/tree/main/clone12_Delivery%20App)

---

## 1. 디자인 살펴보기

- 클론 코딩할 디자인 : [Delivery App_UI Kit](https://www.figma.com/community/file/852455074698003039)

먼저 이번에 클론 코딩할 디자인을 살펴보자.

이번에는 배달 앱을 주제로 한 디자인을 클론 코딩했다.

#### <스플래쉬 화면>

![](https://velog.velcdn.com/images/han090213/post/66d712aa-c28d-4ad0-860b-d18d7cf888a2/image.png)

---

#### <메인 화면>

![](https://velog.velcdn.com/images/han090213/post/d47ff15b-7752-4f14-af5c-80758ec42fc7/image.png)


---

#### <CheckOut 화면>

![](https://velog.velcdn.com/images/han090213/post/e65b1af0-e1c9-4641-bc1e-788cdd872a76/image.png)


---

#### <Credit Card 화면>
![](https://velog.velcdn.com/images/han090213/post/1de46e89-0735-42d3-abea-37ede6fff3ad/image.png)



---

## 2. 디자인 분석하기

이번 디자인은 전체적으로 배달 앱에서 상품을 선택하고 주문하는 과정을 보여주는 형태로 구성되어 있다.

화면 자체는 복잡하지 않고 깔끔한 형태로 구성되어 있지만, 실제로 구현하려고 살펴보니 화면마다 사용자의 행동에 따라 변경되는 부분들이 있었다.

>특히 이번 클론 코딩에서는 처음부터 **Provider를 사용하는 것을 목표로 했기 때문에**, 단순히 디자인의 UI 요소만 확인하는 것이 아니라 어떤 데이터가 변경되고, 그 데이터를 어떤 방식으로 관리할지도 함께 생각하면서 디자인을 분석했다.

이번에 구현할 화면은 총 4개이다.

- 스플래쉬 화면
- 메인 화면
- CheckOut 화면
- Credit Card 화면

각 화면을 하나씩 살펴보면서 어떤 요소들이 필요한지 분석해보았다.

### (1) 스플래쉬 화면

>스플래쉬 화면은 유저에게 처음으로 보여지는 화면인 만큼 앱의 첫인상을 결정하는 중요한 화면 중 하나이다.

스플래쉬 화면은 **배경 화면이 Blob Gradient**으로 되어있고 **상단에 D로고**가 존재한다. 또한 **중단 ~ 하단에는 하얀색의 컨테이너 박스안에 여러 가지 요소들이 Colum으로 배치**되어 있는 것을 볼 수 있다. 

![](https://velog.velcdn.com/images/han090213/post/a3583ad4-0f03-4d40-a3dc-1796e48a6c28/image.png)


---

### (2) 메인 화면(카테고리 화면)

>메인 화면에서는 사용자가 살 음식의 카테고리를 선택할 수 있는 카테고리 요소들이 존재한다.

화면의 배치 요소를 크게 나누어보면 다음과 같다.

- 상단 카테고리 텍스트
- 상단의 텍스트 필드
- 카테고리 컨테이너들

![](https://velog.velcdn.com/images/han090213/post/d47ff15b-7752-4f14-af5c-80758ec42fc7/image.png)

메인 화면에서 가장 눈에 띄는 부분은 여러 카테고리가 반복해서 나타난다는 것이다.

>상품 하나는 이미지, 이름, 가격 등의 정보를 가지고 있기 때문에 하나의 카테고리를 모델 클래스로 정의하고, 여러 상품을 리스트로 관리하는 방식이 적절하다고 생각했다.


---

### (3) CheckOut 화면

>CheckOut 화면에서는 사용자가 선택한 상품을 확인하고 실제 주문을 진행할 수 있도록 구성되어 있다.

화면을 살펴보면 다음과 같은 요소들로 나눌 수 있다.

- 카드 번호
- 배달 주소
- 배달 방식
- Non_contect-delivery 스위치

![](https://velog.velcdn.com/images/han090213/post/d44d62b0-f0b5-4e4b-a389-81a71903ac39/image.png)


이 화면에서는 사용자가 배달 방법을 선택하거나 주문과 관련된 정보를 변경할 수 있기 때문에, 단순히 데이터를 보여주는 화면과는 다르게 **사용자의 행동에 따라 상태가 변경되는 부분**이 존재한다.

예를 들어서 Credit Card의 정보를 변경할 경우 바뀐 데이터를 다른 화면에서도 사용할 수 있어야 하기 때문에, 카드 번호, 카드 이름, 만료일, CVC를 Provider로 관리하기로 했다.

---

### (4) Credit Card 화면

Credit Card 화면에서는 사용자가 결제에 사용할 카드 정보를 입력할 수 있다.

화면의 주요 요소는 다음과 같이 나눌 수 있다.

- 상단 credit card
- credit card아래에 사진으로 카드를 스캔할 수 있도록 하는 버튼
- 카드 주인명
- 카드 번호
- 유효기간
- CVC
- 카드 정보를 저장하기 위한 버튼

![](https://velog.velcdn.com/images/han090213/post/b5b8de9d-65ee-4abe-89e8-2bc020817e4b/image.png)


이번 클론 코딩에서 Provider를 사용하는 것과 가장 밀접하게 연결된 화면이 바로 이 Credit Card 화면이다.

사용자가 입력한 카드 정보는 단순히 현재 화면에서만 사용되는 데이터가 아니라, 이후 결제 과정에서도 사용할 수 있어야 한다.

따라서 카드 정보를 `CreditCardProvider`에서 관리하고, Credit Card 화면에서는 사용자가 입력한 값을 Provider에 전달하는 방식으로 구성했다.

즉, 전체적인 데이터의 흐름을 생각해보면 다음과 같이 구성할 수 있다.

> 카드 정보 입력 → Provider에 데이터 저장 → 다른 화면에서 Provider의 데이터 사용

이렇게 하면 화면과 데이터를 분리해서 관리할 수 있기 때문에, 이번 클론 코딩에서 공부하려고 했던 Provider를 실제 앱의 흐름에 적용해볼 수 있을 것 같았다.

이번에는 단순히 디자인을 따라 만드는 것에서 끝내지 않고, **각 화면에서 어떤 데이터가 필요하고 그 데이터가 어디에서 관리되어야 하는지까지 고민하면서** 다음 단계의 코드를 구성해보기로 했다.

---

## 3. 화면 코딩 시작하기
이번 클론 코딩의 코드들은 상단의 [깃허브 주소](https://github.com/sky688372-wq/Flutter_clone_practice_set/blob/main/clone12_Delivery%20App/README.md)로 가면 볼 수 있다. 

### (1) 스플래쉬 화면

- [깃허브 바로가기 : 스플래쉬 화면](https://github.com/sky688372-wq/Flutter_clone_practice_set/blob/main/clone12_Delivery%20App/lib/splash_screen.dart)

해당 화면의 상단 Blob Gradient요소는 Stack형식으로 시작한 뒤, `Positioned.fill`위젯을 이용하여 화면을 꽉 채웠다. 원래 디자인대로 코드를 구현할수도 있지만 [unsplash](https://unsplash.com/ko)에서 잘 어울릴 것 같은 이미지를 직접 선정했다.

```dart
Positioned.fill(
  child: Image.asset(
    'assets/images/background.png',
    fit: BoxFit.cover,
  ),
),
```

그리고 상단에는 앱의 D 로고를 배치하고, 아래쪽에는 흰색 컨테이너를 배치했다.

#### <클론 코딩한 스플래쉬 화면>
![](https://velog.velcdn.com/images/han090213/post/c450acb6-32dd-44f2-b013-13ba4dd01904/image.png)

흰색 컨테이너 안에는 아이콘과 Non-Contact Deliveries 텍스트, 설명, ORDER NOW 버튼, DISMISS 버튼을 Column으로 배치했다.


### (2) 메인 화면(카테고리 화면)

- [깃허브 : 메인 화면(카테고리 화면)](https://github.com/sky688372-wq/Flutter_clone_practice_set/blob/main/clone12_Delivery%20App/lib/home/category_screen.dart)

메인 화면은 기본적으로 크게 보면 요소가 3가지 존재한다. 
- 카테고리 텍스트
- 텍스트 필드
- 카테고리 컨테이너들

이 중에서 카테고리 컨테이너들은 `LayoutBuilder`와 `Wrap`위젯을 사용하여 구현했다.

```dart
// 3. 상품 목록 : Wrap 위젯 사용
LayoutBuilder(
  builder: (context, constraints) {
    // spacing 간격(16)을 고려하여 카드 1개의 너비 계산
    final double cardWidth = (constraints.maxWidth - 16) / 2;

    return Wrap(
      spacing: 16, // 좌우 아이템 간격
      runSpacing: 16, // 위아래 줄 간격
      children: category.map((item) {
        return Container(
          width: cardWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상단 이미지 부분
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
                child: Image.asset(
                  item.imgPath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // 하단 텍스트 영역
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D0C57),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '(${item.count})',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  },
)
```

#### <클론 코딩한 메인 화면>
![](https://velog.velcdn.com/images/han090213/post/318c3b31-7e31-4849-86ad-5c84e084b895/image.png)


### (3) CheckOut 화면

- [깃허브 : CheckOut 화면](https://github.com/sky688372-wq/Flutter_clone_practice_set/blob/main/clone12_Delivery%20App/lib/home/product_screen.dart)

CheckOut 화면은 마치 설정창을 보는 것 같았다. 그래서 이 화면은 `ListTile`위젯을 상용하려고 했다. 그러나 리스트 타일의 title등의 파라미터로는 카드 번호 등을 구현할 수 없기에 직접 Row와 Colum등을 이용해서 구현했다.

#### <클론 코딩한 화면>
![](https://velog.velcdn.com/images/han090213/post/0360bf1f-cdf6-4cf0-90cc-37382ded1a19/image.png)


### (4) creditCard 화면

- [깃허브 : creditCard 화면](https://github.com/sky688372-wq/Flutter_clone_practice_set/blob/main/clone12_Delivery%20App/lib/home/detail/credit_card_info_screen.dart)

해당 화면 상단의 컨테이너는 자식으로`Padding`과 `Colum`을 사용하여 카드 안의 요소들을 구현했다. 또한 텍스트 필드들을 배치하고 해당 텍스트 필드의 컨트롤러에 다음과 같이 기본값을 넣어서 화면에 들어오면 기본값이 이미 입력된 상태로 만들었다.

```dart
final TextEditingController _nameOnCardCtrl = TextEditingController(
	text: nameOnCard,
);
...
```

#### <클론 코딩한 화면>
![](https://velog.velcdn.com/images/han090213/post/d79c07b1-efa7-472b-bc10-5066614cae18/image.png)

하단의 초록색 버튼을 클릭하면 provider class에 저장된 필드값들이 변경되고 이전 화면으로 돌아올 수 있도록 했다.

---

## 4. 그 외의 파일(공용 매서드와 Provider, 탭 관리 페이지)

### (1) CreditCardProvider

- [깃허브 : CreditCardProvider](https://github.com/sky688372-wq/Flutter_clone_practice_set/blob/main/clone12_Delivery%20App/lib/provider/credit_card_provider.dart)

```dart
import 'package:flutter/material.dart';

class CreditCardProvider extends ChangeNotifier {
  String cardNumber = "4747 4747 4747"; // 카드 넘버
  String nameOnCard = "Alex"; //이름
  String expireDate = "07/21"; //만료 날짜
  String cvc = "474"; //cvc

  // 카드 넘버 변경 함수
  void changeCardNumber(String newCardNumber, BuildContext context) {
    cardNumber = newCardNumber;

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.blue,
        content: Text('카드 번호 변경 완료'),
      ),
    );
    notifyListeners();
  }

  // 카드 이름 변경 함수
  void changeCardName(String newCardName, BuildContext context) {
    nameOnCard = newCardName;

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.blue,
        content: Text('이름 변경 완료'),
      ),
    );
    notifyListeners();
  }

  // 만료일 변경 함수
  void changeExpireDate(String newExpireDate) {
    expireDate = newExpireDate;
    notifyListeners();
  }

  // CVC 변경 함수
  void changeCvc(String newCvc) {
    cvc = newCvc;
    notifyListeners();
  }
}
```

>**해당 Provider 클래스를 이용해서 카드 정보를 관리했다.**

먼저 CreditCardProvider는 ChangeNotifier를 상속받도록 만들었다.

```dart
class CreditCardProvider extends ChangeNotifier{...}
```

>그리고 카드 번호, 카드 이름, 만료일, CVC를 각각 변수로 만들어 관리했다.

**이렇게 Provider에서 카드 정보를 관리하면 Credit Card 화면에서 변경한 데이터를 CheckOut 화면에서도 사용할 수 있다.**

각각의 데이터를 변경할 때는 별도의 함수를 만들어서 처리했다.

예를 들어 카드 번호를 변경할 때는 다음과 같이 changeCardNumber() 함수를 호출한다.

```dart
void changeCardNumber(String newCardNumber, BuildContext context) {
    cardNumber = newCardNumber;

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.blue,
        content: Text('카드 번호 변경 완료'),
      ),
    );
    notifyListeners();
  }
```

>여기서 notifyListeners()를 호출하는 것이 중요한데, ChangeNotifier는 데이터가 변경된 것을 듣고 있는 위젯에게 알려줄 수 있다. 따라서 Provider에서 값을 변경한 후 notifyListeners()를 호출하면 해당 Provider를 구독하고 있는 UI도 변경된 상태를 반영할 수 있다.

#### tip. 자세한 내용은 [제로부터 시작하는 플러터 : 상태 관리 라이브러리 provider](https://velog.io/@han090213/제로부터-시작하는-플러터-상태-관리-라이브러리-provider)글에서 볼 수 있다. 

실제 사용자가 Credit Card 화면에서 카드 정보를 변경할 때는 카드 번호만 변경하는 것이 아니라 카드 번호, 이름, 만료일, CVC를 입력한 뒤 USE THIS CARD 버튼을 눌러 한 번에 저장하는 구조로 되어 있다.

그렇다면 현재처럼 각각의 함수를 호출하기 보다는 한번에 모든 정보를 바꾸는 함수를 만드는 것이 좋았을 것 같다. 

```dart
void changeCreditCard({
  required String newCardNumber,
  required String newNameOnCard,
  required String newExpireDate,
  required String newCvc,
}) {
  cardNumber = newCardNumber;
  nameOnCard = newNameOnCard;
  expireDate = newExpireDate;
  cvc = newCvc;

  notifyListeners();
}
```

>**이렇게 했다면 사용자가 카드를 저장하는 하나의 동작과 Provider에서 상태를 변경하는 하나의 함수가 자연스럽게 연결되었을 것 같다.**

이번에는 Provider를 직접 사용해보는 것에 집중하다 보니 각각의 데이터를 변경하는 함수부터 먼저 만들었다.

하지만 실제 코드를 작성하고 다시 살펴보면서 상태를 어떤 단위로 변경해야 하는지까지 고민해야 한다는 것을 알게 되었다.

**단순히 Provider를 사용했다고 해서 코드가 무조건 깔끔해지는 것은 아니었다.**

>어떤 데이터를 하나의 상태로 볼 것인지, 그리고 그 상태를 어떤 단위로 변경할 것인지까지 생각해야 더 자연스러운 구조를 만들 수 있을 것 같다.

### (2) 탭 관리 화면

- [깃허브 : MainManageScreen](https://github.com/sky688372-wq/Flutter_clone_practice_set/blob/main/clone12_Delivery%20App/lib/home/main_manage_screen.dart)

기본적으로 앱이 바텀네비게이션 바를 이용해서 화면을 전환하는 형식이다보니 이를 위해 `IndexedStack`위젯을 이용해서 화면을 관리했다. 

```dart
import 'package:clone_pr/home/category_screen.dart';
import 'package:clone_pr/home/product_screen.dart';
import 'package:flutter/material.dart';

class MainManageScreen extends StatefulWidget {
  const MainManageScreen({super.key});

  @override
  State<MainManageScreen> createState() => _MainManageScreenState();
}

class _MainManageScreenState extends State<MainManageScreen> {
  int _currentIndex = 0; //현재 인덱스 페이지

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [CategoryScreen(), ProductScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.purpleAccent,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.grid_view_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(label: '', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
```

### (3) 공용 매서드 저장 클래스

- [깃허브 : AppFunctions](https://github.com/sky688372-wq/Flutter_clone_practice_set/blob/main/clone12_Delivery%20App/lib/function/app_functions.dart)

공용 매서드인 개발중임을 표현하는 `showBuilding`함수를 static매서드로 만든 뒤 직접 context를 받아서 사용할 수 있도록 했다.

```dart
import 'package:flutter/material.dart';

class AppFunctions {
  // 매개변수로 context를 넘겨받도록 하여서 static사용
  static void showBuilding(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.lightGreen,
        behavior: SnackBarBehavior.floating,
        content: Text(
          '현재 해당 기능은 개발중입니다.',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
```

---

## 마무리

오늘은 금요일이다. 월요일에 등교를 하고 드디어 집으로 돌아가는 날, 오늘은 JAVA수행평가와 다른 할일에 집중을 해야겠다.
