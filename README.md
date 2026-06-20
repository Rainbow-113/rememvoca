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
## 📸 Hình ảnh demo
### Đăng ký & Đăng nhập
<p align="center">
  <img src="https://github.com/user-attachments/assets/7e4b6e37-041b-498c-a7a2-4990edee9d46" width="250" />
  <img src="https://github.com/user-attachments/assets/65b11b98-5c69-40b0-aa81-b47627553f9a" width="250" />
</p>
### Trang chủ , DrawerMenu
<p align="center">
   <img src="https://github.com/user-attachments/assets/7af36051-5c27-4333-b334-6f188dcad6ae" width="250" />
  <img src="https://github.com/user-attachments/assets/d6e36646-5c02-4425-8cf4-82ae3cd7a421" width="250" />
</p>
### Quản lí folder , creat folder
<p align="center">
   <img src="https://github.com/user-attachments/assets/ce160921-50ef-4f55-9b6c-ed5b74fee2ef" width="250" />
  <img src="https://github.com/user-attachments/assets/27d43597-2930-4dc7-9e51-0de7944cd328" width="250" />
</p>
###  Quản lí cart , creat cart, search, delete
<p align="center">
  <img src="https://github.com/user-attachments/assets/7eed9525-2887-451b-b838-4f3cd99f5148" width="250" />
  <img src="https://github.com/user-attachments/assets/90ba4b5c-5820-4fa7-ae9f-17c2a69de3b9" width="250" />
   <img width="250" alt="Screenshot_12" src="https://github.com/user-attachments/assets/db7478d0-ca54-4067-825e-50ba675f2cdd" />
   <img width="250" alt="image" src="https://github.com/user-attachments/assets/e71b7773-35ae-4435-8bb0-5da5488c3a40" />


</p>

### Cart 
<p align="center">
   -Mặt Trước 
  <img src="https://github.com/user-attachments/assets/b9f96d20-8216-4a58-8a18-569478ed1bb9" width="250" />
    -Mặt Sau  
  <img src="https://github.com/user-attachments/assets/b63f7cd7-f808-455e-a34c-19d69f98e681" width="250" />
</p>
### User detail 
<p align="center">
  <img src="https://github.com/user-attachments/assets/3ec22577-6411-40ca-b6f0-a1735eea307a" width="250" />
</p>


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
