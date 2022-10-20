import 'dart:typed_data';

class PaymentData {
  String address;
  Uint8List hash;
  Uint8List output;
  Uint8List signature;
  Uint8List pubkey;
  Uint8List input;
  List<Uint8List> witness;

  PaymentData(
      {required this.address,
      required this.hash,
      required this.output,
      required this.pubkey,
      required this.input,
      required this.signature,
      required this.witness});

  @override
  String toString() {
    return 'PaymentData{address: $address, hash: $hash, output: $output, signature: $signature, pubkey: $pubkey, input: $input, witness: $witness}';
  }
}
