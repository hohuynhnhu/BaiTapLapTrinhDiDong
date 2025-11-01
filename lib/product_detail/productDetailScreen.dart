import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Map<String, dynamic>? product;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  Future<void> fetchProduct() async {
    const url = 'https://mock.apidog.com/m1/890655-872447-default/v2/product';

    try {
      final response = await http.get(Uri.parse(url));
      debugPrint('API status: ${response.statusCode}');
      debugPrint('Raw data: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data is Map<String, dynamic>) {
          setState(() {
            product = data;
            isLoading = false;
          });
        } else {
          debugPrint('Dữ liệu không đúng định dạng Map');
          setState(() => isLoading = false);
        }
      } else {
        debugPrint('Lỗi server: ${response.statusCode}');
        setState(() => isLoading = false);
      }
    } catch (e) {
      debugPrint('Lỗi khi gọi API: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : product == null
            ? const Center(child: Text('Không tải được sản phẩm.'))
            : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Thanh tiêu đề
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.lightBlue,
                        size: 22,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Product detail",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),

                const SizedBox(height: 10),

                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    product?['imgURL'] ??
                        'https://via.placeholder.com/400x300',
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 16),

                // Tên sản phẩm
                Text(
                  product?['name'] ?? 'Tên sản phẩm không xác định',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.left,
                ),

                const SizedBox(height: 10),

                // Giá
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Giá: ${product?['price'] ?? 'N/A'} ₫',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Mô tả
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    product?['des'] ??
                        'Không có mô tả cho sản phẩm này.',
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
//
// class ProductDetailPage extends StatelessWidget {
//   const ProductDetailPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(
//                         Icons.arrow_back_ios_new,
//                         color: Colors.lightBlue,
//                         size: 22,
//                       ),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//
//                     const Expanded(
//                       child: Center(
//                         child: Text(
//                           "Product detail",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.lightBlue,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 48), // để cân đối với nút back
//                   ],
//                 ),
//
//                 const SizedBox(height: 10),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(16),
//                   child: Image.asset(
//                     'assets/shoes.jpg', // đổi link ảnh thật của bạn
//                     width: double.infinity,
//                     height: 250,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//
//                 const SizedBox(height: 16),
//
//                 // Tiêu đề sản phẩm
//                 const Text(
//                   'Giày Nike Nam Nữ Chính Hãng - Nike Air Force 1 \'07 LV8 - Màu Trắng | JapanSport HF2898-100',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     height: 1.4,
//                   ),
//                   textAlign: TextAlign.left,
//                 ),
//
//                 const SizedBox(height: 10),
//
//                 // Giá
//                 const Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Giá: 4.000.000₫',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red,
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 10),
//
//                 // Mô tả sản phẩm
//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade100,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: const Text(
//                     'Với giày chạy bộ, từng gram đều quan trọng. Đó là lý do tại sao đế giữa LIGHTSTRIKE PRO mới nhẹ hơn so với phiên bản trước. Miếng foam đế giữa siêu nhẹ và thoải mái này có lớp đệm đàn hồi được thiết kế để hạn chế tiêu hao năng lượng. Trong các mẫu giày tập luyện, công nghệ này được thiết kế nhằm hỗ trợ cơ bắp của vận động viên để họ có thể phục hồi nhanh hơn giữa các cuộc đua.',
//                     style: TextStyle(
//                       fontSize: 13,
//                       height: 1.5,
//                       color: Colors.black87,
//                     ),
//                     textAlign: TextAlign.justify,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
