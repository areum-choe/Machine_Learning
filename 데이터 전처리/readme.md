- **원본데이터**
    
    [가공전.csv](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/073198bc-e7ba-42c4-ae5f-b4c88c69312f/가공전.csv)
    
    - 아래 데이터의 OrderID에는 중복된 아이디가 존재. 아이디의 unique한 값으로
    PeodCd를 가로 형태로 나열.
    - 연관분석을 하기 위해 한 고객(ID)가 구매한 제품의 패턴을 파악.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a429b06b-b484-4b03-ab66-52adda00360d/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7b55f8e3-0731-4d34-9b20-f6149222ac34/Untitled.png)

### 1. 데이터 불러오기

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b3b097a9-2b20-49ee-81dd-2a0d76bdeb95/Untitled.png)

### 2. groupby

- groupby사용해서 orderid를  그룹으로 묶고 prodcd를 apply함수를 이용해 리스트 형태로 만듦  > reset_index를 통해 만들어진 리스트의 dataframe이름을new로 정해줌.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d1622e48-3f1f-4d61-be7e-b131513ef227/Untitled.png)

**여기까지 dataframe한개 > df3**

---

### 1. 원본데이터에서 ordeid 개수 세기

- 원본데이터에서 orderid를 그룹으로 묶고 인덱스는 reset하기 위해 False사용. count()를 이용하여 id값이 몇번 사용되었는지 세줌.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e60adf01-0a45-43d8-9776-8b227bc12fe4/Untitled.png)

### 2. 중복 2개 이상 추출 작업

- a를 실행하면 false와 true형식으로 나옴 이걸 df에 넣어줘야 true인 값만 빼줌.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c3607597-a74f-4a5c-8da2-6794106c3cb1/Untitled.png)

**여기까지 dataframe한개 > df**

---

### 1. merge사용해서 dataframe 2개 합치기

- on은 통해 공통적인 것을 묶음

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/855267fe-c270-4eb8-a45f-f22ab1ba1f60/Untitled.png)

### 2. new안에 있는 리스트를 한개씩 분리하는 작업

- new열을 apply함수를 사용해서

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1a4cc873-0a1b-4fba-99f2-0b4b8258d2cf/Untitled.png)

### 3. 마지막 new dataframe과 merge_outer를  인덱스대로 합쳐주면 끝 !

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f19747cf-66a2-449f-8673-802a4d4dbdc5/Untitled.png)

[연관분석_아이코드몰최종.csv](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b83d7308-0f55-4e02-96b4-b6f9d0fe11a4/연관분석_아이코드몰최종.csv)
