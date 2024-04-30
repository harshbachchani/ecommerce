import 'package:ecommerce/features/shop/models/banner_model.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/features/shop/models/product_attribute_model.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/models/product_variation_model.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/constants/image_string.dart';

class HDummyData {
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: HImages.banner1, targetScreen: HRoutes.order, active: false),
    BannerModel(
        imageUrl: HImages.banner2, targetScreen: HRoutes.cart, active: true),
    BannerModel(
        imageUrl: HImages.banner3,
        targetScreen: HRoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: HImages.banner4, targetScreen: HRoutes.search, active: true),
    BannerModel(
        imageUrl: HImages.banner5,
        targetScreen: HRoutes.settings,
        active: true),
    BannerModel(
        imageUrl: HImages.banner6,
        targetScreen: HRoutes.userAddress,
        active: true),
    BannerModel(
      imageUrl: HImages.banner8,
      targetScreen: HRoutes.checkout,
      active: false,
    ),
  ];
  // static final UserModel user=UserModel(id: id, firstName: firstName, lastName: lastName, email: email, username: username, phonenumber: phonenumber, profilePicture: profilePicture)

  // static final CartModel cart=CartModel();

  // static final List<OrderModel> orders=[];

  static final List<CategoryModel> categories = [
    //categories
    CategoryModel(
        id: '1', image: HImages.sportIcon, isFeatured: true, name: 'Sports'),
    CategoryModel(
        id: '5',
        image: HImages.furnitureIcon,
        isFeatured: true,
        name: 'Furniture'),
    CategoryModel(
        id: '2',
        image: HImages.electronicsIcon,
        isFeatured: true,
        name: 'Electronics'),
    CategoryModel(
        id: '3', image: HImages.clothIcon, isFeatured: true, name: 'Clothes'),
    CategoryModel(
        id: '4', image: HImages.animalIcon, isFeatured: true, name: 'Animals'),
    CategoryModel(
        id: '6', image: HImages.shoeIcon, isFeatured: true, name: 'Shoes'),
    CategoryModel(
        id: '7',
        image: HImages.cosmeticsIcon,
        isFeatured: true,
        name: 'Cosmetics'),
    CategoryModel(
        id: '14',
        image: HImages.jeweleryIcon,
        isFeatured: true,
        name: 'Jewellery'),
    CategoryModel(
        id: '15', image: HImages.toyIcon, isFeatured: false, name: 'Toys'),

    //subcategories
    CategoryModel(
      id: '8',
      image: HImages.sportIcon,
      isFeatured: false,
      name: 'Sports shoes',
      parentId: '1',
    ),

    CategoryModel(
      id: '9',
      image: HImages.sportIcon,
      isFeatured: false,
      name: 'Track Suits',
      parentId: '1',
    ),

    CategoryModel(
      id: '10',
      image: HImages.sportIcon,
      isFeatured: false,
      name: 'Sports Equipments',
      parentId: '1',
    ),

    //Furnitures
    CategoryModel(
      id: '11',
      image: HImages.furnitureIcon,
      isFeatured: false,
      name: 'Bedroom Furniture',
      parentId: '5',
    ),
    CategoryModel(
      id: '12',
      image: HImages.furnitureIcon,
      isFeatured: false,
      name: 'Kitchen Furniture',
      parentId: '5',
    ),
    CategoryModel(
      id: '12',
      image: HImages.furnitureIcon,
      isFeatured: false,
      name: 'Office Furniture',
      parentId: '5',
    ),

    //Electronics
    CategoryModel(
      id: '15',
      image: HImages.electronicsIcon,
      isFeatured: false,
      name: 'Laptop',
      parentId: '2',
    ),

    CategoryModel(
      id: '16',
      image: HImages.electronicsIcon,
      isFeatured: false,
      name: 'Mobile',
      parentId: '2',
    ),

    CategoryModel(
      id: '17',
      image: HImages.electronicsIcon,
      isFeatured: false,
      name: 'Earphones',
      parentId: '3',
    ),
  ];
  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Green Nike Sports Shoes',
      stock: 15,
      price: 10000,
      thumbanail: HImages.productImage1,
      productType: ProductType.variable.toString(),
      isFeatured: true,
      description: 'Green Nike Sports Shoes',
      brand: BrandModel(
          id: '1', name: 'Nike', image: HImages.nikeLogo, productsCount: 265),
      images: [
        HImages.productImage1,
        HImages.productImage23,
        HImages.productImage21,
        HImages.productImage9
      ],
      salePrice: 8000,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['UK 08', 'UK 09', 'UK 10'])
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 43,
          price: 9088,
          image: HImages.productImage1,
          description:
              'This is a product Description for Green Nike Sports shoes',
          attributesValues: {'color': 'Green', 'Size': 'UK 08'},
          salePrice: 8500,
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 9788,
          image: HImages.productImage23,
          description:
              'This is a product Description for Black Nike Sports shoes',
          attributesValues: {'color': 'Black', 'Size': 'UK 08'},
          salePrice: 8900,
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 11000,
          image: HImages.productImage23,
          description:
              'This is a product Description for Black Nike Sports shoes',
          attributesValues: {'color': 'Black', 'Size': 'UK 09'},
          salePrice: 10500,
        ),
        ProductVariationModel(
          id: '4',
          stock: 202,
          price: 13500,
          image: HImages.productImage1,
          description:
              'This is a product Description for Green Nike Sports shoes',
          attributesValues: {'color': 'Green', 'Size': 'UK 09'},
          salePrice: 12800,
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 14000,
          image: HImages.productImage21,
          description:
              'This is a product Description for Red Nike Sports shoes',
          attributesValues: {'color': 'Red', 'Size': 'UK 08'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 13000,
          image: HImages.productImage21,
          description:
              'This is a product Description for Red Nike Sports shoes',
          attributesValues: {'color': 'Red', 'Size': 'UK 09'},
        ),
      ],
    ),
    ProductModel(
      id: '002',
      title: 'Blue T-shirt for all ages',
      stock: 15,
      price: 1500,
      description:
          'This is a product description for Blue Zara Sleeves less vest.',
      brand: BrandModel(id: '6', image: HImages.zaraLogo, name: 'Zara'),
      thumbanail: HImages.productImage69,
      productType: ProductType.single.toString(),
      isFeatured: true,
      images: [
        HImages.productImage68,
        HImages.productImage69,
        HImages.productImage5
      ],
      salePrice: 1800,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['M', 'L']),
        ProductAttributeModel(name: 'Color', values: ['Green,Red,Blue'])
      ],
    ),
    ProductModel(
      id: '003',
      title: 'Leather Brown Jacket',
      stock: 15,
      price: 15000,
      description: 'This is a product description for Leather Brown Jacket',
      brand: BrandModel(id: '6', image: HImages.zaraLogo, name: 'Zara'),
      thumbanail: HImages.productImage69,
      productType: ProductType.single.toString(),
      isFeatured: true,
      images: [
        HImages.productImage64,
        HImages.productImage65,
        HImages.productImage66,
        HImages.productImage67,
      ],
      salePrice: 12999,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['M', 'L']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue'])
      ],
    ),
    ProductModel(
        id: '004',
        title: '4 Color collar t-shirt try fit',
        stock: 15,
        price: 2000,
        isFeatured: false,
        thumbanail: HImages.productImage60,
        productType: ProductType.variable.toString(),
        salePrice: 1509,
        description:
            'This is a Product description for 4 color collar t-shirt dry fit',
        brand: BrandModel(id: '6', name: 'ZARA', image: HImages.zaraLogo),
        images: [
          HImages.productImage60,
          HImages.productImage61,
          HImages.productImage62,
          HImages.productImage63
        ],
        sku: 'ABR4568',
        categoryId: '16',
        productAttributes: [
          ProductAttributeModel(
              name: 'Color', values: ['Red', 'Yellow', 'Green', 'Blue']),
          ProductAttributeModel(name: 'Size', values: ['M', 'L', 'XL']),
        ],
        productVariations: [
          ProductVariationModel(
            id: '1',
            attributesValues: {'Color': 'Red', 'Size': 'L'},
            stock: 34,
            price: 1400,
            salePrice: 1250,
            image: HImages.productImage60,
            description:
                'This is a Product description for 4 color collar t-shirt dry fit',
          ),
          ProductVariationModel(
            id: '2',
            attributesValues: {'Color': 'Red', 'Size': 'M'},
            stock: 15,
            price: 1600,
            salePrice: 1449,
            image: HImages.productImage60,
            description:
                'This is a Product description for 4 color collar t-shirt dry fit',
          ),
          ProductVariationModel(
            id: '3',
            attributesValues: {'Color': 'Yellow', 'Size': 'L'},
            stock: 0,
            price: 1600,
            salePrice: 1449,
            image: HImages.productImage61,
          ),
          ProductVariationModel(
            id: '4',
            attributesValues: {'Color': 'Yellow', 'Size': 'M'},
            stock: 15,
            price: 1700,
            salePrice: 1489,
            image: HImages.productImage61,
          ),
          ProductVariationModel(
            id: '5',
            attributesValues: {'Color': 'Green', 'Size': 'M'},
            stock: 15,
            price: 1600,
            salePrice: 1449,
            image: HImages.productImage62,
          ),
          ProductVariationModel(
            id: '6',
            attributesValues: {'Color': 'Green', 'Size': 'L'},
            stock: 15,
            price: 1600,
            salePrice: 1449,
            image: HImages.productImage62,
          ),
          ProductVariationModel(
            id: '7',
            attributesValues: {'Color': 'Blue', 'Size': 'M'},
            stock: 15,
            price: 1600,
            salePrice: 1449,
            image: HImages.productImage63,
          ),
          ProductVariationModel(
            id: '8',
            attributesValues: {'Color': 'Blue', 'Size': 'L'},
            stock: 15,
            price: 1600,
            salePrice: 1449,
            image: HImages.productImage63,
          ),
        ]),
    ProductModel(
      id: '005',
      title: 'Nike Air Jordan Shoes',
      stock: 15,
      price: 19000,
      description: 'This is a product description for Nike Air Jodan Shoes',
      brand: BrandModel(
        id: '1',
        image: HImages.nikeLogo,
        name: 'Nike',
        isFeatured: true,
        productsCount: 265,
      ),
      thumbanail: HImages.productImage10,
      productType: ProductType.single.toString(),
      isFeatured: false,
      images: [
        HImages.productImage7,
        HImages.productImage8,
        HImages.productImage9,
        HImages.productImage10,
      ],
      salePrice: 15999,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(
            name: 'Size', values: ['UK 08', 'UK 09', 'UK 10']),
        ProductAttributeModel(
            name: 'Color', values: ['Orange', 'Black', 'Brown']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 43,
          price: 15088,
          image: HImages.productImage7,
          description:
              'This is a product Description for Orange Nike Jordan shoes',
          attributesValues: {'color': 'Orange', 'Size': 'UK 08'},
          salePrice: 14000,
        ),
        ProductVariationModel(
          id: '2',
          stock: 13,
          price: 16088,
          image: HImages.productImage7,
          description:
              'This is a product Description for Orange Nike Jordan shoes',
          attributesValues: {'color': 'Orange', 'Size': 'UK 09'},
          salePrice: 15000,
        ),
        ProductVariationModel(
          id: '3',
          stock: 15,
          price: 12088,
          image: HImages.productImage8,
          description:
              'This is a product Description for Black Nike Sports shoes',
          attributesValues: {'color': 'Black', 'Size': 'UK 08'},
          salePrice: 10500,
        ),
        ProductVariationModel(
          id: '4',
          stock: 15,
          price: 13088,
          image: HImages.productImage8,
          description:
              'This is a product Description for Black Nike Sports shoes',
          attributesValues: {'color': 'Black', 'Size': 'UK 09'},
          salePrice: 12500,
        ),
        ProductVariationModel(
          id: '5',
          stock: 5,
          price: 19998,
          image: HImages.productImage9,
          description:
              'This is a product Description for Brown Nike Sports shoes',
          attributesValues: {'color': 'Brown', 'Size': 'UK 08'},
          salePrice: 16900,
        ),
        ProductVariationModel(
          id: '6',
          stock: 10,
          price: 19788,
          image: HImages.productImage9,
          description:
              'This is a product Description for Brown Nike Sports shoes',
          attributesValues: {'color': 'Brown', 'Size': 'UK 09'},
          salePrice: 18900,
        ),
      ],
    ),
  ];
}
