import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'bens.dart';

part 'serializers.g.dart';

@SerializersFor(const [Bens])
Serializers serializers = _$serializers;

final Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

Bens deserialize<Bens>(dynamic value) => standardSerializers
    .deserializeWith<Bens>(standardSerializers.serializerForType(Bens), value);

BuiltList<Bens> deserializeListOf<Bens>(dynamic value) => BuiltList.from(
    value.map((value) => deserialize<Bens>(value)).toList(growable: false));
