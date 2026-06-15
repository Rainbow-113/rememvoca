import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rememvoca/Provider/auth_provider.dart';
import 'package:rememvoca/Model/user_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controller cho từng field
  final _nameController     = TextEditingController();
  final _emailController    = TextEditingController();
  final _passwordController = TextEditingController();


  bool _obscurePassword = true;


  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    //
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //   đăng ký

  Future<void> _onRegister() async {
    // Validate tất cả field trước khi gọi API
    if (!_formKey.currentState!.validate()) return;

    final authProvider = context.read<AuthProvider>();

    final success = await authProvider.register(
      RegisterRequest(
        name:     _nameController.text.trim(),
        email:    _emailController.text.trim(),
        password: _passwordController.text,
      ),
    );

    if (!mounted) return;

    if (success) {
      // Đăng ký thành công → về màn Home
      Navigator.pushReplacementNamed(context, '/home');
    }
    // Nếu thất bại, lỗi đã được lưu trong authProvider.errorMessage
    // và hiển thị qua Consumer bên dưới
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [



                  const Text(
                    'RememVoca',
                    style: TextStyle(
                      color: Color(0xFF7C6FCD),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Tạo tài khoản',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Bắt đầu học từ vựng hiệu quả hơn',
                    style: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 36),



                  _buildLabel('Họ và tên'),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller:  _nameController,
                    hint:        'Nguyễn Văn A',
                    prefixIcon:  Icons.person_outline,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Vui lòng nhập họ tên';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  //

                  _buildLabel('Email'),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller:    _emailController,
                    hint:          'example@email.com',
                    prefixIcon:    Icons.email_outlined,
                    keyboardType:  TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Vui lòng nhập email';
                      }
                      // Kiểm tra định dạng email cơ bản
                      if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value.trim())) {
                        return 'Email không hợp lệ';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  //

                  _buildLabel('Mật khẩu'),
                  const SizedBox(height: 8),
                  _buildTextField(
                    controller:    _passwordController,
                    hint:          'Tối thiểu 6 ký tự',
                    prefixIcon:    Icons.lock_outline,
                    obscureText:   _obscurePassword,
                    // Nút hiện/ẩn mật khẩu
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: const Color(0xFF666666),
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập mật khẩu';
                      }
                      if (value.length < 6) {
                        return 'Mật khẩu phải có ít nhất 6 ký tự';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 28),

                  //

                  Consumer<AuthProvider>(
                    builder: (_, auth, __) {
                      if (auth.errorMessage == null) return const SizedBox.shrink();
                      return Container(
                        margin:  const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color:        const Color(0xFF2D1B1B),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFF5C2626)),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.error_outline,
                                color: Color(0xFFE57373), size: 18),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                auth.errorMessage!,
                                style: const TextStyle(
                                    color: Color(0xFFE57373), fontSize: 13),
                              ),
                            ),

                            GestureDetector(
                              onTap: () => auth.clearError(),
                              child: const Icon(Icons.close,
                                  color: Color(0xFFE57373), size: 16),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  //

                  Consumer<AuthProvider>(
                    builder: (_, auth, __) {
                      return SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: auth.isLoading ? null : _onRegister,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7C6FCD),
                            disabledBackgroundColor:
                            const Color(0xFF7C6FCD).withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: auth.isLoading
                          // Đang gọi API → hiện loading
                              ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                              : const Text(
                            'Đăng ký',
                            style: TextStyle(
                              color:      Colors.white,
                              fontSize:   16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  //

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Đã có tài khoản?',
                        style: TextStyle(color: Color(0xFF888888), fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(left: 6),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(
                            color:      Color(0xFF7C6FCD),
                            fontSize:   14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //


  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color:      Color(0xFFCCCCCC),
        fontSize:   13,
        fontWeight: FontWeight.w500,
      ),
    );
  }


  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText           = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller:   controller,
      keyboardType: keyboardType,
      obscureText:  obscureText,
      validator:    validator,
      style: const TextStyle(color: Colors.white, fontSize: 15),
      decoration: InputDecoration(
        hintText:      hint,
        hintStyle:     const TextStyle(color: Color(0xFF555555), fontSize: 14),
        prefixIcon:    Icon(prefixIcon, color: const Color(0xFF666666), size: 20),
        suffixIcon:    suffixIcon,
        filled:        true,
        fillColor:     const Color(0xFF1A1A1A),
        // Border bình thường
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:   const BorderSide(color: Color(0xFF2A2A2A)),
        ),
        // Border khi focus
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:   const BorderSide(color: Color(0xFF7C6FCD)),
        ),
        // Border khi có lỗi validate
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:   const BorderSide(color: Color(0xFFE57373)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:   const BorderSide(color: Color(0xFFE57373)),
        ),
        errorStyle: const TextStyle(color: Color(0xFFE57373), fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 14),
      ),
    );
  }
}