// ignore_for_file: subtype_of_sealed_class

import 'package:climb_logger/models/user_model.dart';
import 'package:climb_logger/services/ad_service.dart';
import 'package:climb_logger/state/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<AppStateBloc>(as: #MockBloc, returnNullOnMissingStub: true),
    MockSpec<AdService>(as: #MockAdService, returnNullOnMissingStub: true),
    MockSpec<DocumentSnapshot<UserModel>>(
        as: #MockUserDoc, returnNullOnMissingStub: true),
  ],
)
main() {}
