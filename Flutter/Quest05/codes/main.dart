import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // HTTP 요청을 위한 패키지
import 'dart:convert'; // JSON 인코딩/디코딩을 위한 라이브러리

// 앱의 진입점
void main() {
  runApp(const MyApp());
}

// 앱의 루트 위젯
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jellyfish Classifier',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const JellyfishClassifierPage(),
    );
  }
}

// 해파리 분류기 페이지 (상태 변경이 있으므로 StatefulWidget 사용)
class JellyfishClassifierPage extends StatefulWidget {
  const JellyfishClassifierPage({Key? key}) : super(key: key);

  @override
  _JellyfishClassifierPageState createState() =>
      _JellyfishClassifierPageState();
}

// 해파리 분류기 페이지의 상태를 관리하는 클래스
class _JellyfishClassifierPageState extends State<JellyfishClassifierPage> {
  String _predictedLabel = ''; // 예측된 해파리 종류 저장 변수
  String _predictionScore = ''; // 예측 확률 저장 변수
  bool _isLoading = false; // 로딩 상태 표시 변수

  // 서버에서 예측 결과를 가져오는 비동기 함수
  Future<void> _getPrediction() async {
    setState(() {
      _isLoading = true; // 로딩 상태 시작
    });

    try {
      // HTTP GET 요청으로 예측 결과 받아오기
      final response = await http.get(
        Uri.parse('https://12d3-34-169-95-17.ngrok-free.app/sample'),
      );

      if (response.statusCode == 200) {
        // 요청 성공 시
        final data = json.decode(response.body); // JSON 응답 디코딩
        setState(() {
          _predictedLabel = data['predicted_label']; // 예측된 해파리 종류 설정
          _predictionScore = data['prediction_score']; // 예측 확률 설정
        });

        // 디버그 콘솔에 예측 클래스 출력
        debugPrint('예측된 해파리 클래스: $_predictedLabel');
      } else {
        debugPrint('서버 오류: ${response.statusCode}'); // 서버 오류 발생 시 로그
        setState(() {
          _predictedLabel = '오류 발생';
          _predictionScore = '';
        });
      }
    } catch (e) {
      debugPrint('예외 발생: $e');
      setState(() {
        _predictedLabel = '연결 오류';
        _predictionScore = '';
      });
    } finally {
      setState(() {
        _isLoading = false; // 로딩 상태 종료
      });
    }
  }

  // 예측 확률을 콘솔에 표시하는 함수
  void _showPredictionScore() {
    if (_predictionScore.isNotEmpty) {
      // 디버그 콘솔에 예측 확률 출력
      debugPrint('예측 확률: $_predictionScore');
    } else {
      debugPrint('먼저 예측을 실행해주세요.'); // 예측 실행 전 안내 메시지
    }
  }

  @override
  Widget build(BuildContext context) {
    // 화면 UI 구성
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jellyfish Classifier'),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.water, size: 32),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Image.asset(
                          'assets/jellyfish_img.png',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Text(
                                '이미지를 불러올 수 없습니다.\n"assets/jellyfish_img.png" 파일을 확인해주세요.',
                                textAlign: TextAlign.center,
                              ),
                            );
                          },
                        ),
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _getPrediction,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    child: const Text('해파리 종류 예측'),
                  ),
                  ElevatedButton(
                    onPressed: _showPredictionScore,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    child: const Text('예측 확률 확인'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // 예측 결과 표시 (결과가 있을 때만 표시)
              if (_predictedLabel.isNotEmpty)
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          '예측 결과',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('해파리 종류: $_predictedLabel'),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
