Dart Protobuf Example

To generate the dart file from the proto: 
```sh
protoc -I=$SRC_DIR --dart_out=$DST_DIR $SRC_DIR/person.proto
```

Run the dart file with the `person_list.data` as an argument:
```sh 
dart main.dart person_list.data
```
