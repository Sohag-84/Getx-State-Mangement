import 'package:e_commerce/app/model/product_model.dart';
import 'package:e_commerce/app/modules/cart/controllers/cart_controller.dart';

import 'package:e_commerce/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/category_controller.dart';
import '../widgets/category_action_icon.dart';

import '../widgets/product_container.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          "Fruits & Vegetables",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          actionIconWidget(
            icon: Icons.dark_mode_outlined,
          ),
          SizedBox(width: 10.w),
          actionIconWidget(
            icon: Icons.favorite_border,
          ),
          SizedBox(width: 5.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: FutureBuilder<List<ProductModel>>(
            future: controller.fetchedProduct(),
            builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No data available'));
              } else {
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.w,
                    mainAxisSpacing: 10.h,
                    mainAxisExtent: 280.h,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final data = snapshot.data![index];
                    return GetBuilder<CartController>(
                        init: CartController(),
                        builder: (CartController cartController) {
                          return productContainer(
                            isButtonClicked: data.isBtnClicked,
                            addToCartTap: () {
                              cartController.addToCart(product: data);
                              cartController.isButtonClicked(data);
                            },
                            incrementTap: () {
                              cartController.increaseQuantity(id: data.id!);
                            },
                            decrementTap: () {
                              cartController.decreaseQuantity(id: data.id!);
                            },
                            cartItem: cartController.quantity(id: data.id!),
                            proImage: "assets/images/apple.png",
                            proDiscountImage: "assets/images/discount.png",
                            proDiscount: data.discountType == "percentage"
                                ? "${data.discountAmount}% OFF"
                                : data.discountType == "fixedAmount"
                                    ? "TAKA ${data.discountAmount} OFF"
                                    : null,
                            plasticStatus: data.isPlastic!
                                ? data.plasticType!.name!
                                : "PLASTIC FREE",
                            proStock: data.quantity!,
                            proName: "${data.name}",
                            proWeight: data.productWeight,
                            proNewPrice: "${data.price}",
                            proOldPrice: "150",
                          );
                        });
                  },
                );
              }
            }),
      ),
    );
  }
}
