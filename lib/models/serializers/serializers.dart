import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'bens_old.dart';

part 'serializers.g.dart';

@SerializersFor(const [BensOLD])
Serializers serializers = _$serializers;

final Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

BensOLD deserialize<BensOLD>(dynamic value) =>
    standardSerializers.deserializeWith<BensOLD>(
        standardSerializers.serializerForType(BensOLD), value);

BuiltList<BensOLD> deserializeListOf<BensOLD>(dynamic value) => BuiltList.from(
    value.map((value) => deserialize<BensOLD>(value)).toList(growable: false));
