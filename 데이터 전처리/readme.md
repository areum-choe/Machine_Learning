# 연관분석_결과 매칭

- 연관분석 결과로 나온 item에 있는 코드와 본자료에 있는 저 코드가 해당하는 값을 찾아 매칭시켜주려고 한다.

![Untitled](%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%80%E1%85%AA%E1%86%AB%E1%84%87%E1%85%AE%E1%86%AB%E1%84%89%201aaff/Untitled.png)

![Untitled](%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%80%E1%85%AA%E1%86%AB%E1%84%87%E1%85%AE%E1%86%AB%E1%84%89%201aaff/Untitled%201.png)

### 1. ITEM에 있는 ‘⇒’이 문자를 기준으로 split해서 나눠줌

- code1값에 0번쨰 string값을 넣어줌

![Untitled](%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%80%E1%85%AA%E1%86%AB%E1%84%87%E1%85%AE%E1%86%AB%E1%84%89%201aaff/Untitled%202.png)

### 2. merge

- merge를 통해서 서로 다른 명칭의 이름을 가진 데이터 프레임을 how=’inner’을 통해 존재하는 값는만 추출

![Untitled](%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%80%E1%85%AA%E1%86%AB%E1%84%87%E1%85%AE%E1%86%AB%E1%84%89%201aaff/Untitled%203.png)