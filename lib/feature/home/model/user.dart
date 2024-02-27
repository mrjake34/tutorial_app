import 'package:json_annotation/json_annotation.dart';

import '../../../product/core/model/base_model.dart';
import 'address.dart';
import 'company.dart';

/// [User] sınıfının json serileştirme işlemleri için generate dosyası.
part 'user.g.dart';

/// [JsonSerializable] özelleştirebilmek için kullanılan bir yapıcı metot.
/// [checked] parametresi ile json dosyasındaki verilerin null olup olmadığı kontrol edilir.
/// [explicitToJson] parametresi ile toJson metodu kullanılırken, [Map<String, dynamic>] döndürülür.
@JsonSerializable(
  checked: true,
  explicitToJson: true,
)

/// [User] sınıfı [BaseModel] sınıfından türetilmiştir.
/// Bu sebeple [BaseModel] sınıfındaki metotlar bu sınıf içerisinde kullanılabilir.
final class User extends BaseModel<User> {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  /// [User] sınıfının yapıcı metodu.
  /// Bu metot ile sınıfın değişkenlerine değer ataması yapılır.
  const User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  /// [copyWith] metodu ile sınıfın kopyası oluşturulur.
  /// Bu metot ile sınıfın içerisindeki değişkenlerin değerleri değiştirilir.
  /// final olarak tanımlanan değişkenlerin değerleri doğrudan değiştirilemez.
  /// Bu sebeple bu metot ile yeni bir sınıf oluşturulur ve bu sınıfın değişkenleri değiştirilir.
  User copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
    );
  }

  /// [User] sınıfının json serileştirme işlemleri için metotlar.
  /// [User] sınıfını ve içerisinde ki değerleri [Map]'e çevrilir ve geriye bir [Map] döndürür.
  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  /// [User] sınıfının json serileştirme işlemleri için metotlar.
  /// [json]'dan gelen verileri [User] sınıfına çevirir ve geriye bir [User] sınıfı döndürür.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// [fromJson] metodu [User.fromJson()] metodunu kullanarak [json] veriyi [User] sınıfına çevirir.
  @override
  User fromJson(json) => User.fromJson(json);

  /// [props] metodu ile sınıfın içerisindeki değişkenlerin değerleri listelenir.
  /// Bu metot ile sınıfın içerisindeki değişkenlerin değerleri karşılaştırılır.
  /// Eğer değişkenlerin değerleri birbirine eşitse, bu değişkenler aynı kabul edilir.
  /// Bu metot olmadan karşılaştırma yapılırsa, sınıfın içerisindeki değişkenlerin referansları karşılaştırılır.
  /// Bu sebeple değişkenlerin değerleri aynı olsa bile, referansları farklı olduğu için eşit kabul edilmez.
  /// Bu metot ile değişkenlerin değerleri karşılaştırıldığı için, değişkenlerin referanslarına bakılmaz.
  /// Bu sebeple değişkenlerin değerleri aynı olsa bile, referansları farklı olsa bile eşit kabul edilir.
  @override
  List<Object?> get props => [
        id,
        name,
        username,
        email,
        address,
        phone,
        website,
        company,
      ];

  /// [empty] metodu ile sınıfın içerisindeki değişkenlerin değerleri boş bir şekilde döndürülür.
  factory User.empty() {
    return User(
      id: 0,
      name: '',
      username: '',
      email: '',
      address: Address.empty(),
      phone: '',
      website: '',
      company: Company.empty(),
    );
  }
}
