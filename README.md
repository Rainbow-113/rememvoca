# Rememvoca

**Rememvoca** là ứng dụng học từ vựng bằng flashcard, được xây dựng với Flutter (frontend) và kết nối tới backend [FlashCartApi](https://github.com/Rainbow-113/FlashCartApi) (ASP.NET Core + MongoDB Atlas).

Đây là repo **frontend** của dự án. Repo backend nằm tại: [Rainbow-113/FlashCartApi](https://github.com/Rainbow-113/FlashCartApi).

## Giới thiệu

Rememvoca giúp người dùng tạo, quản lý và ôn tập từ vựng thông qua hệ thống folder và flashcard, hỗ trợ tìm kiếm nhanh, theo dõi tiến trình học và tổ chức từ vựng theo chủ đề.

## Tính năng chính

- Quản lý folder từ vựng: tạo, sửa, xóa, tổ chức theo chủ đề
- Tạo và quản lý flashcard (từ vựng, nghĩa, ví dụ...)
- Học từ vựng qua chế độ flashcard (lật thẻ, ôn tập)
- Tìm kiếm từ vựng và folder
- Đồng bộ dữ liệu với backend qua REST API

## Công nghệ sử dụng

- **Framework:** Flutter / Dart
- **Quản lý state:** Provider
- **Giao tiếp API:** HTTP REST, kết nối tới backend ASP.NET Core
- **Backend:** [FlashCartApi](https://github.com/Rainbow-113/FlashCartApi) (ASP.NET Core + MongoDB Atlas)

## Kiến trúc

Dự án tổ chức theo hướng feature-first, tách lớp rõ ràng:

```
Service → Provider → Screen
```

- **Service**: gọi API tới backend, xử lý dữ liệu thô
- **Provider**: quản lý state, xử lý logic nghiệp vụ cho UI
- **Screen**: hiển thị UI, lắng nghe thay đổi từ Provider

### Cấu trúc thư mục (lib/)

```
lib/
├── models/         # Định nghĩa các model dữ liệu (folderModel, wordModel, ...)
├── services/        # Gọi API tới backend
├── providers/        # Quản lý state (ChangeNotifier)
├── screens/          # Các màn hình UI theo từng feature
├── shares/           # Widget, hàm dùng chung
└── main.dart
```

## Yêu cầu

- Flutter SDK (kênh stable)
- Đã cài Android Studio / Xcode để build trên thiết bị/giả lập
- Backend [FlashCartApi](https://github.com/Rainbow-113/FlashCartApi) đang chạy (local hoặc deploy) để app có dữ liệu

## Cài đặt và chạy

1. Clone repo:
   ```bash
   git clone https://github.com/Rainbow-113/rememvoca.git
   cd rememvoca
   ```

2. Cài dependencies:
   ```bash
   flutter pub get
   ```

3. Cấu hình địa chỉ API backend trong file cấu hình tương ứng (ví dụ base URL trỏ tới FlashCartApi đang chạy).

4. Chạy ứng dụng:
   ```bash
   flutter run
   ```

## Kết nối với Backend

Ứng dụng cần backend FlashCartApi để hoạt động đầy đủ (đăng nhập, lưu folder, từ vựng...). Clone và chạy backend theo hướng dẫn tại repo [FlashCartApi](https://github.com/Rainbow-113/FlashCartApi) trước khi sử dụng app.

## Trạng thái dự án

Dự án đang trong quá trình phát triển, phục vụ mục tiêu xây dựng portfolio cá nhân và làm dự án full-stack hoàn chỉnh.

## Tác giả

Phát triển bởi [Rainbow-113](https://github.com/Rainbow-113).
