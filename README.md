# ABO - 야구 판타지 리그 앱

ABO는 야구 판타지 리그를 위한 Flutter 기반 모바일/웹 앱입니다.  
구단주(매니저)와 선수 데이터를 관리하고, 경기 일정 및 결과, 랭킹, 트레이드 등 리그 운영에 필요한 기능을 제공합니다.

---

## 주요 기능

- **경기 결과 조회** — 날짜별 경기 점수 및 라인업 확인
- **캘린더** — 일정 기반 경기 탐색
- **랭킹** — 구단주 및 선수 랭킹 조회
- **로스터 관리** — 팀 선수 등록 및 포지션 배치
- **트레이드** — 트레이드 가능 선수 목록 및 신청
- **회원 인증** — 이메일 로그인, 회원가입, 비밀번호 변경, 생체 인증(지문/Face ID)
- **설정** — 앱 환경 설정 및 계정 관리
- **로컬 알림** — 경기 일정 푸시 알림

---

## 기술 스택

| 분류 | 라이브러리 |
|------|-----------|
| 프레임워크 | Flutter 3.10+ / Dart 3.0+ |
| 상태 관리 | Riverpod 2.x + riverpod_generator |
| 네비게이션 | auto_route |
| 네트워크 | Dio + Retrofit |
| 백엔드 | Firebase (Core, Firestore) |
| 모델 | Freezed + json_serializable |
| 보안 | flutter_secure_storage, encrypt, local_auth |
| UI | flutter_svg, shimmer, cached_network_image, lottie |
| 알림 | flutter_local_notifications |
| 에셋 자동생성 | flutter_gen |

---

## 프로젝트 구조

```
lib/
├── main.dart                  # 앱 진입점
├── app.dart                   # MaterialApp 설정
├── common/                    # 공통 유틸, 상수, 확장 함수
├── gen/                       # flutter_gen 자동 생성 에셋
├── source/
│   ├── controller/            # Riverpod 컨트롤러 (비즈니스 로직)
│   ├── domain/                # Freezed 모델 (데이터 구조)
│   ├── repository/            # API / Firebase 데이터 레이어
│   └── view/
│       ├── page/              # 화면 단위 위젯
│       └── widget/            # 재사용 위젯
└── ui/
    ├── route/                 # auto_route 라우팅 설정
    └── theme/                 # 컬러, 텍스트 테마
```

---

## 시작하기

### 요구 사항

- Flutter SDK `>=3.10.0`
- Dart SDK `>=3.0.0`
- Firebase 프로젝트 연결 (`google-services.json` / `GoogleService-Info.plist`)

### 설치 및 실행

```bash
# 의존성 설치
flutter pub get

# 코드 생성 (Freezed, Riverpod, Retrofit, auto_route)
dart run build_runner build --delete-conflicting-outputs

# 앱 실행
flutter run
```

### 아이콘 / 스플래시 생성

```bash
dart run flutter_launcher_icons
dart run flutter_native_splash:create
```

---

## 버전

현재 버전: **0.3.2+11** (beta)
