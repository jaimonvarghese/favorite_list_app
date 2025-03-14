
import 'package:uuid/uuid.dart';

const uuid = Uuid();
class Place {
  final String id;
  final String tittle;

  Place({required this.tittle}):id = uuid.v4();
}