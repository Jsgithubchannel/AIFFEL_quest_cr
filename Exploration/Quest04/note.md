[배운 점]
- DCGAN의 기본 구조 설계 및 TensorFlow를 이용한 구현 방법을 학습함.
- 표준 GAN(Binary Crossentropy Loss 사용) 학습 시 발생할 수 있는 불안정성(Loss 진동, Accuracy 수렴 실패 등)을 확인함.
- WGAN-GP의 이론적 배경(Wasserstein 거리, Critic 역할, Gradient Penalty)을 이해하고, 이를 적용했을 때 학습 안정성이 크게 향상됨을 확인함.

[아쉬운 점]
- 초기 시도(BCELoss 기반)에서 Epoch 증가나 파라미터 튜닝만으로는 안정적인 학습 결과를 얻기 어려웠음.
- WGAN-GP로 안정성은 확보했으나, 최종 생성된 CIFAR-10 이미지의 클래스를 육안으로 명확히 구분하는 데에는 다소 한계가 있었을 수 있음.

[느낀 점]
- GAN 모델 학습은 매우 민감하여 안정적인 학습을 위해서는 Loss 함수 선택, 모델 구조, 하이퍼파라미터 튜닝 등 다양한 요소에 대한 고려와 실험이 필수적임을 느낌.
- WGAN-GP와 같은 개선된 기법이 실제 학습 안정화에 큰 도움이 된다는 것을 확인함.

[어려웠던 점]
- 초기 BCELoss 기반 GAN 학습 시 Loss 및 Accuracy 그래프의 불안정성 원인을 파악하고 해결하는 과정이 어려웠음.
- WGAN-GP의 개념(특히 Gradient Penalty)을 이해하고 코드에 정확히 구현하는 데 시간이 소요됨.

[영상]

![a](https://github.com/user-attachments/assets/b9f3af6c-f858-4ddd-ac8e-0ccfe71ac3a9)
