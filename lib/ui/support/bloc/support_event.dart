abstract class SupportEvent {
  const SupportEvent();
}

class CreateIssue extends SupportEvent {
  final String issue;

  CreateIssue({required this.issue});
}
