// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentList {
  String id;
  String name;
  String image;
  PaymentList({
    required this.id,
    required this.name,
    required this.image,
  });
}

List<PaymentList> paymentLists = [
  PaymentList(id: '1', name: 'EVC PLUS', image: ''),
  PaymentList(id: '2', name: 'Edahab', image: ''),
  PaymentList(id: '3', name: 'Primier Wallet', image: ''),
];

const String cachedUserResponseKey = "cachhUserResponse";

const appToken =
    '26a853ccceac011e4fa8a985df9a34cd0deee2cbb695c3501794050394661f9aa86acdccef9d39cd0c7f6f91cf334bf9466582cc387bece6526c6176efb5f538ea123dbfcc254d8fa3b9334dce27273e6d40ba467b9ffeba3d850b5f5e7757548eb933464850e69c19dbbf2bee1b82a8f33bdee4c51a935afaba8cee457b3f92';
