enum NotificationType {
  videoCall,
  videoRespondAccepted,
  videoRespondRejected,
  videoTerminated,
  unknown,
}

NotificationType mapCallStatusToNotificationType(String callStatus) {
  switch (callStatus) {
    case 'Accepted':
      return NotificationType.videoRespondAccepted;
    case 'Rejected':
      return NotificationType.videoRespondRejected;
    case 'Initiated':
      return NotificationType.videoCall;
    case 'Terminated':
      return NotificationType.videoTerminated;
    default:
      return NotificationType.unknown;
  }
}
