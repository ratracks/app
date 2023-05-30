import 'package:ratracks/domain/entities/enums/status_enum.dart';
import 'package:ratracks/domain/entities/enums/transporter_enum.dart';
import 'package:ratracks/domain/entities/tracking_entity.dart';

class MockTracking {
  static TrackingEntity makeEntity() {
    return TrackingEntity(
      id: 'Mocked UUID',
      createdAt: DateTime(2023, 10, 5),
      updatedAt: DateTime(2023, 10, 8),
      status: Status.inProgress,
      trackingCode: 'AA123456789BR',
      transporter: Transporter.correios,
      userId: 'Mocked UUID',
    );
  }

  static String makeReceivingJson() {
    return """
      {
        "id": "Mocked UUID",
        "createdAt": "2023-10-05T00:00:00.000",
        "updatedAt": "2023-10-08T00:00:00.000",
        "status": "in_progress",
        "trackingCode": "AA123456789BR",
        "transporter": "correios",
        "userId": "Mocked UUID"
      }
    """;
  }

  static Map<String, dynamic> makePayload() {
    return {
        "id": "Mocked UUID",
        "createdAt": "2023-10-05T00:00:00.000",
        "updatedAt": "2023-10-08T00:00:00.000",
        "status": "in_progress",
        "trackingCode": "AA123456789BR",
        "transporter": "correios",
        "userId": "Mocked UUID"
    };
  }
}
