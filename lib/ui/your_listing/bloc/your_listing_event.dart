// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class YourListingEvent {}

class GetMyListings extends YourListingEvent {}

class DeleteMyListings extends YourListingEvent {
  String id;
  DeleteMyListings({
    required this.id,
  });
}
