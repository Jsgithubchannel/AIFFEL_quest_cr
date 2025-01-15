# AIFFEL Campus Online Code Peer Review Templete
- 코더 : 홍지수
- 리뷰어 : 민유경


# PRT(Peer Review Template)
- [x]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 정수를 연산하는 파이썬 계산기가 잘 완성되었어요. 
  ![image](https://github.com/user-attachments/assets/79249d21-109e-48b5-abbd-305f5f677b56)

    
- [x]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
      - 로직을 먼저 짚어줌으로써 코드가 어떤 방향성으로 진행될 것인지 알려준 것이 핵심적으로 좋았어요!
  ![image](https://github.com/user-attachments/assets/db06e059-f87e-42ef-ba17-8d388328b0de)

        
- [x]  **3. 에러가 난 부분을 디버깅하여 문제를 해결한 기록을 남겼거나
새로운 시도 또는 추가 실험을 수행해봤나요?**
    - 1에서 정수가 잘못입력되었을 때 뿐 아니라, 연산자를 입력하게 한 경우 이가 지정된 연산자가 아닐때 어떻게 해야될까에 대한 새로운시도가 좋아요.
    - 연산자가 잘못 입력된 경우 다시 연산자 과정부터 재입력할 수 있는 과정 저도 궁금해지네요. 
    ![image](https://github.com/user-attachments/assets/39bb0a9b-9fb5-4a5b-82ee-9e4c23df9a7a)

        
- [ ]  **4. 회고를 잘 작성했나요?**
   ![image](https://github.com/user-attachments/assets/08c8a34e-9e80-4dd7-8a66-4121d40ec3e2)
   - 예외처리의 중요성을 인지하고 이를 놓치지 않았으면 좋겠다는 내용이 담겨 있는데, 구체적으로 어느과정이 어려웠고 이를 어떻게 풀어나갔는지에 대한 상세한 기록이 있다면 리뷰어로서도 참고할 수 있는 좋은 공부가 될 것 같아요.! 
        
- [x]  **5. 코드가 간결하고 효율적인가요?**
    - 파이썬 스타일 가이드 (PEP8) 를 준수하였는지 확인
    - 코드 중복을 최소화하고 범용적으로 사용할 수 있도록 함수화/모듈화했는지 확인
        - 중요! 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부
        - ![image](https://github.com/user-attachments/assets/cc9be77e-7d28-49a5-b61b-f0a05b63f371)

    

# 회고(참고 링크 및 코드 개선)
코드는 간결하지만 뭔가 진행하면서 조금 고민이 많았을 것처럼 느껴지는 코드 였습니다.
제가 팀원들과 코드를 진행하면서 알게 된 팁들을 바탕으로 코드개선의견을 드리자면,

#1
![image](https://github.com/user-attachments/assets/38ad1d3d-b8cf-4a28-beb6-03ad235e82b3)
아래 네모에서
![image](https://github.com/user-attachments/assets/a2961284-947a-4a52-98d8-25e5d09a7304)
요롷게 **(거듭제곱 연산자)도 정의해주시기만 하면 import.math 안해도 되서 제거가 가능해요!

#2
![image](https://github.com/user-attachments/assets/24c9dc86-fec9-4dde-8d79-9585ca029141)
이건 저희 팀의 이슈였어서 지수님의 파이썬 계산기에도 적용해서 실험해봤는데요.
'-2'(음의 정수)를 정수라고 인지하지 못하는 상황이 발생하더라구요.. ㅠㅠ
이 때는 이걸 쓰래요.... 저희 chatGPT 선생님의 말씀을 공유드려봅니다. ㅎㅎ 이거 쓰면 -2도 정수로 인식하고 계산해줘요!
![image](https://github.com/user-attachments/assets/0dc962f5-8ed2-4d82-8949-6f86a67a3cdf)

그리고 새로운시도 부분에서 연산자가 잘못 입력된 경우에 연산자를 재기입하면 그대로 프로그램이 구동되도록 해도 좋을 것 같아요.
 
```
