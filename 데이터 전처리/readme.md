# 연관분석_결과 매칭

- 연관분석 결과로 나온 item에 있는 코드와 본자료에 있는 저 코드가 해당하는 값을 찾아 매칭시켜주려고 한다.

<img src="https://s3-us-west-2.amazonaws.com/secure.notion-static.com/12b84096-852c-4579-9ed1-2f7f52abd20c/Untitled.png">

### 1. ITEM에 있는 ‘⇒’이 문자를 기준으로 split해서 나눠줌

- code1값에 0번쨰 string값을 넣어줌


![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/12b84096-852c-4579-9ed1-2f7f52abd20c/Untitled.png)
### 2. merge

- merge를 통해서 서로 다른 명칭의 이름을 가진 데이터 프레임을 how=’inner’을 통해 존재하는 값는만 추출

